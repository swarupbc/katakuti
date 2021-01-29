import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('You are Playing'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'K',
                    style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 50.0,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1,
                      fontFamily: 'dancing',
                    ),
                  ),
                  Text(
                    'ata',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1,
                      fontFamily: 'dancing',
                    ),
                  ),
                  Text(
                    'K',
                    style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 50.0,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1,
                      fontFamily: 'dancing',
                    ),
                  ),
                  Text(
                    'uti',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1,
                      fontFamily: 'dancing',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
              CircleAvatar(
                maxRadius: 100.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      100.0,
                    ),
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/swarup.jpeg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 25, 0, 10),
                child: Text('Developed by'),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Text(
                  'Swarup Bhanja Chowdhury',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                icon: FaIcon(FontAwesomeIcons.github),
                onPressed: _launchURL,
              ),
              Text(
                'Open Source Application built using Flutter',
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                width: 200.0,
                child: Divider(
                  thickness: 2.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Donate Me',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightGreen,
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Icon(
                    FontAwesomeIcons.donate,
                    color: Colors.lightGreen,
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: SelectableText(
                  "swarupbhanjachowdhury-2@okaxis",
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ),
              Text(
                'Long Press to Copy',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _launchURL() async {
    const url = 'https://flutter.dev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
