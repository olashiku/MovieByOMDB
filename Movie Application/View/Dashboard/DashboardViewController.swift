//
//  DashboardViewController.swift
//  Movie Application
//
//  Created by oluwayemisi oguntayo on 17/01/2022.
//

import Foundation
import UIKit
import Swinject
import RxCocoa
import RxSwift
import MaterialComponents

class DashboardViewController:BaseViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    private let  movieViewModel: MovieViewModel = Container.sharedContainer.resolve(MovieViewModel.self)!
    var Search: [Search]? = []
    var mySearch: [Search]? = []

    let titleLabel = UILabel()
    let searchMovieField = MDCOutlinedTextField()

    
    
    lazy var collection_view : UICollectionView = {
    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.scrollDirection = .vertical
    flowLayout.minimumLineSpacing = 20
    flowLayout.minimumInteritemSpacing = 20
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.isScrollEnabled = true
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.backgroundColor = .clear
   collectionView.register(DashboardCell.self, forCellWithReuseIdentifier: "DashboardCell")
    flowLayout.itemSize = CGSize(width: view.frame.width, height: 300)
    return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraintsAndProperties()
        initAndGetValues()
        observeViewModel()
        observeMovieLists()
    }
    
    
    func observeMovieLists(){
       
    
        
        
        searchMovieField.rx.controlEvent([.editingChanged])
            .asObservable().subscribe({ [weak self] res in
      self?.watcher(movieName: (self?.searchMovieField.text)!)
            }).disposed(by: disposeBag)
    
    }
    
    
    func watcher(movieName:String){
        if(movieName.count != 0){
            self.Search =   self.mySearch?.filter({ Search in
                (Search.Title?.lowercased().contains(movieName))!})
            collection_view.reloadData()
        }else {
            self.Search =  self.mySearch
        }
    
    }
    
    func  initAndGetValues(){
        movieViewModel.getMovieList()
    }
    
    func observeViewModel(){
        movieViewModel.movieListResponse.observe(on: MainScheduler.instance).subscribe(onNext: {[weak self] response in
            self?.Search = response.Search
            self?.mySearch = response.Search
            self?.collection_view.reloadData()
        }).disposed(by:disposeBag )
        
        
        movieViewModel.moviDetailsResponse.observe(on: MainScheduler.instance).subscribe(onNext: {[weak self] response in
            self?.dashboardCoordinator?.moveToDisplayScreen(response: response)
        }).disposed(by:disposeBag )
    }
    
    func getFullDetailsFromAPI(_ index:Int){
        movieViewModel.getSelectedMovie(imdbID: Search?[index].imdbID ?? "")

    }
}
