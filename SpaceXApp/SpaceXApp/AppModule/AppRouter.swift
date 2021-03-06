//
//  AppRouter.swift
//  Routing
//
//  Created by Ramon Haro Marques
//

import Data
import Presentation
import Routing
import Info
import UI
import UIKit

public protocol AppRouterInterface: Router {
    func routeGeneralInfo(companyInfoFetcher: CompanyInfoFetcherInterface, launchesFetcher: LaunchesFetcherInterface, rocketFetcher: RocketFetcherInterface)
}

public class AppRouter: AppRouterInterface {
    //MARK: - Properties
    let window: UIWindow
    var navigationController: UINavigationController?
    
    
    //MARK: - Constructor
    public init(window: UIWindow) {
        self.window = window
    }
    
    
    //MARK: - AppRouterInterface imlementation
    public weak var parent: Router?
    
    public func start() {
        navigationController = LightNavigationController()
        window.rootViewController = navigationController
    }
    
    public func routeGeneralInfo(companyInfoFetcher: CompanyInfoFetcherInterface, launchesFetcher: LaunchesFetcherInterface, rocketFetcher: RocketFetcherInterface) {
        let module = InfoGeneralModule.initialise(host: navigationController,
                                                  companyFetcher: companyInfoFetcher,
                                                  launchesFetcher: launchesFetcher,
                                                  rocketFetcher: rocketFetcher)
        
        module.router.parent = self
        module.router.start()
    }
}
