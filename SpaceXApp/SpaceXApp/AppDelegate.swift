//
//  AppDelegate.swift
//  SpaceXApp
//
//  Created by Ramon Haro Marques
//

import UIKit
import Data
import UI
import Info

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    //MARK: - Properties
    static let shared: AppDelegate  = UIApplication.shared.delegate as! AppDelegate
    
    var window: UIWindow?
    
    lazy var processInfo = ProcessInfo()
    
    
    //MARK: - UIApplicationDelegate implementation
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.makeKeyAndVisible()
        
        StyleManager.setupNavigationStyle()
        let result = AppModule.setup(window: window!, isUITest: processInfo.isUITesting)
        result.router.start()
        result.presenter.setupApplication()
        
        return true
    }
}

