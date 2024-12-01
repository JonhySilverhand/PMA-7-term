package com.example.lab06
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.provider.AlarmClock
import android.util.Log

import android.os.Bundle
import android.os.Debug
import android.os.Process
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.cpu_usage/cpu"

    override fun configureFlutterEngine(flutterEngine: io.flutter.embedding.engine.FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getCpuUsage") {
                val cpuUsage = getCpuUsage()
                if (cpuUsage != null) {
                    result.success(cpuUsage)
                } else {
                    result.error("UNAVAILABLE", "CPU usage not available.", null)
                }

            } else if (call.method == "launchAlarmApp") {
                val time: String = call.argument<String>(/* key = */ "time").toString();
                launchAlarmApp(time);
                result.success("Alarm app launched")
            }
            else if (call.method == "getBatteryLevel") {
                val batteryLevel = getBatteryLevel()
                if (batteryLevel != -1) {
                    result.success(batteryLevel)
                } else {
                    result.error("UNAVAILABLE", "Battery level not available.", null)
                }
            }
            else {
                result.notImplemented()
            }
        }
    }

    private fun getCpuUsage(): Double {
        // Получение загрузки CPU
        val totalCpuTime = Debug.threadCpuTimeNanos()
        val processCpuTime = Process.getElapsedCpuTime()

        return ((processCpuTime.toDouble() / totalCpuTime.toDouble()) * 100)
    }
    private fun launchAlarmApp(time: String) {
        try {
            val intent = Intent(AlarmClock.ACTION_SET_ALARM)
            intent.putExtra(AlarmClock.EXTRA_MESSAGE, "Alarm")
            intent.putExtra(
                AlarmClock.EXTRA_HOUR,
                time.split("T".toRegex()).dropLastWhile { it.isEmpty() }
                    .toTypedArray()[1].split(":".toRegex()).dropLastWhile { it.isEmpty() }
                    .toTypedArray()[0].toInt()
            )
            intent.putExtra(
                AlarmClock.EXTRA_MINUTES,
                time.split("T".toRegex()).dropLastWhile { it.isEmpty() }
                    .toTypedArray()[1].split(":".toRegex()).dropLastWhile { it.isEmpty() }
                    .toTypedArray()[1].toInt()
            )
            startActivity(intent)
        } catch (e: Exception) {
            Log.e("MainActivity", "Error launching alarm app: " + e.message)
        }
    }

    private fun getBatteryLevel(): Int {
        val batteryStatus: Intent? = registerReceiver(null,
            IntentFilter(Intent.ACTION_BATTERY_CHANGED)
        )
        val batteryLevel = batteryStatus?.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) ?: -1
        val batteryScale = batteryStatus?.getIntExtra(BatteryManager.EXTRA_SCALE, -1) ?: -1
        return (batteryLevel / batteryScale.toFloat() * 100).toInt()
    }
}
