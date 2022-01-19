//
//  MovieModel.swift
//  Movie Application
//
//  Created by oluwayemisi oguntayo on 18/01/2022.
//

import Foundation


struct MovieListResponse:Codable{
    let totalResults: String?
    let Response: String?
    let Search: [Search]?
}

struct Search:Codable {
    let Title: String?
    let Year: String?
    let imdbID : String?
    let `Type`: String?
    let Poster:String?
}

struct MoviDetailsResponse:Codable{
    let Title: String?
    let Year: String?
    let Rated: String?
    let Released: String?
    let Runtime: String?
    let Genre: String?
    let Director: String?
    let Writer: String?
    let Actors: String?
    let Plot: String?
    let Language: String?
    let Country: String?
    let Awards: String?
    let Poster: String?
    let Ratings: [Rating]?
    let Metascore: String?
    let imdbRating: String?
    let imdbVotes: String?
    let imdbID: String?
    let `Type`: String?
    let DVD: String?
    let BoxOffice: String?
    let Production: String?
    let Website: String?
    let Response: String?
}

struct Rating:Codable{
    let Source:String
    let Value:String
}




