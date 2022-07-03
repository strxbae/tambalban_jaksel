import 'package:flutter/material.dart';
import '../theme.dart';

class TipsSatuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            Padding(
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
                        'Blog & Tips',
                        style: blackTextStyleInfo.copyWith(
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Tips Merawat Ban',
                    style: purpleTextStyle.copyWith(
                      //impor dari theme
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'Diperbaharui 11 Jan',
                    style: greyTextStyle,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Image.asset(
                      'assets/tips_thumbnail1.png',
                      width: 286,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    child: Text(
                      '       Ban menjadi salah satu komponen pada kendaraan yang harus selalu diperhatikan. Mengingat dengan adanya ban ini, kendaraan yang kamu gunakan dapat berjalan dan digunakan pergi kemana saja. Selain itu, sebuah ban juga memiliki usia penggunaannya tersendiri. Sehingga, jika suatu ban sudah aus atau licin dan tak lagi dapat menemani perjalanan berkendaramu dengan baik, maka mungkin sudah saatnya untuk mengganti ban \n\nBerikut beberapa tips untuk merawat ban :',
                      style: blackTextStyleInfo.copyWith(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 24,
                            child: Text(
                              '1.',
                              style: blackTextStyleInfo.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Container(
                            // height: 200, ga ngaruh
                            child: Text(
                              'Pastikan ukuran ban sesuai standar \nbawaan pabrik',
                              style: blackTextStyleInfo.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 24,
                            child: Text(
                              '2.',
                              style: blackTextStyleInfo.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Container(
                            // height: 200, ga ngaruh
                            child: Text(
                              'Selalu perhatikan kondisi pentil ban',
                              style: blackTextStyleInfo.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 24,
                            child: Text(
                              '3.',
                              style: blackTextStyleInfo.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Container(
                            // height: 200, ga ngaruh
                            child: Text(
                              'Hindari memberikan beban motor \nyang melebihi batas',
                              style: blackTextStyleInfo.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 24,
                            child: Text(
                              '4.',
                              style: blackTextStyleInfo.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Container(
                            // height: 200, ga ngaruh
                            child: Text(
                              'Pastikan tekanan ban sesuai \nyang ditentukan',
                              style: blackTextStyleInfo.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 24,
                            child: Text(
                              '5.',
                              style: blackTextStyleInfo.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Container(
                            // height: 200, ga ngaruh
                            child: Text(
                              'Bersihkan ban secara rutin',
                              style: blackTextStyleInfo.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 24,
                            child: Text(
                              '6.',
                              style: blackTextStyleInfo.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Container(
                            // height: 200, ga ngaruh
                            child: Text(
                              'Hindari memarkirkan motor \ndibawah terik matahari terlalu lama',
                              style: blackTextStyleInfo.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 24,
                            child: Text(
                              '7.',
                              style: blackTextStyleInfo.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Container(
                            // height: 200, ga ngaruh
                            child: Text(
                              'Hindari melakukan Rem mendadak',
                              style: blackTextStyleInfo.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
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
