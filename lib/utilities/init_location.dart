///{TAMPILAN SEBELUM PAKAI GELOCATOR}
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../theme.dart';

// Inisial posisi pengguna
// Di gunakan saat masuk ke [HomePage]
Position initPosition;

LocationPermission permission;

void initUserPosition(BuildContext context) async {
  await getPermission(context).catchError((e) {
    print(e);
    getPermission(context);
  });

  Position position = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );

  initPosition = position;
}

Future getPermission(BuildContext context) async {
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

  if (serviceEnabled) {
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      await reqPermissionDialog(context);
    }
  } else {
    await reqPermissionDialog(context);
  }

  return;
}

Future reqPermissionDialog(BuildContext context) async {
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        title: Center(
          child: Text(
            'Akses Lokasi',
            style: blogTextStyle.copyWith(
              fontSize: 22,
            ),
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Untuk dapat melanjutkan, mohon izinkan aplikasi untuk mendapatkan akses lokasi pada perangkat Anda',
              textAlign: TextAlign.center,
              style: regularTextStyle.copyWith(
                fontSize: 14,
              ),
            ),
            SizedBox(height: 18),
            Container(
              height: 44,
              child: RaisedButton(
                color: btnColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17),
                ),
                child: Text(
                  'Izinkan',
                  textAlign: TextAlign.center,
                  style: whiteTextStylebtn.copyWith(
                    fontSize: 16,
                  ),
                ),
                onPressed: () async {
                  permission = await Geolocator.requestPermission();
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}
