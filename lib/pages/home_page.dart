import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tambalban_jaksel/models/detail.dart';
import 'package:tambalban_jaksel/models/tips.dart';
import 'package:tambalban_jaksel/pages/info_page.dart';
import 'package:tambalban_jaksel/pages/maps_page.dart';
import 'package:tambalban_jaksel/theme.dart';
import 'package:tambalban_jaksel/utilities/init_location.dart';
import 'package:tambalban_jaksel/widgets/populer_card.dart';
import 'package:tambalban_jaksel/widgets/tips_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Detail> details = [];

  @override
  void initState() {
    // Di eksekusi setelah build selesai
    // Untuk menghindari setState((){}) error
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Load json data
      initData();
      // Mengecek izin lokasi dan kemudian mengambil lokasi pengguna
      initUserPosition(context);
    });

    super.initState();
  }

  void initData() async {
    // Load json data
    String data =
        await DefaultAssetBundle.of(context).loadString("assets/data.json");

    // Decode json data
    final result = jsonDecode(data) as List;

    // Convert [result] with [Detail] model
    // Kemudian di masukkan ke dalam [details] dalam bentuk List<Detail>
    details = result.map((e) => Detail.fromJson(e)).toList();

    // Sortir berdasarkan rating (popularitas)
    // Dari rating tertinggi ke terendah
    details.sort((a, b) => b.rating.compareTo(a.rating));

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Padding(
        padding: EdgeInsets.only(top: edge),
        child: ListView(
          children: [
            // Dipisahkan ke dalam bentuk widget
            // Agar lebih mudah melihat struktur
            // Dan penulisan code
            // (Ctrl + click utk langsung jump ke widget)
            header(context),
            SizedBox(height: 24),
            miniMaps(context),
            SizedBox(height: 24),
            tambalBanPopuler(context),
            SizedBox(height: 10),
            blogAndTips(context),
          ],
        ),
      ),
    );
  }

  // Header Widget
  Widget header(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: edge),
      color: whiteColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selamat Datang, ',
                style: blogTextStyle.copyWith(
                  fontSize: 14,
                ),
              ),
              SizedBox(width: 2),
              Text.rich(
                TextSpan(
                  text: 'Yuk! ',
                  style: purpleTextStyle.copyWith(
                    fontSize: 12,
                  ),
                  children: [
                    TextSpan(
                      text: 'Cari tambal ban sekitar',
                      style: greyTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InfoPage(),
                ),
              );
            },
            child: Image.asset(
              'assets/info.png',
              width: 24,
            ),
          ),
        ],
      ),
    );
  }

  // Minimaps Widget
  Widget miniMaps(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: edge),
      child: Stack(
        // [Alignment.bottomCenter] Mengarahkan widget yang berada di dalam Stack ini
        // ke bawah tengah secara default
        // Dalam stack ini yang jadi korban pengarahan si [Alignment.bottomCenter]
        // adalah widget tombol cari tambal ban, jadi tinggal ditambahkan margin
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            child: Image.asset('assets/mini_maps.png'),
          ),
          Container(
            // Margin tombol
            margin: EdgeInsets.all(24),
            // [double.infinity] agar panjang tombol sepanjang widget yang membungkusnya
            // yaitu si widget Stack dan Padding
            // width: double.infinity,
            height: 50,
            child: RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyMaps(
                      details: details,
                    ),
                  ),
                );
              },
              color: btnColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(17),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  // [MainAxisAlignment.center] Centering widgets inside Row
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/search.png',
                      height: 18,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Cari Tambal Ban',
                      style: whiteTextStylebtn.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Tambal Ban Populer Widget
  Widget tambalBanPopuler(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Judul
        Padding(
          padding: EdgeInsets.symmetric(horizontal: edge),
          child: Text(
            'Tambal Ban Populer',
            style: blogTextStyle.copyWith(
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(height: 16),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: edge),
          // List tambal ban populer
          // Menggunakan [ListView.builder] untuk dapat otomatis
          // men-generate widget sebanyak data dari json
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: details.length >= 3 ? 3 : details.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, i) {
              return PopulerCard(
                // Kirim data detail ke i dari [details] ke [PopulerCard]
                details[i],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget blogAndTips(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: edge),
          child: Text(
            'Blogs & Tips',
            style: blogTextStyle.copyWith(
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(height: 16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: edge),
          child: Column(
            children: [
              TipsCard(
                Tips(
                  id: 1,
                  title: 'Tips Merawat Ban',
                  imageUrl: 'assets/tips1.png',
                  updatedAt: '11 Jan',
                ),
              ),
              //navigasi ke blog 2
              TipsCard(
                Tips(
                  id: 2,
                  title: 'Tekanan Angin',
                  imageUrl: 'assets/tips2.png',
                  updatedAt: '20 Apr',
                ),
              ),
              TipsCard(
                Tips(
                  id: 3,
                  title: 'Perbandingan Ban',
                  imageUrl: 'assets/tips3.png',
                  updatedAt: '3 Feb',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
