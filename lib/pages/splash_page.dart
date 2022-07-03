import 'package:flutter/services.dart';
import 'package:tambalban_jaksel/pages/home_page.dart';
import 'package:tambalban_jaksel/theme.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset('assets/splash.png'),
          ),
          Padding(
            padding: EdgeInsets.only(top: 55, left: 21),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 59.53,
                  width: 77,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/logo.png'),
                    ),
                  ),
                ),
                SizedBox(height: 15.65),
                Text(
                  'Bingung Cari Tambal Ban\ndi Jaksel ',
                  style: blogTextStyle.copyWith(
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Stop membuang waktu\nuntuk mencari tempat tambal ban \nketika mengalami kendala berkendara \ndi Jakarta Selatan',
                  style: greyTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  width: 210,
                  height: 50,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    },
                    color: btnColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: Text(
                      'Explore Now',
                      style: whiteTextStylebtn.copyWith(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
