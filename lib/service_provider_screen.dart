import 'package:auto_route/auto_route.dart';
import 'package:em_poverty/route/app_router.gr.dart';
import 'package:em_poverty/storage/database_manager.dart';
import 'package:em_poverty/storage/service_provider_model.dart';
import 'package:em_poverty/uicomponent/alert_view.dart';
import 'package:em_poverty/uicomponent/map_component.dart';
import 'package:em_poverty/uicomponent/multiple_choice_view.dart';
import 'package:em_poverty/uicomponent/textfield_view.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
@RoutePage()
class ServiceProviderScreen extends StatefulWidget {
  const ServiceProviderScreen({super.key});

  @override
  State<ServiceProviderScreen> createState() => _ServiceProviderScreenState();
}

class _ServiceProviderScreenState extends State<ServiceProviderScreen> {
  final List<String> _allOptions = [
    "Plumber",
    "Painter",
    "Electrician",
    "Carpenter",
    "Ac Worker"];
  final TextEditingController _nameFieldController = TextEditingController();
  final TextEditingController _phoneNumberFieldController = TextEditingController();
  final databaseManager = DatabaseManager();
  LatLng? _selectedLocation;
  //
  // void onLocationSelected(LatLng latLng) {
  //   setState(() {
  //     selectedLocation = latLng;
  //   });

    List<String> _mySelectedSkills = [];

    void _handleSkillToggle(String skill, bool isSelected) {
      setState(() {
        if (isSelected) {
          _mySelectedSkills.add(skill);
        } else {
          _mySelectedSkills.remove(skill);
        }
      });
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(title: Text("Provider Enrollment Page")),
          body: SafeArea(child:
          Padding(
            padding: EdgeInsets.all(20),
            child:
            Column(
              mainAxisAlignment: .spaceEvenly,
              children: [
                MultipleChoiceView(
                  allSkills: _allOptions,
                  selectedSkills: _mySelectedSkills,
                  onToggle: _handleSkillToggle,
                ),
                DisplayTextFieldWidget(
                  inputController: _nameFieldController,
                  placeHolder: "Please Enter Goal Name",
                  title: "Enter Goal Name",
                ),
                DisplayTextFieldWidget(
                  inputController: _phoneNumberFieldController,
                  placeHolder: "Please Enter Your Phone Number",
                  title: "Enter Your Phone Number",
                ),
                Row(
                  mainAxisAlignment: .spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        // MapComponent(
                        //   selectedLocation: selectedLocation,
                        //   onLocationSelected: onLocationSelected,
                        //   userPosition: Pos,
                        // );
                        final result = await context.router.push(PickLocation());;

                        print("Value received $result");
                        // 2. Check if we actually got a value back
                        if (result != null && result is LatLng) {
                          setState(() {
                            _selectedLocation = result ; // Update your local state with the returned value
                          });
                        }

                      },
                      child: const Text("Pick Location"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        ServiceProviderModel _model = ServiceProviderModel(
                            name: _nameFieldController.text,
                            skills: _mySelectedSkills,
                            lat: _selectedLocation?.longitude ?? 1101,
                            long: _selectedLocation?.longitude ?? 1098,
                            phonenumber: _phoneNumberFieldController.text);
                        databaseManager.addNewProvider(model: _model);
                        showDialog(
                          context: context,
                          builder: (context) =>
                              AlertView(
                                title: "Success",
                                message: "Your Details stored successfully",
                                okAction: () {
                                  context.router.pop();
                                },
                                cancelAction: () {},
                              ),
                        );
                      },
                      child: const Text("Save"),
                    )
                  ],)

              ],
            ),
          )
          )


      );
    }
  }
