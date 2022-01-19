//
//  Coordinator.swift
//  Movie Application
//
//  Created by oluwayemisi oguntayo on 17/01/2022.
//

import UIKit
 
protocol Coordinator :AnyObject{
  var childCoordinators: [Coordinator] { get set }
  var navigationController: UINavigationController { get set }
  func start()
}


