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
        
//        self.pushToLoginViewController()
        self.pushToHomeViewController()
//        self.pushToPortfolioViewController()
        
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
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
        vc.selectedIndex = 0
        let nc = UINavigationController.init(rootViewController: vc)
        self.window?.rootViewController = nc
        self.window?.makeKeyAndVisible()
    }
    
    func pushToPortfolioViewController() -> Void {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
        vc.selectedIndex = 1
        let nc = UINavigationController.init(rootViewController: vc)
        self.window?.rootViewController = nc
        self.window?.makeKeyAndVisible()
    }
    
    func pushToMarketViewController() -> Void {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
        vc.selectedIndex = 2
        let nc = UINavigationController.init(rootViewController: vc)
        self.window?.rootViewController = nc
        self.window?.makeKeyAndVisible()
    }
    
}

