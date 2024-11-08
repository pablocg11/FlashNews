
import UserNotifications
import SwiftUI
import FirebaseCore
import UIKit
import FirebaseMessaging

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        // Solicitar permiso para notificaciones
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted {
                DispatchQueue.main.async {
                    application.registerForRemoteNotifications() // Registra el dispositivo para notificaciones remotas
                }
            }
        }
        
        // Registrar el dispositivo para recibir notificaciones push
        Messaging.messaging().delegate = self
        
        return true
    }
    
    // Se llama cuando se recibe el token de notificación
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Messaging.messaging().apnsToken = deviceToken
    }
    
    // Maneja el error si la notificación no se puede registrar
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Failed to register for notifications: \(error)")
    }
}

extension AppDelegate: MessagingDelegate {
    // Se llama cuando el token de FCM cambia
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        if let token = fcmToken {
            print("FCM token: \(token)")
            // Aquí puedes enviar el token a tu backend si es necesario para asociarlo con el usuario
        }
    }
}

@main
struct FlashNewsApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView(newsListViewFactory: NewsListViewFactory())
        }
    }
}
