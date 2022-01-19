//
//  AppCoordinator.swift
//  Movie Application
//
//  Created by oluwayemisi oguntayo on 17/01/2022.
//



import UIKit

class AppCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
   
    
    func start() {
        let mainTab = TabBarController()
          mainTab.navigationItem.setHidesBackButton(true, animated: true)
        navigationController.isNavigationBarHidden = true
        mainTab.appCoordinator = self
        navigationController.viewControllers = [mainTab]
    }
    
    func imageWithImage(image:UIImage, scaledToSize newSize:CGSize) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0);
        image.draw(in: CGRect(origin: CGPoint.zero, size: CGSize(width: newSize.width, height: newSize.height)))
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
    
    
}



