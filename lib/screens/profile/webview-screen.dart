import 'package:flutter/material.dart';
import 'package:seven_food/screens/main/HomeScreen.dart';
import 'package:seven_food/screens/main/index.dart';
import 'package:webview_flutter/webview_flutter.dart';


class WebViewContainer extends StatefulWidget {
  final redirectUrl;
  final requestUrl;
  WebViewContainer(this.redirectUrl, this.requestUrl);
  @override
  createState() => _WebViewContainerState();
}

class _WebViewContainerState extends State<WebViewContainer> {
  final _key = UniqueKey();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Добавить карту'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(10),
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              FocusScope.of(context).unfocus();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => IndexScreen(),
                ),
                    (route) => false,
              );
            },
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: WebView(
                key: _key,
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: widget.redirectUrl,
              ),
            )
          ],
        ),
      ),
    );
  }
}