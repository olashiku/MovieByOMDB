//
//  DashboardViewController+Coll.swift
//  Movie Application
//
//  Created by oluwayemisi oguntayo on 18/01/2022.
//

import Foundation
import UIKit

extension DashboardViewController{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Search?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DashboardCell", for: indexPath) as! DashboardCell
        cell.infos = Search?[indexPath.item]
          return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        getFullDetailsFromAPI(indexPath.item)
    }
    
    
}
