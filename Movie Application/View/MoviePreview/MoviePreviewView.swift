//
//  MoviePreviewView.swift
//  Movie Application
//
//  Created by oluwayemisi oguntayo on 18/01/2022.
//

import Foundation
import UIKit
import SnapKit


extension MoviePreviewViewController{
    func setupConstraintAndProperties(){
        addAllViews()
        setupTitle()
        setupBackgroundView()
        setupPosterImage()
        setupMovieTitle()
        setupMovieBody()
        setupButton()
    }
    


    func addAllViews(){
        view.backgroundColor = .white
        view.addSubview(Title)
        view.addSubview(Background_view)
        Background_view.addSubview(PosterImage)
        Background_view.addSubview(MovieTitle)
        Background_view.addSubview(movieBody)
        view.addSubview(collection_view)
        view.addSubview(favoriteButton)
        
        Title.snp.makeConstraints{ maker in
            maker.leading.trailing.equalToSuperview()
            maker.top.equalToSuperview().offset(100)
        }
        
        
        Background_view.snp.makeConstraints{ maker in
            maker.height.equalTo(300)
            maker.top.equalTo(Title.snp.bottom).offset(10)
            maker.leading.trailing.equalToSuperview().inset(24)
        }
        
        PosterImage.snp.makeConstraints{ maker in
            maker.leading.trailing.equalTo(Background_view).inset(14)
            maker.top.equalTo(Background_view).offset(10)
            maker.height.equalTo(200)
        }
        
        MovieTitle.snp.makeConstraints{ maker in
            maker.leading.trailing.equalTo(Background_view).inset(10)
            maker.top.equalTo(PosterImage.snp.bottom).offset(10)
        }

        movieBody.snp.makeConstraints{ maker in
            maker.leading.trailing.equalTo(Background_view).inset(10)
            maker.top.equalTo(MovieTitle.snp.bottom).offset(5)
        }
        
        collection_view.snp.makeConstraints{maker in
            maker.leading.trailing.equalToSuperview().inset(10)
            maker.top.equalTo(favoriteButton.snp.bottom).offset(10)
            maker.bottom.equalToSuperview().offset(10)
            
        }
        
        favoriteButton.snp.makeConstraints{ maker in
            maker.leading.trailing.equalToSuperview().inset(20)
            maker.top.equalTo(Background_view.snp.bottom).offset(10)
            maker.height.equalTo(30)
        }
        
    }
    
    func setupTitle(){
        Title.text = "Movie Preview"
        Title.textColor = .black
        Title.textAlignment = .center
    }
    
    func setupBackgroundView(){
        Background_view.layer.cornerRadius = 20
        Background_view.layer.borderWidth = 2
        Background_view.backgroundColor = .black
        Background_view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupPosterImage(){
        PosterImage.translatesAutoresizingMaskIntoConstraints = false
        PosterImage.contentMode = .center
    }
    
    func setupMovieTitle(){
        MovieTitle.translatesAutoresizingMaskIntoConstraints = false
        MovieTitle.text = "BitCoin"
        MovieTitle.textColor = .white
        MovieTitle.numberOfLines = 0
        MovieTitle.font = MovieTitle.font.withSize(18)
        MovieTitle.textAlignment = .center
        MovieTitle.sizeToFit()
    }
    
    func  setupMovieBody(){
        movieBody.translatesAutoresizingMaskIntoConstraints = false
        movieBody.text = "BitCoin"
        movieBody.textColor = .white
        movieBody.font = movieBody.font.withSize(9)
        movieBody.textAlignment = .center
        movieBody.numberOfLines = 0
        movieBody.sizeToFit()
    }
    
    func setupButton(){        
        favoriteButton.backgroundColor = .black
        favoriteButton.setTitle("Add to favorite".localizedCapitalized, for: .normal)
        favoriteButton.isUppercaseTitle = false
        favoriteButton.layer.cornerRadius = 5
    }
}
