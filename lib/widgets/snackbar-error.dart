import 'package:flutter/material.dart';

class SnackBarPageSignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: Text('Вы оставили некоторые поля пустыми'),
            action: SnackBarAction(
              label: 'Отменить',
              onPressed: () {},
            ),
          );

          // Find the ScaffoldMessenger in the widget tree
          // and use it to show a SnackBar.
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Text('Show SnackBar'),
      ),
    );
  }
}