import 'dart:async';
import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tambalban_jaksel/models/detail.dart';
import 'package:tambalban_jaksel/pages/detail_page.dart';
import 'package:tambalban_jaksel/utilities/init_location.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart' as poly;

import '../theme.dart';

class MyMaps extends StatefulWidget {
  final List<Detail> details;

  MyMaps({this.details});

  @override
  State<MyMaps> createState() => _MyMapsState();
}

class _MyMapsState extends State<MyMaps> {
  // API Key
  String mapsApiKey = "AIzaSyA1MgLuZuyqR_OGY3ob3M52N46TDBRI_9k";

  final geoLocator = Geolocator();

  // Maps Controller
  GoogleMapController mapsController;

  // CarouselSlider Controller
  CarouselController carouselController = CarouselController();

  // User current position
  Position currentPosition = initPosition;

  // Initial camera position
  CameraPosition initialCameraPosition = CameraPosition(
    target: initPosition != null
        ? LatLng(initPosition.latitude, initPosition.longitude)
        : LatLng(-6.2838182, 106.8048632),
    zoom: 16,
  );

  // List data tambal ban yang sudah di parse dari [HomePage]
  List<Detail> tambalBanList = [];

  // Marker icons
  BitmapDescriptor startMarkerIcon;
  BitmapDescriptor destinationMarkerIcon;

  // Untuk menampung semua marker lokasi tambal ban
  Set<Marker> markers = {};

  // Untuk menampung polylines points
  Map<PolylineId, Polyline> polylines = {};
  // Untuk menampung polylines coordinates
  List<LatLng> polylineCoordinates = [];

  // Digunakan untuk validasi cardinal ketka akan melakukan [animateMapsCamera] || [animateMapsCameraByLatLngBounds]
  double strLocLat;
  double strLocLong;
  double dstLocLat;
  double dstLocLong;

  // [markerTapped] untuk kontrol [onPageChange]
  // agar tidak mengeksekusi [showRoute] jika
  // marker [tambalBanList] di tap
  // Intinya mencegah [showRoutes] terpanggil serentak
  bool markerTapped = false;

  // [isRouteCreated] untuk kontrol [showRoutes]
  // Untuk mencegah [showRoutes] terpanggil serentak
  // Khusus utk case ketika [CarouselSlider] digeser secara cepat
  bool isRouteCreated = true;

  @override
  void initState() {
    // Di eksekusi setelah build selesai
    // Untuk menghindari setState((){}) error
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initData();
    });
    super.initState();
  }

  void initData() async {
    // Menampung data tambal ban yang sudah di parse dari [HomePage]
    tambalBanList = widget.details;

    // Inisialisasi ikon pin marker
    await initMarkerIcons();
    // Inisialisasi markers
    await initMarkers();
  }

  // Mengecek izin lokasi dan mengambil koordinat lokasi pengguna
  // Dipanggil ketika [onMapCreated]
  void locatePosition() async {
    // Mengecek izin
    await getPermission(context);

    // Mengambil koordinat lokasi pengguna
    currentPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    ).catchError((e) {
      print(e);
      currentPosition = initPosition;
    });

    // Menghitung jarak setiap lokasi tambal ban dan menyimpannya ke dalam [tambalBanList[i].distance]
    await calculateAllDistances();

    // Menampilkan rute dari [tambalBanList] list pertama (0)
    await showRoutes(0);
  }

  // Init markers pin icon
  Future initMarkerIcons() async {
    // Start marker pin
    startMarkerIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(24, 24)),
      'assets/userloc_marker.png',
    );

    // Destination marker pin
    destinationMarkerIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(24, 24)),
      'assets/marker.png',
    );
  }

  // Inisialisasi markers
  Future initMarkers() async {
    // Memastikan [markers] sudah kosong
    markers.clear();

    if (currentPosition != null) {
      final userPositionMarker = Marker(
        markerId: MarkerId(
          (currentPosition.latitude + currentPosition.longitude).toString(),
        ),
        icon: startMarkerIcon,
        position: LatLng(
          currentPosition.latitude,
          currentPosition.longitude,
        ),
        infoWindow: InfoWindow(
          title: 'Your Position',
        ),
      );

      markers.add(userPositionMarker);
    }

    // Memastikan [tambalBanList] tidak kosong
    if (tambalBanList != null && tambalBanList.isNotEmpty) {
      // Melakukan iterasi penmabhan [markers] berdasarkan [tambalBanList]
      for (int i = 0; i < tambalBanList.length; i++) {
        final tambalBanMarker = Marker(
          markerId: MarkerId(
            "${tambalBanList[i].lat}${tambalBanList[i].lng}",
          ),
          position: LatLng(
            tambalBanList[i].lat,
            tambalBanList[i].lng,
          ),
          icon: destinationMarkerIcon,
          infoWindow: InfoWindow(
            title: tambalBanList[i].name,
            // snippet: tambalBanList[i].address,
          ),
          onTap: () async {
            // [markerTapped] untuk kontrol [onPageChange]
            // agar tidak mengeksekusi [showRoute] jika
            // marker [tambalBanList] di tap
            // Intinya mencegah [showRoutes] terpanggil serentak
            // Khusus utk case ketika pin marker [tambalBanList] di tap
            markerTapped = true;
            await showRoutes(i);
            await carouselController.animateToPage(i);
            markerTapped = false;
          },
        );

        markers.add(tambalBanMarker);
      }
    }
  }

  // Menghitung jarak setiap lokasi tambal ban dan menyimpannya ke dalam [tambalBanList[i].distance]
  Future calculateAllDistances() async {
    // Memastikan [tambalBanList] tidak kosong
    if (tambalBanList != null && tambalBanList.isNotEmpty) {
      // Melakukan iterasi pengubahan [data.distance] pada setiap [tambalBanList]
      for (Detail data in tambalBanList) {
        data.distance = await calculateDistance(
          // LatLng(-6.2838182, 106.8048632), // Koordinat testing
          LatLng(
            currentPosition.latitude,
            currentPosition.longitude,
          ),
          LatLng(
            data.lat,
            data.lng,
          ),
        );
      }

      setState(() {});
    }
  }

  /// Calculate distance between two location
  Future<String> calculateDistance(
    LatLng startLocation,
    LatLng destinationLocation,
  ) async {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((destinationLocation.latitude - startLocation.latitude) * p) / 2 +
        c(startLocation.latitude * p) *
            c(destinationLocation.latitude * p) *
            (1 -
                c((destinationLocation.longitude - startLocation.longitude) *
                    p)) /
            2;
    var distance = 12742 * asin(sqrt(a));

    if (distance < 1) {
      return (double.parse(distance.toStringAsFixed(3)) * 1000)
              .toString()
              .split(".")[0] +
          " m";
    } else {
      return double.parse(distance.toStringAsFixed(2)).toString() + " km";
    }
  }

  // // Menganimasikan [mapsController] camera ke SATU KOORDINAT dan zoom level yang diinginkan
  // // zoom level default = 16
  // void animateMapsCamera({LatLng latLng, double zoom = 16}) {
  //   // Init [cameraPosition]
  //   CameraPosition cameraPosition = new CameraPosition(
  //     target: latLng,
  //     zoom: zoom,
  //   );

  //   // Animate [mapsController]
  //   mapsController.animateCamera(
  //     CameraUpdate.newCameraPosition(
  //       cameraPosition,
  //     ),
  //   );
  // }

  // Menganimasikan [mapsController] camera ke di antara DUA KOORDINAT dan dg zoom level yang diinginkan
  // zoom level default = 60
  void animateMapsCameraByLatLngBounds() {
    mapsController.animateCamera(
      CameraUpdate.newLatLngBounds(
        LatLngBounds(
          northeast: LatLng(
            strLocLat,
            strLocLong,
          ),
          southwest: LatLng(
            dstLocLat,
            dstLocLong,
          ),
        ),
        60.0,
      ),
    );
  }

  // Mengecek bahwa southwest coordinate <= northeast coordinate
  // Digunakan untuk mencegah maps camera melakukan bearing ke sisi bumi yang salah
  Future<void> validateCardinalDirections(
    LatLng startCoordinates,
    LatLng destinationCoordinates,
  ) async {
    if (destinationCoordinates.latitude <= startCoordinates.latitude) {
      strLocLat = startCoordinates.latitude;
      dstLocLat = destinationCoordinates.latitude;
    } else if (destinationCoordinates.latitude >= startCoordinates.latitude) {
      strLocLat = destinationCoordinates.latitude;
      dstLocLat = startCoordinates.latitude;
    }

    if (destinationCoordinates.longitude <= startCoordinates.longitude) {
      strLocLong = startCoordinates.longitude;
      dstLocLong = destinationCoordinates.longitude;
    } else if (destinationCoordinates.longitude >= startCoordinates.longitude) {
      strLocLong = destinationCoordinates.longitude;
      dstLocLong = startCoordinates.longitude;
    }

    setState(() {});
  }

  // Membuat polylines untuk menunjukkan garis rute yang dapat dilalui antar dua lokasi
  Future<void> createPolylines(
    LatLng startCoordinates,
    LatLng destinationCoordinates,
  ) async {
    // Memastikan [polylineCoordinates] dan [polylines] sudah kosong
    polylineCoordinates.clear();
    polylines.clear();

    poly.PolylinePoints polylinePoints = poly.PolylinePoints();
    poly.PolylineResult result = await polylinePoints
        .getRouteBetweenCoordinates(
      mapsApiKey, // Google Maps Directions API Key
      poly.PointLatLng(
        startCoordinates.latitude,
        startCoordinates.longitude,
      ),
      poly.PointLatLng(
        destinationCoordinates.latitude,
        destinationCoordinates.longitude,
      ),
      optimizeWaypoints: true,
    )
        .catchError((e) {
      print(e);
    });

    // Memasukkan point ke [polylineCoordinates]
    if (result != null && result.points != null && result.points.isNotEmpty) {
      result.points.forEach((poly.PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }

    PolylineId id = PolylineId('poly');
    Polyline polyline = Polyline(
      polylineId: id,
      color: btnColor,
      points: polylineCoordinates,
      width: 4,
    );

    // Memasukkan polylines data ke [polylines]
    polylines[id] = polyline;
  }

  // Untuk menampilkan rute
  // Dipanggil ketika [MapsPage] dibuka dan ketika menggeser slide [CarouselSlider]
  void showRoutes(int i) async {
    // [isRouteCreated] untuk kontrol [showRoutes]
    // Untuk mencegah [showRoutes] terpanggil serentak
    // Khusus utk case ketika [CarouselSlider] digeser secara cepat
    isRouteCreated = false;

    // Membuat garis polylines
    await createPolylines(
      // LatLng(-6.2838182, 106.8048632), // Koordinat testing
      LatLng(currentPosition.latitude, currentPosition.longitude),
      LatLng(tambalBanList[i].lat, tambalBanList[i].lng),
    );

    // Validasi cardinal
    await validateCardinalDirections(
      // LatLng(-6.2838182, 106.8048632), // Koordinat testing
      LatLng(currentPosition.latitude, currentPosition.longitude),
      LatLng(tambalBanList[i].lat, tambalBanList[i].lng),
    );

    // Menganimasikan [mapsController] camera ke di antara dua koordinat
    animateMapsCameraByLatLngBounds();

    // [isRouteCreated] untuk kontrol [showRoutes]
    // Untuk mencegah [showRoutes] terpanggil serentak
    // Khusus utk case ketika [CarouselSlider] digeser secara cepat
    isRouteCreated = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          maps(),
          backButton(),
          slides(),
        ],
      ),
    );
  }

  Widget maps() {
    return GoogleMap(
      mapType: MapType.normal,
      padding: EdgeInsets.only(bottom: 155, left: 8, right: 4, top: 28),
      initialCameraPosition: initialCameraPosition,
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
      onMapCreated: (GoogleMapController controller) async {
        mapsController = controller;
        await locatePosition();
      },
      markers: Set<Marker>.from(markers),
      polylines: Set<Polyline>.of(polylines.values),
    );
  }

  Widget backButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: edge, vertical: 38),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    );
  }

  Widget slides() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: edge),
        child: CarouselSlider(
          carouselController: carouselController,
          options: CarouselOptions(
            height: 132,
            onPageChanged: (i, _) async {
              // [markerTapped] untuk kontrol [onPageChange]
              // agar tidak mengeksekusi [showRoute] jika
              // marker [tambalBanList] di tap
              // Intinya mencegah [showRoutes] terpanggil serentak
              // Khusus utk case ketika marker [tambalBanList] di tap
              //
              // [isRouteCreated] untuk kontrol [showRoutes]
              // Juga untuk mencegah [showRoutes] terpanggil serentak
              // Khusus utk case ketika [CarouselSlider] digeser secara cepat
              if (!markerTapped && isRouteCreated) {
                await showRoutes(i);
              }
            },
          ),
          items: List.generate(
            tambalBanList.length,
            (i) => slideCard(i),
          ),
        ),
      ),
    );
  }

  Widget slideCard(int i) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(17),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(
                detail: tambalBanList[i],
              ),
            ),
          );
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/mini_direction.png',
                        width: 24,
                      ),
                      SizedBox(width: 6),
                      Text(
                        tambalBanList[i].distance ?? 'Tidak diketahui',
                        style: regularTextStyle.copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                  Text(
                    'Details >',
                    style: greyTextStyle.copyWith(fontSize: 12),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    // width: 230,
                    width: MediaQuery.of(context).size.width - 120,
                    child: Text(
                      tambalBanList[i].name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: blogTextStyle.copyWith(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      text: '${tambalBanList[i].priceTubles}K',
                      style: purpleTextStyle.copyWith(
                        fontSize: 15,
                      ),
                      children: [
                        TextSpan(
                          text: ' - Tubeless',
                          style: greyTextStyle.copyWith(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  tambalBanList[i].isTubeType
                      ? Text.rich(
                          TextSpan(
                            text: '${tambalBanList[i].priceTubtype}K',
                            style: purpleTextStyle.copyWith(
                              fontSize: 15,
                            ),
                            children: [
                              TextSpan(
                                text: ' - Tubetype',
                                style: greyTextStyle.copyWith(
                                  fontSize: 15,
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
        ),
      ),
    );
  }
}
