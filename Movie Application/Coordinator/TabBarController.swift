//
//  TabBarController.swift
//  Movie Application
//
//  Created by oluwayemisi oguntayo on 17/01/2022.
//

import UIKit

class TabBarController: UITabBarController, UINavigationControllerDelegate {

    
    weak var appCoordinator: AppCoordinator?
    private let dashboard = DashboardCoordinator(navigationController: UINavigationController())
    private let favorite = FavoriteCoordinator(navigationController: UINavigationController())
    private let profile = ProfileCoordinator(navigationController: UINavigationController())



    func start() {
        navigationController?.delegate = self
        initialiseViews()
    
    }
    
    func initialiseViews(){
        dashboard.start()
        favorite.start()
        profile.start()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dashboard.start()
        favorite.start()
        profile.start()
   
        viewControllers = [dashboard.navigationController,favorite.navigationController, profile.navigationController]
        UITabBar.appearance().barTintColor = UIColor.white

        
    }
    
    
}
