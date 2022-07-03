import 'package:flutter/material.dart';
import 'package:tambalban_jaksel/theme.dart';

class InfoPage extends StatelessWidget {
  // const SplashPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: edge,
            vertical: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/btn_back_info.png',
                      width: 40,
                    ),
                  ),
                  SizedBox(width: 70),
                  Text(
                    'Informasi',
                    style: blackTextStyleInfo.copyWith(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 42,
              ),
              Text(
                'Panduan penggunaan aplikasi : ',
                style: purpleTextStyle.copyWith(
                  //impor dari theme
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 22,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        '1.',
                        style: greyTextStyle.copyWith(fontSize: 14),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        ' Buka aplikasi Tambal Ban Jaksel',
                        style: greyTextStyle.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      Text(
                        '2.',
                        style: greyTextStyle.copyWith(fontSize: 14),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        'Klik Explore Now pada Splash Screen',
                        style: greyTextStyle.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      Text(
                        '3.',
                        style: greyTextStyle.copyWith(fontSize: 14),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        'Klik Button Cari Tambal Ban kemudian \npilih salah satu tag lokasi',
                        style: greyTextStyle.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      Text(
                        '4.',
                        style: greyTextStyle.copyWith(fontSize: 14),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        'klik Details untuk melihat lebih lengkap\nmengenai informasi tempat',
                        style: greyTextStyle.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      Text(
                        '5.',
                        style: greyTextStyle.copyWith(fontSize: 14),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        'klik Button Direction, dan konfirmasi untuk \nmembuka aplikasi google maps yang \nakan mengarahkan anda ke tujuan.',
                        style: greyTextStyle.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 540
                  ),
                ],
              ),
              Center(
                child: Container(
                  width: 238,
                  height: 89,
                  child: Image.asset('assets/created.png')),
              ),
              // SizedBox(
              //   height: 200,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
