package com.example.payment_portal

import android.content.Context
import android.content.pm.PackageManager
import android.os.Build
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel
import java.io.File

/**
 * MethodChannel: "com.example.payment_portal/security"
 *
 * Methods:
 *   checkSecurity → Map<String, Boolean>
 *     - isRooted          : su binary / test-keys / dangerous props
 *     - isScreenRecording : known screen-recorder packages installed
 */
object SecurityPlugin {
    private const val CHANNEL = "com.example.payment_portal/security"

    fun register(messenger: BinaryMessenger, context: Context) {
        MethodChannel(messenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "checkSecurity" -> result.success(
                    mapOf(
                        "isRooted" to isDeviceRooted(),
                        "isScreenRecording" to isScreenRecordingActive(context),
                    )
                )
                else -> result.notImplemented()
            }
        }
    }

    // ── Root detection ────────────────────────────────────────────────────────

    private fun isDeviceRooted(): Boolean =
        hasSuBinary() || hasTestKeys() || hasRootManagementApp()

    private fun hasSuBinary(): Boolean {
        val paths = listOf(
            "/sbin/su", "/system/bin/su", "/system/xbin/su",
            "/data/local/xbin/su", "/data/local/bin/su",
            "/system/sd/xbin/su", "/system/bin/failsafe/su",
            "/data/local/su", "/su/bin/su", "/magisk/.core/bin/su",
        )
        return paths.any { File(it).exists() }
    }

    private fun hasTestKeys(): Boolean =
        Build.TAGS?.contains("test-keys") == true

    private fun hasRootManagementApp(): Boolean = runCatching {
        val proc = Runtime.getRuntime().exec(arrayOf("getprop", "ro.debuggable"))
        proc.inputStream.bufferedReader().readLine() == "1"
    }.getOrDefault(false)

    // ── Screen-recording detection ────────────────────────────────────────────
    // Checks whether known screen-recorder packages are installed on the device.
    // Note: on API 30+ use PackageManager.getInstalledPackages() requires
    // QUERY_ALL_PACKAGES permission — the specific-package approach used here
    // avoids that permission while still catching common recorders.

    private val knownRecorderPackages = listOf(
        "com.mobzapp.screenrecord",
        "com.hecorat.screenrecorder.free",
        "com.kimcy929.screenrecorder",
        "com.nll.screenrecorder",
        "com.ionitech.airscreen",
        "com.apowersoft.android.recorder",
        "com.duapps.recorder",
    )

    private fun isScreenRecordingActive(context: Context): Boolean {
        val pm = context.packageManager
        return knownRecorderPackages.any { pkg ->
            runCatching {
                pm.getPackageInfo(pkg, PackageManager.GET_ACTIVITIES)
                true
            }.getOrDefault(false)
        }
    }
}
