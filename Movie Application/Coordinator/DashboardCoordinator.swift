//
//  DashboardCoordinator.swift
//  Movie Application
//
//  Created by oluwayemisi oguntayo on 17/01/2022.
//

import UIKit


class DashboardCoordinator:NSObject, Coordinator ,UINavigationControllerDelegate{
    weak var parentCoordinator:AppCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    let vc2 = DashboardViewController()

    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    weak var dashboardCoordinator: DashboardCoordinator?

    func start() {
        
        navigationController.delegate = self
        vc2.dashboardCoordinator = self
        vc2.title = "Home"
        navigationController.setNavigationBarHidden(true, animated: true)
        vc2.tabBarItem.image = imageWithImage(image: UIImage(named: "home_inactive")!, scaledToSize: CGSize(width: 20.0, height: 20.0))
        vc2.tabBarItem.selectedImage =  imageWithImage(image: UIImage(named: "home_active")!, scaledToSize: CGSize(width: 20.0, height: 20.0)).withRenderingMode(.alwaysOriginal)
        vc2.tabBarController?.tabBar.isHidden = false
        vc2.navigationItem.setHidesBackButton(true, animated: true)
        navigationController.pushViewController(vc2, animated: true)
   
    }
    
  
    
    func moveToDisplayScreen(response:MoviDetailsResponse){
        let vc = MoviePreviewViewController()
        vc.moviDetailsResponse = response
        navigationController.setNavigationBarHidden(true, animated: true)
        navigationController.navigationItem.setHidesBackButton(true, animated: true)
        vc.dashboardCoordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func popViewController(){
        navigationController.popViewController(animated: true)
    }

    
}
