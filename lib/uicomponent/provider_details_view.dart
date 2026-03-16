import 'package:em_poverty/Helpers/address_Provider.dart';
import 'package:em_poverty/storage/service_provider_model.dart';
import 'package:em_poverty/uicomponent/title_and_details_display_view.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProviderDetailsView extends StatelessWidget {
  final String title;
  final String? name;
  final double lat;
  final double long;
  final String? phoneNumber;
  final List<String>? skills;

  const ProviderDetailsView({
    super.key,
    required this.title,
    required this.lat,
    required this.long,
    this.name,
    this.phoneNumber,
    this.skills

  });

  @override
  Widget build(BuildContext context) {
    AddressProvider _addressProvider = AddressProvider(lat, long);
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        if (name != null)
          TitleAndDetailsDisplayView(title: "Name: ", details: name!),
        // 1. Use FutureBuilder for the async Address/DisplayName
        FutureBuilder<String>(
          future: _addressProvider.address,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const TitleAndDetailsDisplayView(
                title: "Address: ",
                details: "Fetching new address...",
              );
            }

            final address = snapshot.data ?? "Address unavailable";
            return TitleAndDetailsDisplayView(title: "Address: ", details: address);
          },
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center, // Fixed syntax: added MainAxisAlignment
          children: phoneNumber == null
              ? []
              :  [
            const Text("Phone Number: ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            OutlinedButton(
              onPressed: () async {
                final Uri launchUri = Uri(
                  scheme: 'tel',
                  path: phoneNumber, // Ensure this is a string
                );

                if (await canLaunchUrl(launchUri)) {
                  await launchUrl(launchUri);
                } else {
                  debugPrint('Could not launch $launchUri');
                }
              },
              child: Text(phoneNumber!,
                  style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 15)),
            ),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center, // Fixed syntax
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  skills == null
              ? []
              : [
            const Text("Skills: ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: skills!
                  .map((item) => Text(" $item ", style: const TextStyle(fontSize: 15)))
                  .toList(),
            ),
          ],
        ),
      ],
    );
  }
}