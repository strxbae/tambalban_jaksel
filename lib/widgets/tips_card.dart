import 'package:flutter/material.dart';
import 'package:tambalban_jaksel/models/tips.dart';
import 'package:tambalban_jaksel/pages/tips_dua_page.dart';
import 'package:tambalban_jaksel/pages/tips_satu_page.dart';
import 'package:tambalban_jaksel/pages/tips_tiga_page.dart';
import 'package:tambalban_jaksel/theme.dart';

class TipsCard extends StatelessWidget {
  final Tips tips;

  TipsCard(this.tips);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            if (tips.id == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TipsSatuPage(),
                ),
              );
            }
            if (tips.id == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TipsDuaPage(),
                ),
              );
            }
            if (tips.id == 3) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TipsTigaPage(),
                ),
              );
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    tips.imageUrl,
                    width: 80,
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tips.title,
                        style: blogTextStyle.copyWith(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Diperbaharui ${tips.updatedAt}',
                        style: greyTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
              Icon(
                Icons.chevron_right,
                color: greyColor,
              ),
            ],
          ),
        ),
        SizedBox(height: 24),
      ],
    );
  }
}
