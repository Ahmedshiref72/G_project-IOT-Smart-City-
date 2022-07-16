import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About Us '),),
      body: Center(
        child: TextButton(
          onPressed: ()async
          {
            const url = "https://flutter.io";
            if (await canLaunch(url) != null)
            await launch(url);
            else
            // can't launch url, there is some error
            throw "Could not launch $url";
          },
          child: Text('Ahmed'),
        ),
      ),
    );}
 Future _launchURL() async {
    const url = 'https://google.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}