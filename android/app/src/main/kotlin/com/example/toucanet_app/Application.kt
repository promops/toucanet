package com.example.toucanet_app

// import io.flutter.app.FlutterApplication
// import io.flutter.plugin.common.PluginRegistry
// import io.flutter.plugins.GeneratedPluginRegistrant
// import io.flutter.plugins.firebasemessaging.FlutterFirebaseMessagingService

 //class Application : FlutterApplication(), PluginRegistry.PluginRegistrantCallback {
//     override fun onCreate() {
//         super.onCreate()

//         FlutterFirebaseMessagingService.setPluginRegistrant(this);
//     }

//     override fun registerWith(registry: PluginRegistry?) {
//         GeneratedPluginRegistrant.registerWith(registry);
//     }
// }

//рабочая
// import io.flutter.app.FlutterApplication
// import io.flutter.plugin.common.PluginRegistry
// import io.flutter.plugin.common.PluginRegistry.PluginRegistrantCallback
// import io.flutter.plugins.GeneratedPluginRegistrant
// import io.flutter.plugins.firebasemessaging.FlutterFirebaseMessagingService

// class Application : FlutterApplication(), PluginRegistrantCallback {

// override fun onCreate() {
//     super.onCreate()
//     FlutterFirebaseMessagingService.setPluginRegistrant(this)
// }

// override fun registerWith(registry: PluginRegistry?) {
//     io.flutter.plugins.firebasemessaging.FirebaseMessagingPlugin.registerWith(registry?.registrarFor("io.flutter.plugins.firebasemessaging.FirebaseMessagingPlugin"));
// }
// }

import io.flutter.app.FlutterApplication
import io.flutter.plugin.common.PluginRegistry
import io.flutter.plugin.common.PluginRegistry.PluginRegistrantCallback
import io.flutter.plugins.firebasemessaging.FlutterFirebaseMessagingService

class Application : FlutterApplication(), PluginRegistrantCallback {
    override fun onCreate() {
        super.onCreate()
        FlutterFirebaseMessagingService.setPluginRegistrant(this)
    }

    override fun registerWith(registry: PluginRegistry?) {
        if (registry != null) {
            FirebaseCloudMessagingPluginRegistrant.registerWith(registry)
        }
    }
}




// import android.os.Bundle

// import io.flutter.app.FlutterActivity
// import io.flutter.app.FlutterApplication
// import io.flutter.plugin.common.PluginRegistry
// import io.flutter.plugin.common.PluginRegistry.PluginRegistrantCallback
// import io.flutter.plugins.GeneratedPluginRegistrant
// import io.flutter.plugins.firebasemessaging.FlutterFirebaseMessagingService
// //import com.google.firebase.messaging.FirebaseMessagingService

//  class Application : FlutterApplication() , PluginRegistrantCallback {
   
//    override fun onCreate() {
//      super.onCreate();
//      FlutterFirebaseMessagingService.setPluginRegistrant(this);
//    }

//    override fun registerWith( registry: PluginRegistry) {
//      GeneratedPluginRegistrant.registerWith(registry);
//    }
//  }