package com.example.mobile_trampoline_park

import android.app.Application
import com.yandex.mapkit.MapKitFactory

class MainApplication : Application() {
    override fun onCreate() {
        super.onCreate()
        MapKitFactory.setLocale("ru_RU")
        MapKitFactory.setApiKey("2fd0438b-8b7c-4325-9718-fdb76abfb712")
    }
}