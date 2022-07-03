class Detail {
  int id; //sebagai id
  String imageUrl; //url image
  String name; // nama tempat
  int priceTubles; // harga tubeless
  int priceTubtype; // harga tubetype
  double rating; // digunakan Untuk tingkat popularitas
  String open; // jam buka
  String close; // jam tutup
  String ketDay; // keterangan hari
  String ketService; // keterangan servis yg tersdia
  String estimation; // estimasi pengerjaan 
  String address;// alamat
  String distric; // kecamatan
  String urbanVillage; // kelurahan
  String mapUrl; // link google maps
  bool isTubeType; // digunakan jika tersedia tubtype
  double lat; // koordinat latitude
  double lng; // koordinat langitude
  String distance; // menampung nilai jarak

  Detail({
    this.address,
    this.close,
    this.distric,
    this.estimation,
    this.id,
    this.imageUrl,
    this.ketDay,
    this.ketService,
    this.mapUrl,
    this.name,
    this.open,
    this.priceTubles,
    this.priceTubtype,
    this.isTubeType,
    this.lat,
    this.lng,
    this.rating,
    this.distance,
    this.urbanVillage,
  });

  // Parsing dari bentuk json ke bentuk model
  factory Detail.fromJson(Map<String, dynamic> json) {
    return Detail(
      id: json['id'],
      imageUrl: json['imageUrl'],
      name: json['name'],
      priceTubles: json['priceTubles'],
      priceTubtype: json['priceTubtype'],
      rating: json['rating'],
      open: json['open'],
      close: json['close'],
      ketDay: json['ketDay'],
      ketService: json['ketService'],
      estimation: json['estimation'],
      address: json['address'],
      distric: json['distric'],
      mapUrl: json['mapUrl'],
      isTubeType: json['isTubeType'],
      lat: json['lat'],
      lng: json['lng'],
      urbanVillage: json['urbanVillage']
    );
  }
}
