package com.example.flutter_native_service_android

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class NativeMethodChannelActivity : FlutterActivity() {

    private val METHOD_CHANNEL_NAME = "com.example/native_service"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        println("configureFlutterEngine - NativeMethodChannelActivity")

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            METHOD_CHANNEL_NAME
        ).setMethodCallHandler { call, result ->
            if (call.method == "getNativeData") {
                val nativeData = getNativeData()
                result.success(nativeData)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun getNativeData(): String {
        return "Hello from Android Native Code!"
    }
}