import 'package:auto_route/auto_route.dart';
import 'package:em_poverty/Helpers/current_location_finder.dart';
import 'package:em_poverty/storage/database_manager.dart';
import 'package:em_poverty/storage/service_provider_model.dart';
import 'package:em_poverty/uicomponent/map_component.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Csutomer Screen"),
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
        // final firstProviders = providers;
        Position userLocation = userPos ;
        _currentLocation = LatLng(userPos.latitude, userPos.longitude);

        return MapComponent(
          userPosition: userLocation,
           allProvidersLatLong: providers,
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