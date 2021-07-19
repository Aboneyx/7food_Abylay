import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:seven_food/base/provider.dart';
import 'package:seven_food/provider/qr-code-provider.dart';

class QRCodeScreen extends StatelessWidget {
  const QRCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<QRCodeProvider>(
      model: QRCodeProvider(),
      builder: (context, model, child) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            backgroundColor: Colors.white,
            body: ModalProgressHUD(
              inAsyncCall: model.isLoading,
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 0.35*MediaQuery.of(context).size.height,
                      width: double.infinity,
                    ),
                    VerificationCode(
                      textStyle: TextStyle(fontSize: 20.0),
                      keyboardType: TextInputType.number,
                      underlineUnfocusedColor: Color(0xff613EEA),
                      underlineColor: Color(0xFF3500FF),
                      length: 5,
                      onEditing: (bool value) {},
                      onCompleted: (value) async {
                        //model.onCompleted(value);
                        //int fridgeCode = value as int;
                        model.pullAfterCode(value, context);
                        //model.drawAlertDialog(context);
                        // if(model.checker)
                        // {
                        //   showDialog(context: context, builder: (context) =>
                        //       CupertinoAlertDialog(
                        //         title: const Text('Вы не можете сделать покупку ',
                        //           textAlign: TextAlign.center,
                        //           style: TextStyle(
                        //             color: Color(0xff952323),
                        //             fontSize: 13,
                        //           ),
                        //         ),
                        //         content: SingleChildScrollView(
                        //           child: Padding(
                        //             padding: const EdgeInsets.only(top: 8.0),
                        //             child: Text(
                        //               'Пожалуйста, оплатите долг',
                        //               textAlign: TextAlign.center,
                        //               style: TextStyle(
                        //                 fontSize: 10,
                        //               ),
                        //             ),
                        //           ),
                        //
                        //         ),
                        //       actions: <Widget>[
                        //           Center(
                        //             child: TextButton(
                        //               child: const Text(
                        //                 'Оплатить',
                        //                 textAlign: TextAlign.center,
                        //                 style: TextStyle(
                        //                   fontSize: 13,
                        //                   color: Color(0xff613EEA)
                        //                 ),
                        //               ),
                        //               onPressed: () {
                        //                 Navigator.of(context).pop();
                        //               },
                        //             ),
                        //           ),
                        //         ],
                        //       ));
                        // }


                        },

                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        'Ввести код\nкоторый отоброжен на холодильнике ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: IconButton(onPressed: () { Navigator.pop(context);},
                        icon: Icon(
                          Icons.close,
                          size: 35,
                          color: Color(0xff613EEA),)
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
