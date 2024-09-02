import 'package:flutter/material.dart';
import 'package:flutter_native_service_android/native_service.dart';

class SimpleMethodChannel extends StatelessWidget {
  final NativeService nativeService = NativeService();

  SimpleMethodChannel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Method Example'),
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: nativeService.getNativeData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error:- ${snapshot.error}');
            } else {
              return Text('Native Data:- ${snapshot.data}');
            }
          },
        ),
      ),
    );
  }
}
