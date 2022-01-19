//
//  MoviesCoreDataModel+CoreDataProperties.swift
//  Movie Application
//
//  Created by oluwayemisi oguntayo on 18/01/2022.
//
//

import Foundation
import CoreData


extension MoviesCoreDataModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MoviesCoreDataModel> {
        return NSFetchRequest<MoviesCoreDataModel>(entityName: "MoviesCoreDataModel")
    }

    @NSManaged public var title: String?
    @NSManaged public var year: String?
    @NSManaged public var rated: String?
    @NSManaged public var released: String?
    @NSManaged public var runtime: String?
    @NSManaged public var genre: String?
    @NSManaged public var director: String?
    @NSManaged public var writer: String?
    @NSManaged public var actors: String?
    @NSManaged public var plot: String?
    @NSManaged public var language: String?
    @NSManaged public var country: String?
    @NSManaged public var awards: String?
    @NSManaged public var poster: String?
    @NSManaged public var metascore: String?
    @NSManaged public var imdbRating: String?
    @NSManaged public var imdbVotes: String?
    @NSManaged public var imdbID: String?
    @NSManaged public var type: String?
    @NSManaged public var dvd: String?
    @NSManaged public var boxOffice: String?
    @NSManaged public var production: String?
    @NSManaged public var website: String?
    @NSManaged public var response: String?
    
    
    func updateWithMovies(movies: MoviDetailsResponse) {
        self.title = movies.Title
        self.year = movies.Year
        self.rated = movies.Rated
        self.released = movies.Released
        self.runtime = movies.Runtime
        self.genre = movies.Genre
        self.director = movies.Director
        self.writer = movies.Writer
        self.plot = movies.Plot
        self.language = movies.Language
        self.country = movies.Country
        self.awards = movies.Awards
        self.poster = movies.Poster
        self.metascore = movies.Metascore
        self.imdbRating = movies.imdbRating
        self.imdbVotes = movies.imdbVotes
        self.imdbID = movies.imdbID
        self.dvd = movies.DVD
        self.boxOffice = movies.BoxOffice
        self.production = movies.Production
        self.website = movies.Website
        self.response = movies.Response


    }

}

extension MoviesCoreDataModel : Identifiable {

}
