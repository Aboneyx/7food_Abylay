import 'package:flutter/material.dart';
import 'package:seven_food/base/provider.dart';
import 'package:seven_food/data/services/auth-service.dart';
import 'package:seven_food/provider/confirm-provider.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:seven_food/screens/login/pin-code-screen.dart';

class ConfirmScreen extends StatelessWidget {
  final String phone;
  final String page;
  const ConfirmScreen({Key? key, required this.phone, required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final AuthService _authService = AuthService();
    String _verificationCode = '';

    return BaseProvider<ConfirmProvider>(
      model: ConfirmProvider(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
              centerTitle: true,
              backgroundColor: Color.fromRGBO(71, 83, 109, 1),
              title: Text(
                '+7' + phone,
                textAlign: TextAlign.center,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              )),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 0.3 * size.height,
                ),
                Center(
                  child: Text(
                    'Код проверки',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: VerificationCode(
                    textStyle: TextStyle(fontSize: 25.0),
                    keyboardType: TextInputType.number,
                    underlineColor: Colors.amber,
                    length: 4,
                    onEditing: (bool value) {},
                    onCompleted: (value) {
                      _verificationCode = value;
                    },
                  ),
                ),
                Text(
                  'Отправить код через SMS',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 0.08 * size.height,
                ),
                SizedBox(
                  width: 0.82 * size.width,
                  child: TextButton(
                      onPressed: () async {
                        FocusScope.of(context).unfocus();
                        var phoneToBack =  phone.replaceAll(
                            RegExp(r'[()-]'), "");
                        phoneToBack = '7' + phoneToBack;
                        print('Confirm Screen: [' + phoneToBack + ', $_verificationCode]');
                        try{
                          final user = await _authService.confirmPhoneNumWhenRegistering(phoneToBack, _verificationCode, context);
                          if(user != null) {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PinCodeScreen(id: 'register',)),
                                    (route) => false
                            );
                          }
                        } catch(e) {
                          print('Exception from catch: ');
                          print(e);
                        }
                      },
                      child: Text(
                        'Войти',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(
                          Color.fromRGBO(71, 83, 109, 1)),
                      shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(30.0))),
                      //minimumSize: MaterialStateProperty<Size>(size.width-60),
                    ),
                  ),
                ),

              ],
            ),
          ),
        );
      }
    );
  }
}
