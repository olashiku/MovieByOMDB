//
//  BaseViewController.swift
//  Movie Application
//
//  Created by oluwayemisi oguntayo on 17/01/2022.
//

import UIKit
import RxCocoa
import RxSwift



class BaseViewController: UIViewController, UITextFieldDelegate{
    weak var dashboardCoordinator: DashboardCoordinator?
    weak var favoriteCoordinator: FavoriteCoordinator?
    weak var profileCoordinator: ProfileCoordinator?
    var disposeBag = DisposeBag()





}
