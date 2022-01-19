

import Foundation


enum ApiService{
    case getAllBatmanMovies
    case getSingleMovie
}

extension ApiService: EndpointType {
    var path: String{
        switch self {
        case .getAllBatmanMovies:
            return "?s=Batman&apikey=67c0824e"
        case .getSingleMovie:
            return "&apikey=67c0824e"

        }
    }
    
    var baseURL: URL{
        return URL(string: "http://www.omdbapi.com/")!
    }
}

