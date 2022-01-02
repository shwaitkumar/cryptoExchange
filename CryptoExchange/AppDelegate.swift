//
//  AppDelegate.swift
//  CryptoExchange
//
//  Created by Shwait Kumar on 02/01/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        if #available(iOS 15.0, *) {
            window?.overrideUserInterfaceStyle = .dark
        }
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        self.pushToLoginViewController()
//        self.pushToHomeViewController()
        
        return true
    }
    
    func pushToLoginViewController() -> Void {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        let nc = UINavigationController.init(rootViewController: vc)
        self.window?.rootViewController = nc
        self.window?.makeKeyAndVisible()
    }
    
    func pushToPinViewController() -> Void {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PinViewController") as! PinViewController
        let nc = UINavigationController.init(rootViewController: vc)
        self.window?.rootViewController = nc
        self.window?.makeKeyAndVisible()
    }
    
    func pushToHomeViewController() -> Void {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        let nc = UINavigationController.init(rootViewController: vc)
        self.window?.rootViewController = nc
        self.window?.makeKeyAndVisible()
    }
    
}

