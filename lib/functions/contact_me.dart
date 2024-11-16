import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

// The method for the link to whatsapp feature
_launchWhatsapp() async {
  var contact = "+2347050250008"; 
  var androidUrl = "whatsapp://send?phone=$contact&text=Hi there";
  var iosUrl = "https://wa.me/$contact?text=${Uri.parse('Hi there. ')}";

  try {
    if (Platform.isIOS) {
      await launchUrl(Uri.parse(iosUrl));
    } else {
      await launchUrl(Uri.parse(androidUrl));
    }
  } on Exception {
    EasyLoading.showError('WhatsApp is not installed.');
  }
}

// The method for contact button bottom sheet
Future contactButton(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.web),
              title: const Text('Whatsapp'),
              onTap: () {
                _launchWhatsapp();
              },
            ),
            ListTile(
              leading: const Icon(Icons.email),
              title: const Text('Gmail'),
              onTap: () async {
                String? encodeQueryParameters(Map<String, String> params) {
                  params.entries
                      .map((MapEntry<String, String> e) =>
                          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                      .join('&');
                  // return null;
                }

                final Uri emailLaunchUri = Uri(
                    scheme: 'mailto',
                    path: 'soaresayoigbala@gmail.com',
                    query: encodeQueryParameters(
                        <String, String>{'Contact': 'Hi there!'}));

                // if (await launchUrl(emailLaunchUri)) {
                //   launchUrl(emailLaunchUri);
                // } else {
                //   throw Exception('Could not launch $emailLaunchUri');
                // }

                try {
                  await launchUrl(emailLaunchUri);
                } catch (e) {
                  // print(e.toString());
                }
              },
            )
          ],
        );
      }
    );
}
