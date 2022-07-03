import 'package:flutter/material.dart';

import '../theme.dart';

class TipsDuaPage extends StatelessWidget {
  // const BlogSatuPage({ Key? key }) : super(key: key);

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
                    'Tekanan Angin Yang Baik Untuk Ban',
                    style: purpleTextStyle.copyWith(
                      //impor dari theme
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'Diperbaharui 20 Apr',
                    style: greyTextStyle,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Image.asset(
                      'assets/tips_thumbnail2.png',
                      width: 286,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    child: Text(
                      '       Jangan anggap remeh tekanan angin pada ban motor karena jika terjadi masalah maka keselamatan akan terancam. Bagian yang satu ini seringkali lepas dari perhatian, bahkan beberapa pengendara mengabaikan masalah pada ban. Salah satu kesalahan yang paling sering temukan adalah membiarkan ban kekurangan atau kelebihan tekanan angin. Padahal kondisi ini bisa sangat membahayakan meski saat berkendara dalam kecepatan lambat.\n\nBerikut daftar tekanan angin ban motor yang ideal :',
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
                        children: [
                          Text(
                            '1. Motor Matik',
                            style: blogTextStyle.copyWith(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    '   Sendirian',
                    style: blackTextStyleInfo.copyWith(
                              fontSize: 16,
                            ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 36,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Depan',
                                  style: blackTextStyleInfo.copyWith(
                              fontSize: 16,
                            ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 23,
                            ),
                            Column(
                              children: [
                                Text(
                                  ': 29 psi',
                                  style: blackTextStyleInfo.copyWith(
                              fontSize: 16,
                            ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Belakang',
                                  style: blackTextStyleInfo.copyWith(
                              fontSize: 16,
                            ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Column(
                              children: [
                                Text(
                                  ': 33 psi',
                                  style: blackTextStyleInfo.copyWith(
                              fontSize: 16,
                            ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '   Berboncengan',
                    style: blackTextStyleInfo.copyWith(
                              fontSize: 16,
                            ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 36,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Depan',
                                  style: blackTextStyleInfo.copyWith(
                              fontSize: 16,
                            ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 23,
                            ),
                            Column(
                              children: [
                                Text(
                                  ': 29 psi',
                                  style: blackTextStyleInfo.copyWith(
                              fontSize: 16,
                            ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Belakang',
                                  style: blackTextStyleInfo.copyWith(
                              fontSize: 16,
                            ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Column(
                              children: [
                                Text(
                                  ': 36 psi',
                                  style: blackTextStyleInfo.copyWith(
                              fontSize: 16,
                            ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            '2. Motor Bebek',
                            style: blogTextStyle.copyWith(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    '     Sendirian',
                    style: blackTextStyleInfo.copyWith(
                              fontSize: 16,
                            ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 36,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Depan',
                                  style: blackTextStyleInfo.copyWith(
                              fontSize: 16,
                            ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 23,
                            ),
                            Column(
                              children: [
                                Text(
                                  ': 29 psi',
                                  style: blackTextStyleInfo.copyWith(
                              fontSize: 16,
                            ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Belakang',
                                  style: blackTextStyleInfo.copyWith(
                              fontSize: 16,
                            ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Column(
                              children: [
                                Text(
                                  ': 31 psi',
                                  style: blackTextStyleInfo.copyWith(
                              fontSize: 16,
                            ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '    Berboncengan',
                    style: blackTextStyleInfo.copyWith(
                              fontSize: 16,
                            ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 36,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Depan',
                                  style: blackTextStyleInfo.copyWith(
                              fontSize: 16,
                            ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 23,
                            ),
                            Column(
                              children: [
                                Text(
                                  ': 30 psi',
                                  style: blackTextStyleInfo.copyWith(
                              fontSize: 16,
                            ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Belakang',
                                  style: blackTextStyleInfo.copyWith(
                              fontSize: 16,
                            ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Column(
                              children: [
                                Text(
                                  ': 33 psi',
                                  style: blackTextStyleInfo.copyWith(
                              fontSize: 16,
                            ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            '3. Motor Sport',
                            style: blogTextStyle.copyWith(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    '     Sendirian',
                    style: blackTextStyleInfo.copyWith(
                              fontSize: 16,
                            ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 36,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Depan',
                                  style: blackTextStyleInfo.copyWith(
                              fontSize: 16,
                            ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 23,
                            ),
                            Column(
                              children: [
                                Text(
                                  ': 32 psi',
                                  style: blackTextStyleInfo.copyWith(
                              fontSize: 16,
                            ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Belakang',
                                  style: blackTextStyleInfo.copyWith(
                              fontSize: 16,
                            ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Column(
                              children: [
                                Text(
                                  ': 39 psi',
                                  style: blackTextStyleInfo.copyWith(
                              fontSize: 16,
                            ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '     Berboncengan',
                    style: blackTextStyleInfo.copyWith(
                              fontSize: 16,
                            ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 36,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Depan',
                                  style: blackTextStyleInfo.copyWith(
                              fontSize: 16,
                            ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 23,
                            ),
                            Column(
                              children: [
                                Text(
                                  ': 34 psi',
                                  style: blackTextStyleInfo.copyWith(
                              fontSize: 16,
                            ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Belakang',
                                  style: blackTextStyleInfo.copyWith(
                              fontSize: 16,
                            ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Column(
                              children: [
                                Text(
                                  ': 41 psi',
                                  style: blackTextStyleInfo.copyWith(
                              fontSize: 16,
                            ),
                                ),
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
                  Container(
                    child: Text(
                      '      Dikarenakan setiap motor memiliki tipe yang berbeda, maka jika ingin mengetahui detail lengkap tekanan angin untuk motor anda bisa di lihat di dashboard depan (di bawah stang) atau juga biasanya terdapat pada bagian Bagasi',
                      style: blackTextStyleInfo.copyWith(
                              fontSize: 16,
                            ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  SizedBox(
                    height: 30,
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
