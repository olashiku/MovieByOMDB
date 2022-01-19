//
//  Container.swift
//  Movie Application
//
//  Created by oluwayemisi oguntayo on 17/01/2022.
//

import Foundation
import Swinject
import SwinjectAutoregistration
import CoreData


extension Container {
 
    static let sharedContainer:Container = {
        let container  = Container()

         container.autoregister(AppCoordinator.self, initializer: {
            let navController = UINavigationController()
            return AppCoordinator(navigationController: navController)
         })
        
        //DAO
        container.autoregister(NSManagedObjectContext.self, initializer: {CoreDataStack.shared.persistentContainer.viewContext})
        container.autoregister(NSPersistentContainer.self, initializer: {CoreDataStack.shared.persistentContainer})
        container.autoregister(BaseDao.self, initializer: BaseDao.init)
        container.autoregister(MoviesDao.self, initializer: MoviesDaoImpl.init)
        
        //REPOSITORY
        container.autoregister(MoviesRepository.self, initializer: MovieRepositoryImpl.init)

       //VIEWMODELS
        container.autoregister(MovieViewModel.self, initializer: MovieViewModel.init)
        
     
        return container
    }()

}
