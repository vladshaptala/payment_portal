package com.example.payment_portal

import android.view.WindowManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    private val windowChannel = "com.example.payment_portal/window"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        val messenger = flutterEngine.dartExecutor.binaryMessenger

        // Security environment check (root + screen recording)
        SecurityPlugin.register(messenger, applicationContext)

        // Payment foreground service control
        PaymentServiceController.register(messenger, applicationContext)

        // FLAG_SECURE toggle — Flutter calls this when the payment screen
        // becomes visible or is dismissed
        MethodChannel(messenger, windowChannel).setMethodCallHandler { call, result ->
            when (call.method) {
                "setSecure" -> {
                    val secure = call.argument<Boolean>("secure") ?: false
                    setWindowSecure(secure)
                    result.success(null)
                }
                else -> result.notImplemented()
            }
        }
    }

    /**
     * Applies or removes FLAG_SECURE on the Activity window.
     * When set, the OS prevents screenshots, screen recording, and
     * screen-sharing apps from capturing the window content.
     */
    private fun setWindowSecure(secure: Boolean) {
        if (secure) {
            window.setFlags(
                WindowManager.LayoutParams.FLAG_SECURE,
                WindowManager.LayoutParams.FLAG_SECURE,
            )
        } else {
            window.clearFlags(WindowManager.LayoutParams.FLAG_SECURE)
        }
    }
}
