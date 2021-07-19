import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

class PurchaseDetailsScreen extends StatelessWidget {
  const PurchaseDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(251, 251, 251, 1),
      appBar: AppBar(
          //toolbarHeight: 0.10 * MediaQuery.of(context).size.height,
          centerTitle: true,
          backgroundColor: Color.fromRGBO(71, 83, 109, 1),
          title: Text(
            'Детали покупки',
            textAlign: TextAlign.center,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(10),
            ),
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 0.13 * MediaQuery.of(context).size.height,
                ),
                Text(
                  'Успешная оплата',
                  style: TextStyle(
                    color: Color.fromRGBO(0, 128, 0, 1),
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 149,
                  width: 149,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromRGBO(0, 128, 0, 1), width: 4),
                      borderRadius: BorderRadius.circular(100)),
                  child: Icon(
                    Icons.check,
                    color: Color.fromRGBO(0, 128, 0, 1),
                    size: 40,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Сумма списанная\nс вашей карты',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff495D8F),
                    fontSize: 17,
                  ),
                ),
                Container(
                  width: 100,
                  height: 40,
                  margin: EdgeInsets.only(top: 8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff596273), width: 0.5),
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    '390 тг',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 48, right: 47, bottom: 34),
              child: SizedBox(
                height: 63,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () =>
                      _showTopFlash(context, style: FlashBehavior.fixed),
                  // Navigator.push(context,
                  //   MaterialPageRoute(builder: (context) => PurchaseError())
                  // );

                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF47536D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  child: Text(
                    'Посмотреть историю',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showTopFlash(context, {FlashBehavior style = FlashBehavior.floating}) {
    showFlash(
      context: context,
      duration: const Duration(seconds: 5),
      persistent: true,
      builder: (_, controller) {
        return Padding(
          padding: const EdgeInsets.only(top: 8, left: 8.0, right: 8),
          child: Flash(
            controller: controller,
            backgroundColor: Colors.white,
            borderRadius: BorderRadius.circular(10),
            brightness: Brightness.light,
            boxShadows: [BoxShadow(blurRadius: 4)],
            //barrierBlur: 3.0,
            //barrierColor: Colors.black38,
            //barrierDismissible: true,
            behavior: style,
            position: FlashPosition.top,
            child: FlashBar(
              content: Row(
                children: [
                  Icon(Icons.indeterminate_check_box_rounded, color: Color.fromRGBO(97, 62, 234, 1),),
                  Text(
                    'Бонус',
                    style: TextStyle(
                        color: Color.fromRGBO(97, 62, 234, 1), fontSize: 13),
                  ),
                ],
              ),
              //showProgressIndicator: true,
              primaryAction: TextButton(
                onPressed: () => controller.dismiss(),
                child: Text('Начислено: 66,2\nДоступно: 138,50',
                    style: TextStyle(color: Colors.black, fontSize: 9)),
              ),
            ),
          ),
        );
      },
    );
  }
}
