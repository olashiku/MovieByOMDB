//
//  ProfileCoordinator.swift
//  Movie Application
//
//  Created by oluwayemisi oguntayo on 17/01/2022.
//

import UIKit



class ProfileCoordinator:NSObject, Coordinator ,UINavigationControllerDelegate{
    
    weak var parentCoordinator:AppCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    let vc2 = ProfileViewController()

    
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
   
        navigationController.delegate = self
        vc2.profileCoordinator = self
        vc2.title = "Profile"
        navigationController.setNavigationBarHidden(true, animated: true)
        vc2.tabBarItem.image = imageWithImage(image: UIImage(named: "profile_inactive")!, scaledToSize: CGSize(width: 20.0, height: 20.0))
        vc2.tabBarItem.selectedImage =  imageWithImage(image: UIImage(named: "profile_active")!, scaledToSize: CGSize(width: 20.0, height: 20.0)).withRenderingMode(.alwaysOriginal)
        vc2.tabBarController?.tabBar.isHidden = false
        vc2.navigationItem.setHidesBackButton(true, animated: true)
        navigationController.pushViewController(vc2, animated: true)
   
    }

}

