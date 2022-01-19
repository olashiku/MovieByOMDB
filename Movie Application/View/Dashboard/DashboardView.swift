//
//  DashboardView.swift
//  Movie Application
//
//  Created by oluwayemisi oguntayo on 18/01/2022.
//

import Foundation
import SnapKit


extension DashboardViewController{
  func setupConstraintsAndProperties(){
    addAllViews()
    setuptitleLabel()
    setupsearchMovieField()
  }
    
    func addAllViews(){
        view.addSubview(titleLabel)
        view.addSubview(collection_view)
        view.addSubview(searchMovieField)
        view.backgroundColor = .white
        

        titleLabel.snp.makeConstraints{ maker in
            maker.leading.trailing.equalToSuperview()
            maker.top.equalToSuperview().offset(100)
        }
        
        searchMovieField.snp.makeConstraints{maker in
            maker.leading.trailing.equalToSuperview().inset(25)
            maker.top.equalTo(titleLabel.snp.bottom).offset(10)
            
        }
        
        collection_view.snp.makeConstraints{ maker in
            maker.leading.trailing.equalToSuperview()
            maker.top.equalTo(searchMovieField.snp.bottom).offset(10)
            maker.bottom.equalToSuperview()
        }
    }
    
    func setuptitleLabel(){
        titleLabel.text = "Dashboard"
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
    }
    
    func setupsearchMovieField(){
        searchMovieField.label.text = "Search Movie List"
        searchMovieField.setNormalLabelColor(.black, for: .normal)
        searchMovieField.tintColor = .gray
        searchMovieField.setTextColor(.black, for: .editing)
        searchMovieField.setTextColor(UIColor.black, for: .normal)
        searchMovieField.sizeToFit()
        searchMovieField.setOutlineColor(.gray, for: .normal)
        searchMovieField.setOutlineColor(.gray, for: .editing)
        searchMovieField.keyboardType = .namePhonePad
    }
}
