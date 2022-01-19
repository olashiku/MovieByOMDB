//
//  MovieCell.swift
//  Movie Application
//
//  Created by oluwayemisi oguntayo on 18/01/2022.
//

import Foundation


import Foundation
import UIKit




class FavoriteMovieCell: UICollectionViewCell{
    
    var infos : MoviePreviewModel? {
        didSet{
            guard
                
                let coin_title = infos?.title,
               let coin_value = infos?.value
            
            else{

            return
            }
            
            titleLabel.text = coin_title
            bodyLabel.text = coin_value
        }
    }

    lazy var base_view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
      return view
    }()
    
    
    lazy var background_view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true

      return view
    }()
    
//    lazy var line:UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.layer.borderWidth = 1
//        backgroundColor = .gray
//       return view
//    }()
    
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Profile"
        label.textColor = .black
        label.numberOfLines = 0
        label.font = label.font.withSize(10)
        label.sizeToFit()
        return label
    }()
    
    lazy var bodyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Profile"
        label.textColor = .black
        label.numberOfLines = 0
        label.font = label.font.withSize(10)
        label.sizeToFit()
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
  //      contentView.backgroundColor = .red
        initializeView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initializeView(){
        addSubview(base_view)
        base_view.addSubview(background_view)
        background_view.addSubview(titleLabel)
        background_view.addSubview(bodyLabel)
       // background_view.addSubview(line)

        
        base_view.snp.makeConstraints{maker in
            maker.height.equalTo(59)
            maker.width.equalTo(contentView.frame.size.width)
        }
        
        
        background_view.snp.makeConstraints{maker in
            maker.height.equalTo(20)
            maker.leading.trailing.equalToSuperview().inset(20)
        }
        
      
        
        titleLabel.snp.makeConstraints{ maker in
            maker.centerY.equalTo(background_view)
            maker.left.equalTo(background_view.snp.left).offset(10)
        }
        
        bodyLabel.snp.makeConstraints{ maker in
            maker.centerY.equalTo(background_view)
            maker.leading.equalTo(titleLabel.snp.trailing).offset(5)
            maker.trailing.equalTo(background_view.snp.trailing).inset(10)
            
        }
        
      
        
        
    }
    
}

