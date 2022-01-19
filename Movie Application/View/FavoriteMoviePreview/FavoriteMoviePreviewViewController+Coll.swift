//
//  FavoriteMoviePreviewViewController+Coll.swift
//  Movie Application
//
//  Created by oluwayemisi oguntayo on 18/01/2022.
//

import Foundation
import UIKit


extension FavoriteMoviePreviewViewController{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        moviePreviewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteMovieCell", for: indexPath) as! FavoriteMovieCell
        cell.infos = moviePreviewModel[indexPath.item]
          return cell
    }
}
