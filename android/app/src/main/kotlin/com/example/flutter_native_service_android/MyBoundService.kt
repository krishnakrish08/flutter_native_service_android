package com.example.flutter_native_service_android

import android.app.Service
import android.content.Intent
import android.os.Binder
import android.os.IBinder

class MyBoundService : Service() {

    private val binder = LocalBinder()

    inner class LocalBinder : Binder() {
        fun getService(): MyBoundService = this@MyBoundService
    }

    override fun onBind(intent: Intent): IBinder {
        return binder
    }

    fun getNativeDataFromService(): String {
        return "Hello from Bound Service!"
    }
}