import 'package:auto_route/auto_route.dart';
import 'package:em_poverty/Helpers/current_location_finder.dart';
import 'package:em_poverty/storage/database_manager.dart';
import 'package:em_poverty/storage/service_provider_model.dart';
import 'package:em_poverty/uicomponent/button_component.dart';
import 'package:em_poverty/uicomponent/map_component.dart';
import 'package:em_poverty/uicomponent/multiple_choice_view.dart';
import 'package:em_poverty/uicomponent/provider_details_view.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

@RoutePage()
class CustomerScreen extends StatefulWidget {
  const CustomerScreen({super.key});

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
   final CurrentLocationFinder _currentLocationFinder = CurrentLocationFinder();
   final databaseManager = DatabaseManager();
   LatLng? _currentLocation;
   ServiceProviderModel? _selectedProvider;
   final List<String> _selectedSkills = [];
   final List<String> _allSkills = [
     "Plumber",
     "Painter",
     "Electrician",
     "Carpenter",
     "Ac Worker"];
   void _handleSkillToggle(String skill, bool isSelected) {
     setState(() {
       if (isSelected) {
         _selectedSkills.add(skill);
       } else {
         _selectedSkills.remove(skill);
       }
     });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Csutomer Screen"),
        actions: [
      IconButton(
      icon: const Icon(Icons.filter_list),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (context) {
                return DraggableScrollableSheet(
                  initialChildSize: 0.4,
                  minChildSize: 0.2,
                  maxChildSize: 0.9,
                  expand: false,
                  builder: (context, scrollController) {
                    // Wrap with StatefulBuilder
                    return StatefulBuilder(
                      builder: (BuildContext context, StateSetter setModalState) {
                        return Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          child:  ListView( // Use ListView to support scrolling/dragging
                            controller: scrollController,
                            padding: const EdgeInsets.all(20),
                            children: [
                              MultipleChoiceView(
                                allSkills: _allSkills,
                                selectedSkills: _selectedSkills,
                                onToggle: (skill, isSelected) {
                                  // 1. Update the background UI
                                  _handleSkillToggle(skill, isSelected);

                                  // 2. Update the Bottom Sheet UI (the checkmarks)
                                  setModalState(() {});
                                },
                              ),
                              ButtonComponent(title: "Close", onPress: () {
                                context.router.pop();
                              },),
                            ],
                          ),
                        );
                      },
                    );
                  },
                );
              },
            );
          },
    ),
        ],
      ),
      body: SafeArea(child:
      Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Expanded(
              flex: 4,
              child:
         FutureBuilder<List<dynamic>>(
           // Future.wait takes a list of futures and runs them in parallel
             future: Future.wait([
               _currentLocationFinder.getCurrentLocation(),
               databaseManager.getAllProviders(),
             ]),
        builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
        return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
        );
        }

        if (snapshot.hasError) {
        return Scaffold(
        body: Center(child: Text("Error: ${snapshot.error}")),
        );
        }

        // snapshot.data is now a List containing the results of both futures
        final Position userPos = snapshot.data![0] as Position;
        final List<ServiceProviderModel> providers = snapshot.data![1] as List<ServiceProviderModel>;
print("all Providers $providers");
        List<ServiceProviderModel> displayedProviders;
         if (_selectedSkills.isEmpty) {
           displayedProviders = providers;
        } else {
           displayedProviders = providers.where((provider) {
            return provider.skills.any((skill) => _selectedSkills.contains(skill));
          }).toList();
        }
        Position userLocation = userPos ;
        _currentLocation = LatLng(userPos.latitude, userPos.longitude);
        print("displayedProviders $displayedProviders");

        return MapComponent(
          userPosition: userLocation,
           allProvidersLatLong: displayedProviders,
           newLocationSelectedByProvider: (LatLng p1) {  },
           currentLocationSelection: (LatLng location) {
                setState(() {
                  _selectedProvider = null;
               _currentLocation = location;
               });
            },
          providerSelection: (LatLng location) {
            setState(() {
              _currentLocation = null;
              _selectedProvider = providers.where((provider) => provider.lat == location.latitude && provider.long == location.longitude).first;
            });
          },);
             }
        ),
        ),
            Expanded(
              flex: 2,
                child:
                _selectedProvider == null
                    ?  _currentLocation != null
                           ? ProviderDetailsView(
                             title: "User Current Location",
                              lat: _currentLocation!.latitude,
                               long: _currentLocation!.longitude,)
                            : Text("Details Not available")
                    : ProviderDetailsView(
                    title: "Provider Details",
                    name: _selectedProvider!.name,
                    lat: _selectedProvider!.lat,
                    long: _selectedProvider!.long,
                  phoneNumber: _selectedProvider!.phonenumber,
                  skills: _selectedProvider!.skills,
                ),

            )
          ]
      ),
      )
      ),
    );
  }
}