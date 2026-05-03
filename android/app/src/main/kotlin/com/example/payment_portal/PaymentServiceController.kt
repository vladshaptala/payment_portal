package com.example.payment_portal

import android.content.Context
import android.content.Intent
import androidx.core.content.ContextCompat
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel

/**
 * MethodChannel: "com.example.payment_portal/payment_service"
 *
 * Methods (called from Flutter's PaymentProcessingNotifier):
 *   startPaymentService(paymentId: String, amount: Double)
 *   updateProgress(progress: Double 0.0–1.0, paymentId: String, amount: Double)
 *   stopPaymentService()
 */
object PaymentServiceController {
    private const val CHANNEL = "com.example.payment_portal/payment_service"

    fun register(messenger: BinaryMessenger, context: Context) {
        MethodChannel(messenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "startPaymentService" -> {
                    val paymentId = call.argument<String>("paymentId") ?: "—"
                    val amount = call.argument<Double>("amount") ?: 0.0
                    startService(context, paymentId, amount)
                    result.success(null)
                }

                "updateProgress" -> {
                    val progress =
                        ((call.argument<Double>("progress") ?: 0.0) * 100).toInt()
                    val paymentId = call.argument<String>("paymentId") ?: "—"
                    val amount = call.argument<Double>("amount") ?: 0.0
                    updateProgress(context, paymentId, amount, progress)
                    result.success(null)
                }

                "stopPaymentService" -> {
                    context.startService(
                        Intent(context, PaymentForegroundService::class.java).apply {
                            action = PaymentForegroundService.ACTION_STOP
                        }
                    )
                    result.success(null)
                }

                else -> result.notImplemented()
            }
        }
    }

    // ── Helpers ───────────────────────────────────────────────────────────────

    private fun startService(context: Context, paymentId: String, amount: Double) {
        val intent = Intent(context, PaymentForegroundService::class.java).apply {
            action = PaymentForegroundService.ACTION_START
            putExtra(PaymentForegroundService.EXTRA_PAYMENT_ID, paymentId)
            putExtra(PaymentForegroundService.EXTRA_AMOUNT, amount)
        }
        ContextCompat.startForegroundService(context, intent)
    }

    private fun updateProgress(
        context: Context,
        paymentId: String,
        amount: Double,
        progress: Int
    ) {
        context.startService(
            Intent(context, PaymentForegroundService::class.java).apply {
                action = PaymentForegroundService.ACTION_UPDATE
                putExtra(PaymentForegroundService.EXTRA_PAYMENT_ID, paymentId)
                putExtra(PaymentForegroundService.EXTRA_AMOUNT, amount)
                putExtra(PaymentForegroundService.EXTRA_PROGRESS, progress)
            }
        )
    }
}
