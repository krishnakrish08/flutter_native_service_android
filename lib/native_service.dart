import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class NativeService {
  static const platform1 = MethodChannel('com.example/native_service');
  static const platform2 = MethodChannel('com.example/native_service');

  Future<String> getNativeData() async {
    try {
      final String result = await platform1.invokeMethod('getNativeData');
      debugPrint('result -- $result');
      return result;
    } on PlatformException catch (e) {
      debugPrint('PlatformException --');
      return "Failed to get native data: '${e.message}'.";
    }
  }

  Future<String> getNativeDataFromService() async {
    try {
      final String result = await platform2.invokeMethod('getNativeDataFromService');
      return result;
    } on PlatformException catch (e) {
      return "Failed to get native data: '${e.message}'.";
    }
  }
}
