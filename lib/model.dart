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
}
