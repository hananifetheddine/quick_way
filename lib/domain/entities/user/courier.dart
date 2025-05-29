import 'package:quick_way/domain/entities/user/user.dart';

import '../../../presentation/utils/enums.dart';

class Courier extends User {
  String uid;

  Courier(
      {required super.phoneNumber,
      required this.uid,
      required super.email,
      required super.emailVerified,
      required super.rating,
      required super.firstName,
      required super.familyName,
      required super.gender,
      required super.birthDate,
      required super.profilePicture});

  factory Courier.fromJson(Map<String, dynamic> json) {
    return Courier(
      phoneNumber: json["User"]['phoneNumber'].toString(),
      email: json['email'] ?? "",
      emailVerified: json["User"]['emailVerified'] ?? false,
      rating: json['rating'].toString(),
      firstName: json["User"]['firstName'],
      familyName: json["User"]['familyName'],
      gender: Gender.getGender(json["User"]['gender']),
      birthDate: json["User"]['birthDate'] ?? "",
      profilePicture: json["User"]['profilePicture'] ?? "",
      uid: json["uId"].toString(),
    );
  }
}
