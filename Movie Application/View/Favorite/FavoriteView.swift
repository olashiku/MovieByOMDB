//
//  FavoriteView.swift
//  Movie Application
//
//  Created by oluwayemisi oguntayo on 18/01/2022.
//

import Foundation
import SnapKit


extension FavoriteViewController{
    func setupConstraintsAndProperties(){
      addAllViews()
        setuptitleLabel()
        setupnoFavoriteLabel()
    }
      
      func addAllViews(){
          view.addSubview(titleLabel)
        view.addSubview(noFavoriteLabel)
          view.addSubview(collection_view)
          view.backgroundColor = .white
          

          titleLabel.snp.makeConstraints{ maker in
              maker.leading.trailing.equalToSuperview()
              maker.top.equalToSuperview().offset(100)
          }
        noFavoriteLabel.snp.makeConstraints{maker in
            maker.leading.trailing.equalToSuperview()
            maker.top.equalToSuperview().offset(400)

        }
          
          collection_view.snp.makeConstraints{ maker in
              maker.leading.trailing.equalToSuperview()
              maker.top.equalTo(titleLabel.snp.bottom).offset(20)
              maker.bottom.equalToSuperview()
          }
        
       
      }
      
      func setuptitleLabel(){
          titleLabel.text = "My Favourite Movies"
          titleLabel.textColor = .black
          titleLabel.textAlignment = .center
      }
    
    func setupnoFavoriteLabel(){
        noFavoriteLabel.text = "Your favourite movies would display here 😁"
        noFavoriteLabel.textColor = .black
        noFavoriteLabel.textAlignment = .center
    }
}
