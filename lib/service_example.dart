import 'package:flutter/material.dart';
import 'package:flutter_native_service_android/native_service.dart';

class ServiceExample extends StatelessWidget {
  final NativeService nativeService = NativeService();

  ServiceExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Native Service Example'),
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: nativeService.getNativeDataFromService(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Text('Native Data from Service: ${snapshot.data}');
            }
          },
        ),
      ),
    );
  }
}
