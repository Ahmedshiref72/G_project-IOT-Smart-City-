import 'package:flutter/material.dart';
import 'package:smart_city/modules/password/gatePassword.dart';
import 'package:smart_city/shared/components/components.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About Us '),),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text('Connect Us',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
            SizedBox(
              height: 50,
            ),
            TextButton(onPressed: ()async
            {
              const url = "https://flutter.io";
              if (await canLaunch(url) != null)
                await launch(url);
              else
                // can't launch url, there is some error
                throw "Could not launch $url";

            },
                child: Text('Ahmed Ehab Abd Elmonim',
                  style:TextStyle(
                      fontSize: 20
                  ) ,)),

            TextButton(
                onPressed: ()async
            {
              const url = "https://flutter.io";
              if (await canLaunch(url) != null)
                await launch(url);
              else
                // can't launch url, there is some error
                throw "Could not launch $url";

            },
                child: Text('Ahmed Mohamed Abdo',
            style:TextStyle(
              fontSize: 20
            ) ,)),
            TextButton(onPressed: ()async
            {
              const url = "https://flutter.io";
              if (await canLaunch(url) != null)
                await launch(url);
              else
                // can't launch url, there is some error
                throw "Could not launch $url";

            },
                child: Text('Ahmed Mohamed Shiref',
            style:TextStyle(
              fontSize: 20
            ) ,)),
            TextButton(
                onPressed: ()async
            {
              const url = "https://flutter.io";
              if (await canLaunch(url) != null)
                await launch(url);
              else
                // can't launch url, there is some error
                throw "Could not launch $url";

            },
                child: Text('Abdelrazek Ali Abdelrazek',
                  style:TextStyle(
                      fontSize: 20
                  ) ,)),
            TextButton(onPressed: ()async
            {
              const url = "https://flutter.io";
              if (await canLaunch(url) != null)
                await launch(url);
              else
                // can't launch url, there is some error
                throw "Could not launch $url";

            },
                child: Text('Nada Tamer Shouman',
            style:TextStyle(
              fontSize: 20
            ) ,)),
            TextButton(onPressed: ()async
            {
              const url = "https://flutter.io";
              if (await canLaunch(url) != null)
                await launch(url);
              else
                // can't launch url, there is some error
                throw "Could not launch $url";

            },
                child: Text('Mai Mahmoud Morshed',
            style:TextStyle(
              fontSize: 20
            ) ,)),

          ],
        ),
      ),

    );}

}








/*()async
          {
            const url = "https://flutter.io";
            if (await canLaunch(url) != null)
            await launch(url);
            else
            // can't launch url, there is some error
            throw "Could not launch $url";
          },*/