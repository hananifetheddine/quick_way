import 'package:quick_way/domain/entities/user/user.dart';

import '../../../presentation/utils/enums.dart';

class Profile extends User {
  Profile({
    required super.phoneNumber,
    required super.email,
    required super.firstName,
    required super.familyName,
    required super.gender,
    required super.birthDate,
    required super.profilePicture,
    required super.rating,
    required super.emailVerified,
  });

  factory Profile.fromJson(Map<String, dynamic> data) {
    return Profile(
      phoneNumber: data["User"]['phoneNumber'].toString(),
      gender: Gender.getGender(data["User"]['gender'] ?? "male"),
      profilePicture: data["User"]['profilePicture'] ?? "",
      email: data["User"]['email'] ?? "",
      firstName: data["User"]['firstName'],
      familyName: data["User"]['familyName'],
      birthDate: data["User"]['birthDate'] ?? "",
      rating: data['rating'].toString(),
      emailVerified: data["User"]['emailVerified'],
    );
  }

  factory Profile.fromLocal(Map<String, dynamic> data) {
    return Profile(
      phoneNumber: data['phoneNumber'].toString(),
      gender: Gender.getGender(data['gender']),
      profilePicture: data['profilePicture'] ?? "",
      email: data['email'] ?? "",
      firstName: data['firstName'],
      familyName: data['familyName'],
      birthDate: data['birthDate'] ?? "",
      rating: data['rating'].toString(),
      emailVerified: data['emailVerified'],
    );
  }

  Map<String, dynamic> toLocal() {
    return {
      "phoneNumber": phoneNumber,
      "email": email,
      "firstName": firstName,
      "familyName": familyName,
      "gender": gender.name,
      "birthDate": birthDate,
      "profilePicture": profilePicture,
      "rating": rating,
      "emailVerified": emailVerified
    };
  }
}
