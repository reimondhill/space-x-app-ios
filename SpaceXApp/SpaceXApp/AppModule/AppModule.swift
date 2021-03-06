//
//  AppModule.swift
//  SpaceXApp
//
//  Created by Ramon Haro Marques
//

import UIKit
import Data
import Presentation
import Routing

class AppModule {
    
    static func setup(window: UIWindow, isUITest: Bool) -> (presenter: AppPresenterInterface, router: AppRouterInterface) {
        let router = AppRouter(window: window)
        
        let networkFetcher: NetworkFetcher = isUITest ? MockNetworkManager(isUITesting: true):NativeNetworkManager()
        let baseURL: URL = URL(string: "https://api.spacexdata.com")! //BY NOW
        let presenter = AppPresenter(companyInfoFetcher: CompanyInfoFetcher(networkFetcher: networkFetcher, baseURL: baseURL),
                                     launchesFetcher: LaunchesFetcher(networkFetcher: networkFetcher, baseURL: baseURL),
                                     rocketFetcher: RocketFetcher(networkFetcher: networkFetcher, baseURL: baseURL),
                                     router: router)
        
        return (presenter, router)
    }
}
