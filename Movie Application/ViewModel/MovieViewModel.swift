

import Foundation
import RxSwift
import Swinject
import CoreData


class MovieViewModel: BaseViewModel{
    let movieRepository: MoviesRepository
    let movieListResponse = PublishSubject<MovieListResponse>()
    let moviDetailsResponse = PublishSubject<MoviDetailsResponse>()
    private let moviesDao: MoviesDao
    let viewContext:NSManagedObjectContext

    

    
    init(movieRepository: MoviesRepository,moviesDao: MoviesDao,viewContext:NSManagedObjectContext){
        self.movieRepository = movieRepository
        self.moviesDao = moviesDao
     self.viewContext = viewContext
    }
    
    func getAllMovies()->[MoviesCoreDataModel]{
        return movieRepository.getAllMovies()
    }
    
    func insertMoviesIntoDB(response:MoviDetailsResponse?){
        var movieList : [MoviDetailsResponse] = []
        movieList.append(response!)
        self.moviesDao.insertMovies(movies:movieList)
    }
    
    
    
    func getMovieList(){
        makeAPICallRxGet( apiRequest: movieRepository.getMovieList, successHandler: movieListResponse)
    }
    
    func getSelectedMovie(imdbID:String){
        let request = imdbID
        makeAPICallRx(request: request, apiRequest: movieRepository.getSelectedMovie(request:), successHandler: moviDetailsResponse)

    }
}
