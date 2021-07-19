import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seven_food/base/bloc.dart';
import 'package:local_auth/local_auth.dart';
import 'package:seven_food/screens/main/index.dart';
import 'package:seven_food/screens/signup/payment-method-screen.dart';
import 'package:seven_food/widgets/custom-snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PinCodeProvider extends BaseBloc {
  List<String> currentPin = ['', '', '', ''];
  List<bool> isEntered = [false, false, false, false];

  String pin = '';

  LocalAuthentication auth = LocalAuthentication();
  static final LocalAuthentication _auth = LocalAuthentication();
  String authorized = "Not authorized";

  int get pinLength => pin.length;

  bool isFully = false;
  bool toNextPage = false;

  onEntered(n, String pageName, context) async {
    if (pinLength < 4) {
      pin = pin + n;
      isEntered[pinLength - 1] = true;
      notifyListeners();
    }

    if(pinLength == 4){
      isFully = true;
      var installedPIN = await getPIN();
      if(pageName == 'initial' && installedPIN == pin) {
        print('installed pin: $installedPIN and current pin $pin');
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) =>
                IndexScreen(),
          ),
              (Route<dynamic> route) => false,
        );
      }
      else if(pageName == 'login') {
        savePIN();
        print('pin saved');
        print('installed pin: $installedPIN and current pin $pin');
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) =>
                IndexScreen(),
          ),
              (Route<dynamic> route) => false,
        );
      }
      else if(pageName == 'register') {
        savePIN();
        print('pin saved');
        print('installed pin: $installedPIN and current pin $pin');
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) =>
                PaymentMethodScreen(),
          ),
              (Route<dynamic> route) => false,
        );
      }
      else {
        print('pin $pin and ins pin $installedPIN');
        showCustomSnackBar(
          context: context,
          message: 'Неправильный пин код',
        );
      }
      notifyListeners();
    }
    else {
      isFully = false;
      notifyListeners();
    }
  }

  delete() {
    if (pinLength > 0) {
      isFully = false;
      isEntered[pinLength - 1] = false;
      pin = pin.substring(0, pinLength - 1);
      notifyListeners();
    }
  }


  savePIN() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('pin', pin);
    notifyListeners();
  }

  getPIN() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.get('pin');
    notifyListeners();
    return value;
  }

  static getPinAfterLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.get('pin');
    return value;
  }


  // Future<void> _checkBiometric() async {
  //   bool? canCheckBiometric;
  //   try {
  //     canCheckBiometric = await auth.canCheckBiometrics;
  //   } on PlatformException catch (e) {
  //     print(e);
  //   }
  //   _canCheckBiometric = canCheckBiometric;
  // }
  //
  // Future<void> _getAvailableBiometric() async {
  //   List<BiometricType>? availableBiometric;
  //   try {
  //     availableBiometric = await auth.getAvailableBiometrics();
  //   } on PlatformException catch (e) {
  //     print(e);
  //   }
  //   _availableBiometrics = availableBiometric;
  // }
  //
  // void initState() {
  //   _checkBiometric();
  //   _getAvailableBiometric();
  // }

  Future<bool> hasBiometrics() async {
    try {
      return await _auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> authenticate() async {
    final isAvailable = await hasBiometrics();
    if (!isAvailable) return false;

    try {
      return await _auth.authenticate(
          localizedReason: 'Используйте Touch ID для “7food”',
          useErrorDialogs: true,
          stickyAuth: true);
    } on PlatformException catch (e) {
      print(e);
      return false;
    }
  }
}
