import 'dart:convert';

import 'package:pusher_client/pusher_client.dart';
import 'package:seven_food/base/bloc.dart';
import 'package:seven_food/data/model/fridge-closed-response-model.dart';
import 'package:seven_food/data/model/socket-products-model.dart';
import 'package:seven_food/data/services/auth-service.dart';

class FridgeProvider extends BaseBloc {
  AuthService authService = AuthService();
  late PusherClient pusher;
  late Channel channel;
  List<Products> products = [];
  var response;
  bool isFridgeClosed = false;
  var fridgeClosedResponse;
  
  initPusher(int id) async {
    pusher = PusherClient("74637838c2f684d6db41", PusherOptions(cluster: 'mt1'));

    // Connect
    pusher.connect();
    pusher.onConnectionStateChange((state) {
      print('pusher on connection change state');
      print(state.currentState);
    });
    pusher.onConnectionError((error) {
      print('error from pusher on connection error');
      print(error.message);
    });

    // Subscribe
    channel = pusher.subscribe('user.$id');
    print('subscribe user.$id');


    // Binding
    channel.bind('App\\Events\\FridgeProductChanged', (event) {
      print('subscribed to event ${event.data}');
      print('channel name ' + event.channelName);
      print('name ${event.eventName}');
      print(' ${event.userId}');

      var data = jsonDecode(event.data);
      response = SocketResponse.fromJson(data);
      products.clear();
      for(Map<String, dynamic> i in data['products']) {
        products.add(Products.fromJson(i));
      }
      notifyListeners();
    });
    
    channel.bind('App\\Events\\FridgeClosed', (event) {
      print('subscribed to event ${event.data}');
      isFridgeClosed = true;
      var data = jsonDecode(event.data);
      fridgeClosedResponse = FridgeClosedResponse.fromJson(data);
      print(' fridgeClosedResponse: ' + fridgeClosedResponse.status);
      notifyListeners();
    });
    notifyListeners();
  }
}