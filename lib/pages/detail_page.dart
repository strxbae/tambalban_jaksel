import 'package:flutter/material.dart';
import 'package:tambalban_jaksel/models/detail.dart';
import 'package:tambalban_jaksel/pages/error_page.dart';
import 'package:tambalban_jaksel/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  final Detail detail;

  DetailPage({this.detail});

  @override
  Widget build(BuildContext context) {
    launchUrl(String url) async {
      if (await canLaunch(url)) {
        launch(url);
      } else {
        // throw (url);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ErrorPage(),
            ));
      }
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.network(
              detail.imageUrl,
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                SizedBox(
                  height: 328,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: whiteColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      ////NOTE : TITLE
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              detail.name,
                              style: blogTextStyle.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 22,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                        text: '${detail.priceTubles}K',
                                        style: purpleTextStyle.copyWith(
                                          fontSize: 16,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: ' - Tubeless',
                                            style: greyTextStyle.copyWith(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Jika [isTubeType] true, tampilkan harga
                                    // Jika tidak, hilangkan harga
                                    detail.isTubeType
                                        ? Text.rich(
                                            TextSpan(
                                              text: '${detail.priceTubtype}K',
                                              style: purpleTextStyle.copyWith(
                                                fontSize: 16,
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: ' - Tubetype',
                                                  style: greyTextStyle.copyWith(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        : SizedBox.shrink(),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ////NOTE : FASILITAS
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        child: Text(
                          'Fasilitas',
                          style: regularTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: edge,
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 60,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        width: 1.0, color: Color(0xffE7E7E7)),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      child: Stack(
                                        children: [
                                          Image.asset(
                                            'assets/icon_day.png',
                                            width: 36,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        top: 10,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${detail.open} - ${detail.close}',
                                            style: blogTextStyle.copyWith(
                                              fontSize: 14,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            detail.ketDay,
                                            style: greyTextStyle.copyWith(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              ///NOTE : TIME
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 60,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        width: 1.0, color: Color(0xffE7E7E7)),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      child: Stack(
                                        children: [
                                          Image.asset(
                                            'assets/icon_time.png',
                                            width: 36,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        top: 10,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${detail.estimation} Menit',
                                            style: blogTextStyle.copyWith(
                                              fontSize: 14,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            'Estimasi selesai dalam ${detail.estimation} menit',
                                            style: greyTextStyle.copyWith(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              /// NOTE : SERVIS
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 80,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        width: 1.0, color: Color(0xffE7E7E7)),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      child: Stack(
                                        children: [
                                          Image.asset(
                                            'assets/icon_service.png',
                                            width: 32,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 22,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        top: 10,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Servis',
                                            style: blogTextStyle.copyWith(
                                              fontSize: 14,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                120,
                                            child: Text(
                                              detail.ketService,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: greyTextStyle.copyWith(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),

                ///NOTE : LOKASI
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: edge,
                  ),
                  child: Text(
                    'Lokasi',
                    style: regularTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: edge,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${detail.address},\n${detail.urbanVillage}, ${detail.distric}',
                        style: greyTextStyle,
                      ),
                      Container(
                        width: 65,
                        height: 65,
                        child: RaisedButton(
                          color: btnColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17),
                          ),
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              // Border radius modal bottom sheet
                              // tidak bisa dihandle menggunakan Container
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(18),
                                  topRight: Radius.circular(18),
                                ),
                              ),
                              builder: (context) {
                                return Container(
                                  height: MediaQuery.of(context).size.height *
                                      (40 / 100),
                                  // color: whiteColor,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 50,
                                  ),

                                  child: Column(
                                    children: [
                                      Text(
                                        'Menuju Lokasi ?',
                                        style: blogTextStyle.copyWith(
                                          fontSize: 22,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Text(
                                        'Anda akan diarahkan\nmenggunakan Google Maps.',
                                        style: greyTextStyle.copyWith(
                                          fontSize: 16,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Container(
                                        width: 211,
                                        height: 55,
                                        child: RaisedButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          color: btnColor,
                                          onPressed: () {
                                            launchUrl(
                                              detail.mapUrl,
                                              // tes eroor
                                              // 'asdkfjh asdfasdf'
                                            );
                                          },
                                          child: Text(
                                            'Lanjutkan',
                                            style: whiteTextStylebtn.copyWith(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Image.asset(
                            'assets/direc.png',
                            width: 65,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
              ],
            ),

            ///NOTE : UNTUK BUTON NAVIGASI ATAS DI PINDAH KE BAWAH AGAR TIDAK KE TUMPUK STACK
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
                vertical: 30,
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/btn_back.png',
                      width: 40,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
