import '../../../main.dart';
import '../../../presentation/utils/enums.dart';
import '../User/profile.dart';

class Account {
  AccountDetails accountDetails;
  Profile profile;

  Account({required this.accountDetails, required this.profile});

  factory Account.fromJson(Map<String, dynamic> data) {
    return Account(
      accountDetails: AccountDetails.fromJson(data["User"]["Account"]),
      profile: Profile.fromJson(data),
    );
  }

  bool get isThereReason => accountDetails.reason != null;
  String get reason => accountDetails.reason ?? "";

  bool get isThereReactivationDate => accountDetails.reactivationDate != null;
}

class AccountDetails {
  AccountState state;
  String? deactivationDate;
  String? reactivationDate;
  String? reason;

  AccountDetails({
    required this.state,
    required this.deactivationDate,
    required this.reactivationDate,
    required this.reason,
  });

  factory AccountDetails.fromJson(Map<String, dynamic> json) {
    return AccountDetails(
      state: AccountState.getState(json['state']),
      deactivationDate: json['deactivationDate'],
      reactivationDate: json['reactivationDate'],
      reason: json['reason'],
    );
  }
}
