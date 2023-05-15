import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

checkConnectivity() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
    try {
      final result = await InternetAddress.lookup('ubihrm.com').timeout(Duration(seconds: 5));
      // print('connected-yapped-125');
      // print(result[0].rawAddress);
      // print('connected-yapped-125');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        // print('connected-yapped');
        return true;
      }
    }on TimeoutException catch (e) {
      print('Timeout Error: $e');
      print('Timeout not connected-Nope');
      return false;
    } on SocketException catch (_) {
      print('not connected-Nope');
      return false;
    }
  } else {
    return false;
  }
}