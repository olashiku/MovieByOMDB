//
//  MoviewRepository.swift
//  Movie Application
//
//  Created by oluwayemisi oguntayo on 18/01/2022.
//

import RxSwift
import CoreData
import Kingfisher


protocol MoviesRepository{
    func getMovieList() -> Observable<NetworkResult<MovieListResponse>>
    func getSelectedMovie(request:String) -> Observable<NetworkResult<MoviDetailsResponse>>
    func getAllMovies() -> [MoviesCoreDataModel]

}


class MovieRepositoryImpl: BaseRepository, MoviesRepository{
    
    private let movieDao: MoviesDao
    private let persistentContainer: NSPersistentContainer


    
     init(persistentContainer:NSPersistentContainer,movieDao:MoviesDao) {
        self.movieDao = movieDao
        self.persistentContainer = persistentContainer
    }
    
   
    func getAllMovies() -> [MoviesCoreDataModel] {
        return movieDao.getAllMovies()
    }
    
   
    
    func getSelectedMovie(request: String) -> Observable<NetworkResult<MoviDetailsResponse>> {
        let requestString = "?i=\(request)"
        return makeNetworkPostRequest(endPoint: .getSingleMovie,request:requestString, response: MoviDetailsResponse.self, successCondition: {response in
            response.Response == "True"
        }, errorMessage: {response in
            response.Response ?? "Something went wrong"
        })
    }
    

   
    func getMovieList() -> Observable<NetworkResult<MovieListResponse>> {
        return makeNetworkPostRequestRx(endPoint: .getAllBatmanMovies, response: MovieListResponse.self, successCondition: {response in
            response.Response == "True"
        }, errorMessage: {response in
            response.Response ?? "Something went wrong"
        })
    }
    
}
