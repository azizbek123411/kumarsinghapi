class Model {
  final String email;
  final String image;
  final String country;
  final String nameTitle;
  final String firstName;
  final String lastName;

  Model({
    required this.email,
    required this.country,
    required this.image,
    required this.nameTitle,
    required this.firstName,
    required this.lastName
  });
String get fullName{
  return '$nameTitle $firstName $lastName';
}

factory Model.fromJson(Map<String, dynamic>e){
  return Model(
    email: e['email']??"hello",
    country: e['phone']??"hello",
    image: e['picture']['medium']??"hello",
    nameTitle: e['name']['title']??"John Wick",
    firstName: e['name']['first']??"John Wick",
    lastName: e['name']['last']??"John Wick",
  );
}
}
