import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spade_v4/Common/api.dart';
import 'package:spade_v4/Presentation/Screens/onboarding/model/register_model.dart';

import '../../../../Common/navigator.dart';
import '../../../widgets/loading_dialog.dart';
import '../../messages/widget/custom_snackbar.dart';
import '../model/login_model.dart';
import '../repository/auth_repositiory.dart';
import '../../../../prefs/pref_provider.dart';

final onboardingProvider = Provider((ref) => OnboardingProvider());

class OnboardingProvider {
  Future<ResponseModel> login(LoginModel model) async {
    try {
      loadingDialog();
      final response = await AuthRepository.login(model);
      if (response.statusCode == 'SUCCESS') {
        PrefProvider.saveUserToken(response.data!.accessToken!);
        PrefProvider.saveUserId(response.data!.userInfo!.userId!);
      } else if (response.statusCode == 'BAD_REQUEST') {
        customSnackBar(response.message);
      } else if (response.statusCode == 'FORBIDDEN') {
        customSnackBar(response.message);
      }
      pop();
      return response;
    } on TimeoutException {
      customSnackBar(timeout);
      pop();
      rethrow;
    } on SocketException catch (_) {
      customSnackBar(noConnection);
      pop();
      rethrow;
    } on HandshakeException catch (_) {
      customSnackBar(somethingWentWrong);
      pop();
      rethrow;
    }
  }

  Future<ResponseModel> register(RegisterModel model) async {
    try {
      loadingDialog();
      final response = await AuthRepository.register(model);
      if (response.statusCode == 'SUCCESS') {
        PrefProvider.saveUserToken(response.data!.accessToken!);
        PrefProvider.saveUserId(response.data!.userInfo!.userId!);
      } else if (response.statusCode == 'BAD_REQUEST') {
        customSnackBar(response.message);
      } else if (response.statusCode == 'FORBIDDEN') {
        customSnackBar(response.message);
      }
      pop();
      return response;
    } on TimeoutException {
      customSnackBar(timeout);
      pop();
      rethrow;
    } on SocketException catch (_) {
      customSnackBar(noConnection);
      pop();
      rethrow;
    } on HandshakeException catch (_) {
      customSnackBar(somethingWentWrong);
      pop();
      rethrow;
    }
  }
}
