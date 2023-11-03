import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spade_v4/Data/Models/user_onChanged_model.dart';

final userOnChangedMethodProvider =
    StateNotifierProvider<UserMethodChangeDetailNotifier, UserOnChangedModel>(
        (ref) {
  return UserMethodChangeDetailNotifier();
});

class UserMethodChangeDetailNotifier extends StateNotifier<UserOnChangedModel> {
  UserMethodChangeDetailNotifier()
      : super(
          UserOnChangedModel(),
        );
  void updateUserOnChangedModel({
    int? id,
    Color? color,
    String? name,
    String? longitude,
    String? latitude,
  }) {
    state = state.copyWith(
      name: name,
      color: color,
      id: id,
      latitude: latitude,
      longitude: longitude,
    );
  }
}
