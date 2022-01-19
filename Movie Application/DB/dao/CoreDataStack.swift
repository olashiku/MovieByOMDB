//
//  CoreDataStack.swift
//  Movie Application
//
//  Created by oluwayemisi oguntayo on 18/01/2022.
//

import Foundation


import CoreData
      
class CoreDataStack {
    private init() {}
    static let shared = CoreDataStack()

    lazy var persistentContainer: NSPersistentContainer = {
       let container = NSPersistentContainer(name: "MoviesCoreDataModel")

        container.loadPersistentStores(completionHandler: { (_, error) in
            guard let error = error as NSError? else { return }
            fatalError("Unresolved error: \(error), \(error.userInfo)")
        })

        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        container.viewContext.undoManager = nil
        container.viewContext.shouldDeleteInaccessibleFaults = true

        container.viewContext.automaticallyMergesChangesFromParent = true

        return container
    }()
    
}

