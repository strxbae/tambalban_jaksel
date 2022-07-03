import 'package:flutter/material.dart';

import '../theme.dart';

class TipsTigaPage extends StatelessWidget {
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
                    'Perbandingan Ban Tubeless dan Tubetype',
                    style: purpleTextStyle.copyWith(
                      //impor dari theme
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'Diperbaharui 3 Feb',
                    style: greyTextStyle,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Image.asset(
                      'assets/tips_thumbnail3.png',
                      width: 286,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    child: Text(
                      '       Terdapat 2 tipe ban yang di jual di pasaran yaitu ban Tubtype (biasa) dan tubeless. Kedua ban teresbut memiliki karakterisitik masing - masing\n\nBerikut beberapa perbedaan antara Ban Tubeless dan Tubtype :',
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
                            '1. Harga',
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 12,
                    ),
                    child: Text(
                      'Tentunya dua ban ini memiliki perbedaan harga yang cukup signifikan. Ban tubeless lebih mahal daripada versi biasa, karena hanya perlu diganti kalau memang sudah menipis. Kemudian kalau tertancap benda tajam seperti paku, Anda bisa melakukan penambalan sendiri dengan cepat menggunakan lem khusus. Berbanding terbalik dengan ban biasa yang kalau sudah tertusuk benda tajam langsung bocor dan harus Anda bawa ke tukang tambal.',
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
                            '2. Material Ban',
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 12,
                    ),
                    child: Text(
                      'Pada dasarnya memang sama-sama menggunakan karet, tapi ada sedikit perbedaan. Ban tubeless menggunakan lapisan fluid sealant yang mempertahankan kerapatan ban. Material ini akan merapat ketika terjadi kebocoran, berbeda dengan ban biasa yang menggunakan ban dalam.',
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
                            '3. Komponen Ban',
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 12,
                    ),
                    child: Text(
                      'Komponen ban tubeless hanya terdiri dari ban dan velg saja. Namun untuk ban biasa jauh lebih banyak. Ada komponen ban dalam, velg, ban luar, flap, hingga lock ring. Versi tubeless memang lebih simpel namun tetap modern karena didukung lapisan fluid sealant sebagai pengganti ban dalam.',
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
                            '4. Durabilitas',
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 12,
                    ),
                    child: Text(
                      'Ban tubeless lebih kuat dari sisi daya tahan. Karakter ban tubeless lebih kokoh hingga cocok untuk melewati berbagai jenis medan jalan.\n\nNamun ada perbedaan yang kali ini membuat ban biasa terlihat lebih unggul. Ban biasa lebih mampu meredam berbagai jenis getaran. Mengapa bisa begitu? Karena ada tambahan bantalan dari ban dalam. Inilah yang membuat kenyamanan ban biasa lebih baik ketika melewati jalan aspal dan dalam kecepatan rendah. Tapi jika sudah melewati jalanan berbatu menjadi lebih riskan rusak.',
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
                            '5. Kenyamanan Ban',
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 12,
                    ),
                    child: Text(
                      'Ban biasa yang tekanan anginnya keras tetap membawa rasa nyaman selama berkendara . Sebaliknya ban tubeless yang kelebihan tekanan angin sangat terasa keras ketika dipakai. Di jalan basan juga ban biasa lebih aman dan kuat dibandingkan dengan ban tubeless.',
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
                            '6. Kebocoran Ban',
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 12,
                    ),
                    child: Text(
                      'Perbedaan ban tubeless dan ban biasa juga ada dari sisi kebocoran. Mengtasi kebocoran ban tubeless sangat mudah. Cukup mencabut penyebab kebocoran dan memberikan cairan anti bocor. Namun, kalau bocor parah hingga kehabisan angin, tidak banyak yang dapat memperbaikinya.\n\nBerbanding terbalik dengan ban biasa yang memang lebih riskan langsung bocor ketika tertancap benda tajam namun mayoritas bengkel pasti bisa menambalnya.',
                      style: blackTextStyleInfo.copyWith(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.justify,
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
