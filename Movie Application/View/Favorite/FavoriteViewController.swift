//
//  FavoriteViewController.swift
//  Movie Application
//
//  Created by oluwayemisi oguntayo on 17/01/2022.
//

import Foundation
import UIKit
import CoreData
import Swinject


class FavoriteViewController:BaseViewController, UICollectionViewDelegate, NSFetchedResultsControllerDelegate,UICollectionViewDataSource{
    
    private let  movieViewModel: MovieViewModel = Container.sharedContainer.resolve(MovieViewModel.self)!

    
    let titleLabel = UILabel()
    let noFavoriteLabel = UILabel()
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
   collectionView.register(FavoriteCell.self, forCellWithReuseIdentifier: "FavoriteCell")
    flowLayout.itemSize = CGSize(width: view.frame.width, height: 300)
    return collectionView
    }()
    
    
    
    lazy var moviesFetchedResultController:NSFetchedResultsController<MoviesCoreDataModel> = {
           let fetchedRequest = NSFetchRequest<MoviesCoreDataModel>(entityName: "MoviesCoreDataModel")
           fetchedRequest.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
           let controller = NSFetchedResultsController(fetchRequest: fetchedRequest, managedObjectContext: movieViewModel.viewContext, sectionNameKeyPath: nil, cacheName: nil)
           
           controller.delegate = self
           
           do{
               try controller.performFetch()
           }catch{
               
           }
           
           return controller
       }()
    
    var movieList : [MoviesCoreDataModel] = []

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraintsAndProperties()
        movieList = moviesFetchedResultController.fetchedObjects ?? []
        collection_view.reloadData()
    }
    
    func getDetails(_ id:Int){
        favoriteCoordinator?.moveToDisplayScreen(response: (movieList[id]))
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        movieList = moviesFetchedResultController.fetchedObjects ?? []
        collection_view.reloadData()
    }
}
