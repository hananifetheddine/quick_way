class Registration {
  int phoneNumber;
  String firstName;
  String familyName;
  String birthDate;
  String gender;
  String email;
  String notificationID;

  Registration(
      {required this.phoneNumber,
      required this.firstName,
      required this.familyName,
      required this.birthDate,
      required this.gender,
      required this.email,
      required this.notificationID});

  Map<String, dynamic> toJson() {
    return {
      'phoneNumber': phoneNumber,
      'firstName': firstName,
      "familyName": familyName,
      'email': email,
      'gender': gender,
      'birthDate': birthDate,
      'notificationID': notificationID,
    };
  }
}
