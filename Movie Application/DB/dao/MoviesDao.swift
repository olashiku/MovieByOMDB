//
//  MoviesDao.swift
//  Movie Application
//
//  Created by oluwayemisi oguntayo on 18/01/2022.
//

import Foundation


import CoreData

protocol MoviesDao {
    func getAllMovies() -> [MoviesCoreDataModel]
    func insertMovies(movies: [MoviDetailsResponse]) -> Bool

}

class MoviesDaoImpl: BaseDao, MoviesDao {
   
    
    func getAllMovies() -> [MoviesCoreDataModel] {
        var request = NSFetchRequest<NSFetchRequestResult>()
        request = MoviesCoreDataModel.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "Title", ascending: true)]
        return getAllItems(objectType: MoviesCoreDataModel.self, fetchRequest: request)
    }
    
    func insertMovies(movies: [MoviDetailsResponse]) -> Bool {
        let taskContent = startTask()
        taskContent.performAndWait {

            addAllItems(withItems: movies, taskContext: taskContent, objectType: MoviesCoreDataModel.self,
            updateEntity: {(movieDetailsResponse, moviesCoreDataModel) in
                            (moviesCoreDataModel as MoviesCoreDataModel).updateWithMovies(movies: movieDetailsResponse)
                taskContent.insert(moviesCoreDataModel)
            })
        }
        return saveChanges(taskContext: taskContent)
    }
    
    
}

