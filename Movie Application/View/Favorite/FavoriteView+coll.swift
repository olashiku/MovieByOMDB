//
//  FavoriteView+coll.swift
//  Movie Application
//
//  Created by oluwayemisi oguntayo on 18/01/2022.
//

import Foundation
import UIKit

// noFavoriteLabel

extension FavoriteViewController{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if( movieList.count == 0){
            noFavoriteLabel.isHidden = false
            collection_view.isHidden = true
        }else {
            noFavoriteLabel.isHidden = true
            collection_view.isHidden = false
    }
        return  movieList.count ?? 0

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteCell", for: indexPath) as! FavoriteCell
        cell.infos = movieList[indexPath.item]
          return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        getDetails(indexPath.item)
    }
}
