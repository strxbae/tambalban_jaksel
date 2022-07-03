import 'package:flutter/material.dart';
import 'package:tambalban_jaksel/models/detail.dart';
import 'package:tambalban_jaksel/pages/detail_page.dart';
import 'package:tambalban_jaksel/theme.dart';

class PopulerCard extends StatelessWidget {
  final Detail detail;

  PopulerCard(this.detail);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(detail: detail),
              ),
            );
          },
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Container(
                  width: 130,
                  height: 110,
                  child: Stack(
                    children: [
                      Container(
                        width: 130,
                        height: 110,
                        color: Colors.black12,
                        child: Image.network(
                          detail.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 80,
                          height: 30,
                          decoration: BoxDecoration(
                            color: purpleColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(36),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icon_star.png',
                                width: 18,
                                height: 18,
                              ),
                              Text(
                                // '${detail.rating}/5',
                                '${detail.rating}/5',
                                style: whiteTextStyle.copyWith(
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      detail.name,
                      style: blogTextStyle.copyWith(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text.rich(
                      TextSpan(
                        text:
                            '${detail.isTubeType ? detail.priceTubtype : detail.priceTubles}K',
                        style: purpleTextStyle.copyWith(
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text: ' / Ban',
                            style: greyTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      '${detail.urbanVillage}, ${detail.distric}',
                      maxLines: 3,
                      style: greyTextStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 24),
      ],
    );
  }
}
