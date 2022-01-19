//
//  MoviePreviewViewController.swift
//  Movie Application
//
//  Created by oluwayemisi oguntayo on 18/01/2022.
//

import Foundation
import UIKit
import MaterialComponents
import Swinject
import RxCocoa
import RxSwift


class MoviePreviewViewController:BaseViewController, UICollectionViewDelegate, UICollectionViewDataSource{
 
    private let  movieViewModel: MovieViewModel = Container.sharedContainer.resolve(MovieViewModel.self)!

    var moviDetailsResponse : MoviDetailsResponse?  = nil
    
    var moviePreviewModel : [MoviePreviewModel] = []
    
    let Title = UILabel()
    let Background_view = UIView()
    let PosterImage = UIImageView()
    let MovieTitle = UILabel()
    let movieBody = UILabel()
    let favoriteButton = MDCButton()


    lazy var collection_view : UICollectionView = {
    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.scrollDirection = .vertical
    flowLayout.minimumLineSpacing = 5
    flowLayout.minimumInteritemSpacing = 5
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.isScrollEnabled = true
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.backgroundColor = .clear
   collectionView.register(MovieCell.self, forCellWithReuseIdentifier: "MovieCell")
    flowLayout.itemSize = CGSize(width: view.frame.width, height: 30)
    return collectionView
    }()
    
    
    override func viewDidLoad() {
        setupConstraintAndProperties()
        initMovieValues()
        initOtherValues()
        initOnClick()
    }
    
    func initOnClick(){
        favoriteButton.rx.tap.bind{
            self.displayAlert()
        }.disposed(by: disposeBag)
    }
    
    func  initMovieValues(){
        PosterImage.downloaded(from: moviDetailsResponse?.Poster ?? "")
        MovieTitle.text = moviDetailsResponse?.Title ?? ""
        movieBody.text = moviDetailsResponse?.Plot ?? ""
    }
    
    func  initOtherValues(){
        let value =    MoviePreviewModel()
        value.title = "Title"
        value.value = moviDetailsResponse?.Title
        
        let value2 =    MoviePreviewModel()
        value2.title = "Year"
        value2.value = moviDetailsResponse?.Year
        
        let value3 =    MoviePreviewModel()
        value3.title = "Rated"
        value3.value = moviDetailsResponse?.Rated
        
        let value4 =    MoviePreviewModel()
        value4.title = "Released"
        value4.value = moviDetailsResponse?.Released
        
        let value5 =    MoviePreviewModel()
        value5.title = "Runtime"
        value5.value = moviDetailsResponse?.Runtime
        
        let value6 =    MoviePreviewModel()
        value6.title = "Genre"
        value6.value = moviDetailsResponse?.Genre
        
        let value7 =    MoviePreviewModel()
        value7.title = "Director"
        value7.value = moviDetailsResponse?.Director
        
        let value8 =    MoviePreviewModel()
        value8.title = "Writer"
        value8.value = moviDetailsResponse?.Writer
        
        let value9 =    MoviePreviewModel()
        value9.title = "Actors"
        value9.value = moviDetailsResponse?.Actors
        
        let value10 =    MoviePreviewModel()
        value10.title = "Plot"
        value10.value = moviDetailsResponse?.Plot
        
        let value11 =    MoviePreviewModel()
        value11.title = "Language"
        value11.value = moviDetailsResponse?.Language
        
        let value12 =    MoviePreviewModel()
        value12.title = "Country"
        value12.value = moviDetailsResponse?.Country
        
        let value13 =    MoviePreviewModel()
        value13.title = "Awards"
        value13.value = moviDetailsResponse?.Awards
        
        let value14 =    MoviePreviewModel()
        value14.title = "Metascore"
        value14.value = moviDetailsResponse?.Metascore
        
        let value15 =    MoviePreviewModel()
        value15.title = "imdbRating"
        value15.value = moviDetailsResponse?.imdbRating
        
        let value16 =    MoviePreviewModel()
        value16.title = "imdbVotes"
        value16.value = moviDetailsResponse?.imdbVotes
        
        let value17 =    MoviePreviewModel()
        value17.title = "imdbID"
        value17.value = moviDetailsResponse?.imdbID
        
        
        let value18 =    MoviePreviewModel()
        value18.title = "Type"
        value18.value = moviDetailsResponse?.Type
        
        let value19 =    MoviePreviewModel()
        value19.title = "DVD"
        value19.value = moviDetailsResponse?.DVD
        
        
        let value20 =    MoviePreviewModel()
        value20.title = "BoxOffice"
        value20.value = moviDetailsResponse?.BoxOffice
        
        let value21 =    MoviePreviewModel()
        value21.title = "Production"
        value21.value = moviDetailsResponse?.Production
        
        let value22 =    MoviePreviewModel()
        value22.title = "Website"
        value22.value = moviDetailsResponse?.Website
  
        moviePreviewModel.append(value)
        moviePreviewModel.append(value2)
        moviePreviewModel.append(value3)
        moviePreviewModel.append(value4)
        moviePreviewModel.append(value5)
        moviePreviewModel.append(value6)
        moviePreviewModel.append(value7)
        moviePreviewModel.append(value8)
        moviePreviewModel.append(value9)
        moviePreviewModel.append(value10)
        moviePreviewModel.append(value11)
        moviePreviewModel.append(value12)
        moviePreviewModel.append(value13)
        moviePreviewModel.append(value14)
        moviePreviewModel.append(value15)
        moviePreviewModel.append(value16)
        moviePreviewModel.append(value17)
        moviePreviewModel.append(value18)
        moviePreviewModel.append(value19)
        moviePreviewModel.append(value20)
        moviePreviewModel.append(value21)
        moviePreviewModel.append(value22)
        
    }
    
    
    func displayAlert(){
        
        let movietitle = moviDetailsResponse?.Title ?? ""
        let alert = UIAlertController(title: "Success", message: "You have successfully added \(movietitle) to your favorite movies", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OKAY", style: .default, handler: { [weak self] (action: UIAlertAction!) in
            self?.dashboardCoordinator?.popViewController()
            self?.movieViewModel.insertMoviesIntoDB(response: self?.moviDetailsResponse! ?? nil)
        }))
        self.present(alert, animated: true)
    }
}


