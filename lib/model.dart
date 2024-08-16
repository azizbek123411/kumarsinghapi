class Model {
  String gender;
  String nameTitle;
  String nameFirst;
  String nameLast;
  int numberSt;
  String nameSt;
  String city;
  String state;
  String country;
  String postCode;
  String latitude;
  String longitude;
  String email;
  DateTime dateTime;
  String phone;
  String mediumPicture;
  String smallPicture;
  String nat;

  Model({
    required this.dateTime,
    required this.country,
    required this.city,
    required this.email,
    required this.gender,
    required this.latitude,
    required this.longitude,
    required this.mediumPicture,
    required this.nameFirst,
    required this.nameLast,
    required this.nameSt,
    required this.nameTitle,
    required this.nat,
    required this.numberSt,
    required this.phone,
    required this.postCode,
    required this.smallPicture,
    required this.state,
  });

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      dateTime: DateTime.parse(json['results']['dateTime']),
      country: json['results']['country'],
      city: json['results']['city'],
      email: json['results']['email'],
      gender: json['results']['gender'],
      latitude: json['results']['latitude'],
      longitude: json['results']['longitude'],
      mediumPicture: json['results']['mediumPicture'],
      nameFirst: json['results']['nameFirst'],
      nameLast: json['results']['nameLast'],
      nameSt: json['results']['nameSt'],
      nameTitle: json['results']['nameTitle'],
      nat: json['results']['nat'],
      numberSt: json['results']['numberSt'],
      phone: json['results']['phone'],
      postCode: json['results']['postCode'],
      smallPicture: json['results']['smallPicture'],
      state: json['results']['state'],
    );
  }
}
