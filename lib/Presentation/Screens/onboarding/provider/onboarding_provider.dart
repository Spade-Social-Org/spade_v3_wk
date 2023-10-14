import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spade_v4/Common/api.dart';
import 'package:spade_v4/Presentation/Screens/onboarding/model/register_model.dart';
import 'package:spade_v4/Presentation/Screens/onboarding/model/verify_email_model.dart';

import '../../../../Common/navigator.dart';
import '../../../widgets/loading_dialog.dart';
import '../../messages/widget/custom_snackbar.dart';
import '../model/login_model.dart';
import '../model/otp_model.dart';
import '../repository/auth_repositiory.dart';
import '../../../../prefs/pref_provider.dart';

final onboardingProvider =
    ChangeNotifierProvider((ref) => OnboardingProvider());

class OnboardingProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void setLoadingState(bool value) {
    _isLoading = value;
    notifyListeners();
  }

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
    } catch (e) {
      pop();
      rethrow;
    }
  }

  Future<RegisterResponseModel> register(RegisterModel model) async {
    try {
      loadingDialog();
      final response = await AuthRepository.register(model);
      if (response.statusCode == 'SUCCESS') {
        //
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
    } catch (e) {
      customSnackBar(somethingWentWrong);
      pop();
      rethrow;
    }
  }

  Future<ResponseModel> sendOTP(OTPModel model) async {
    try {
      setLoadingState(true);
      final response = await AuthRepository.sendOTP(model);
      if (response.statusCode == 'SUCCESS') {
        customSnackBar('An OTP has been sent to your email successfully.');
      } else if (response.statusCode == 'BAD_REQUEST') {
        customSnackBar(response.message);
      } else if (response.statusCode == 'FORBIDDEN') {
        customSnackBar(response.message);
      }
      setLoadingState(false);
      return response;
    } on TimeoutException {
      customSnackBar(timeout);
      setLoadingState(false);
      rethrow;
    } on SocketException catch (_) {
      customSnackBar(noConnection);
      setLoadingState(false);
      rethrow;
    } on HandshakeException catch (_) {
      customSnackBar(somethingWentWrong);
      setLoadingState(false);
      rethrow;
    } catch (e) {
      setLoadingState(false);
      rethrow;
    }
  }

  Future<ResponseModel> verifyOTP(String otp) async {
    try {
      loadingDialog();
      final response =
          await AuthRepository.verifyOTP(VerifyEmailModel(otp: otp));
      if (response.statusCode == 'SUCCESS') {
        PrefProvider.saveUserId(response.data!.userInfo!.userId!);
        PrefProvider.saveUserToken(response.data!.accessToken!);
        customSnackBar('Email Verified, congratulations! 🎉🚀🚀');
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
    } catch (e) {
      pop();
      rethrow;
    }
  }
}
