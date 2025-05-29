//home page
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum LocationType { from, to }

enum MatchType {
  direct,
  oneConnection,
  twoConnections;

  const MatchType();
  static MatchType getValue(String value) {
    return switch (value) {
      "direct" => MatchType.direct,
      "oneConnection" => MatchType.oneConnection,
      _ => MatchType.twoConnections
    };
  }
}

enum Operation { currentLocation, prediction, selection }

enum PredictionSource { local, api }

enum StateDelivery { canceled, finished, delivering }

enum MessageChatSender { courier, client }

enum MatchStateAction { request, cancel, none }

enum NotificationType {
  match,
  message,
  others;

  const NotificationType();

  static NotificationType getValue(RemoteMessage message) {
    return switch (message.data["type"]) {
      "match" => NotificationType.match,
      "message" => NotificationType.message,
      _ => NotificationType.others
    };
  }
}

enum MatchState {
  link(Icons.link, Colors.grey),
  pending(Icons.access_time, Colors.orange),
  accepted(Icons.check, Colors.green),
  rejected(Icons.close, Colors.redAccent),
  other(Icons.close, Colors.transparent);

  const MatchState(this.icon, this.color);

  final IconData icon;
  final Color color;

  static MatchState getState(String state) {
    return switch (state) {
      "link" => MatchState.link,
      "pending" => MatchState.pending,
      // "accepted" => MatchState.accepted,
      "rejected" => MatchState.rejected,
      _ => MatchState.other
    };
  }

  MatchState nextState() {
    return switch (this) {
      MatchState.link => MatchState.pending,
      MatchState.pending => MatchState.link,
      MatchState.rejected => throw UnimplementedError(),
      MatchState.other => throw UnimplementedError(),
      MatchState.accepted => throw UnimplementedError(),
    };
  }

  MatchStateAction getAction() {
    return switch (this) {
      MatchState.link => MatchStateAction.request,
      MatchState.pending => MatchStateAction.cancel,
      MatchState.rejected => MatchStateAction.none,
      MatchState.other => MatchStateAction.none,
      MatchState.accepted => MatchStateAction.none,
    };
  }

  static List<MatchState> get importantStates => MatchState.values
      .where((element) => element != MatchState.other)
      .toList();

  String get nameTr => name.tr;
}

enum TripState {
  upComing,
  onGoing,
  completed;

  static TripState getState(String state) {
    return switch (state) {
      "upComing" => TripState.upComing,
      "onGoing" => TripState.onGoing,
      // "accepted" => MatchState.accepted,
      "completed" => TripState.completed,
      _ => throw UnimplementedError()
    };
  }

  String get nameTr => name.tr;
}

enum ThemeDisplay {
  dark,
  light,
  system;

  static ThemeDisplay getTheme(String value) {
    return switch (value) {
      "light" => ThemeDisplay.light,
      "dark" => ThemeDisplay.dark,
      _ => ThemeDisplay.system
    };
  }

  ThemeMode toThemeMode() {
    return switch (this) {
      ThemeDisplay.dark => ThemeMode.dark,
      ThemeDisplay.light => ThemeMode.light,
      ThemeDisplay.system => ThemeMode.system,
    };
  }
}

enum Gender {
  male,
  female;

  static Gender getGender(String value) {
    return switch (value) {
      "male" => Gender.male,
      "female" => Gender.female,
      _ => Gender.female
    };
  }

  String get nameTr => name.tr;
}

enum AccountState {
  noAccount,
  activated,
  deactivated;

  static getState(String state) {
    return switch (state) {
      "activated" => AccountState.activated,
      "deactivated" => AccountState.deactivated,
      _ => AccountState.noAccount
    };
  }
}
