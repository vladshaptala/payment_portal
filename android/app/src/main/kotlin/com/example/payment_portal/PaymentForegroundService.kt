package com.example.payment_portal

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.Service
import android.content.Intent
import android.os.Build
import android.os.IBinder
import androidx.core.app.NotificationCompat

/**
 * Foreground service that keeps the system notified while a payment is
 * being processed. Progress (0–100) is updated via startService() calls
 * from PaymentServiceController without restarting the service.
 */
class PaymentForegroundService : Service() {

    companion object {
        const val CHANNEL_ID = "payment_processing_channel"
        const val NOTIFICATION_ID = 1001

        const val ACTION_START = "com.example.payment_portal.START"
        const val ACTION_UPDATE = "com.example.payment_portal.UPDATE"
        const val ACTION_STOP = "com.example.payment_portal.STOP"

        const val EXTRA_PAYMENT_ID = "payment_id"
        const val EXTRA_AMOUNT = "amount"
        const val EXTRA_PROGRESS = "progress" // 0–100
    }

    override fun onCreate() {
        super.onCreate()
        createNotificationChannel()
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        when (intent?.action) {
            ACTION_START -> {
                val paymentId = intent.getStringExtra(EXTRA_PAYMENT_ID) ?: "—"
                val amount = intent.getDoubleExtra(EXTRA_AMOUNT, 0.0)
                startForeground(NOTIFICATION_ID, buildNotification(paymentId, amount, 0))
            }

            ACTION_UPDATE -> {
                val paymentId = intent.getStringExtra(EXTRA_PAYMENT_ID) ?: "—"
                val amount = intent.getDoubleExtra(EXTRA_AMOUNT, 0.0)
                val progress = intent.getIntExtra(EXTRA_PROGRESS, 0)
                notificationManager().notify(
                    NOTIFICATION_ID,
                    buildNotification(paymentId, amount, progress)
                )
            }

            ACTION_STOP -> stopSelf()
        }
        return START_NOT_STICKY
    }

    override fun onBind(intent: Intent?): IBinder? = null

    // ── Notification helpers ──────────────────────────────────────────────────

    private fun buildNotification(
        paymentId: String,
        amount: Double,
        progress: Int
    ): Notification {
        val isComplete = progress >= 100
        val amountStr = "%.2f".format(amount)

        return NotificationCompat.Builder(this, CHANNEL_ID)
            .setSmallIcon(android.R.drawable.ic_lock_lock)
            .setContentTitle(
                if (isComplete) "Payment Confirmed ✓" else "Processing Payment"
            )
            .setContentText(
                if (isComplete)
                    "Payment $paymentId · \$$amountStr confirmed"
                else
                    "Securing \$$amountStr — please wait…"
            )
            .setProgress(100, progress, false)
            .setOngoing(!isComplete)
            .setAutoCancel(isComplete)
            .setPriority(NotificationCompat.PRIORITY_LOW)
            .setCategory(NotificationCompat.CATEGORY_PROGRESS)
            .build()
    }

    private fun createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(
                CHANNEL_ID,
                "Payment Processing",
                NotificationManager.IMPORTANCE_LOW
            ).apply {
                description = "Shows live progress while your payment is secured"
                setShowBadge(false)
            }
            notificationManager().createNotificationChannel(channel)
        }
    }

    private fun notificationManager() =
        getSystemService(NOTIFICATION_SERVICE) as NotificationManager
}
