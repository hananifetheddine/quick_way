import '../../../presentation/utils/enums.dart';

abstract class User {
  String phoneNumber;
  String firstName;
  String familyName;
  String email;
  String profilePicture;
  String birthDate;
  Gender gender;
  String rating;
  bool emailVerified;

  User(
      {required this.phoneNumber,
      required this.email,
      required this.emailVerified,
      required this.rating,
      required this.firstName,
      required this.familyName,
      required this.gender,
      required this.birthDate,
      required this.profilePicture});

  String get fullName => "$familyName $firstName";

  String get phoneNumberFull => "+213 $phoneNumber";

  String get shotName => firstName[0] + familyName[0];

  double get ratingDouble => double.parse(rating);
}
