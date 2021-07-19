import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(251, 251, 251, 1),
      appBar: AppBar(
        //toolbarHeight: 0.10 * MediaQuery.of(context).size.height,
          centerTitle: true,
          // leading: IconButton(
          //   onPressed: () {},
          //   icon: Icon(Icons.close),
          // ),
          backgroundColor: Color.fromRGBO(71, 83, 109, 1),
          title: Text(
            'Техподдержка',
            textAlign: TextAlign.center,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(8),
            ),
          )
      ),
      body: Column(
        children: [
          SizedBox(height: 46,
            width: MediaQuery.of(context).size.width,),
          Container(
            width: 0.87*MediaQuery.of(context).size.width,
            height: 78,
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left:12, right: 34),
            decoration: BoxDecoration(
              color: Color.fromRGBO(47, 130, 210, 0.85),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
                topLeft: Radius.circular(0),
                bottomLeft: Radius.circular(15.0),
              ),
              
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Здравствуйте!\nПоддержку мы осуществляем через\nпопулярные мессенджеры',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 0.42*MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,),
          Container(
            margin: EdgeInsets.only(left:12, right: 34),
            width: 0.87*MediaQuery.of(context).size.width,

            child: Text(
              'Выберите, пожалуйста, наиболее удобное\nприложение для Вас и напишите сообщение!',
            ),
          ),
          Container(
            margin: EdgeInsets.only(left:12, right: 34, top: 12),
            width: 0.87*MediaQuery.of(context).size.width,
            height: 44,
            //color: Color.fromRGBO(85, 203, 109, 1),
            decoration: BoxDecoration(
              //color: Color.fromRGBO(85, 203, 109, 1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Material(
              color: Color.fromRGBO(85, 203, 109, 1),
              borderRadius: BorderRadius.circular(15),
              child: InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () async {
                  launch(
                    "whatsapp://send?phone=+77473885783",
                    forceSafariVC: false,
                  );
                },
                child: Row(
                  children: [
                    SizedBox(width: 73,),
                    FaIcon(FontAwesomeIcons.whatsapp, color: Colors.white,),
                    SizedBox(width: 5,),
                    Text(
                      'Написать в WhatsApp',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            //alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(left:12, right: 34, top: 12),
            width: 0.87*MediaQuery.of(context).size.width,
            height: 44,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Material(
              color: Color.fromRGBO(59, 152, 222, 1),
              borderRadius: BorderRadius.circular(15),
              child: InkWell(
                borderRadius: BorderRadius.circular(15),
                //hoverColor: Colors.red,
                onTap: () {
                  launch(
                    "https://www.telegram.me/Jetifood",
                    forceSafariVC: false,
                  );
                },
                child: Row(
                  children: [
                    SizedBox(width: 73,),
                    FaIcon(FontAwesomeIcons.telegram, color: Colors.white,),
                    SizedBox(width: 5,),
                    Text(
                      'Написать в Telegram',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ],
                ),
              ),
            ),
          ),


        ],
      ),
    );
  }
}
