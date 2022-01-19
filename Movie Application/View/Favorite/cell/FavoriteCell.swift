//
//  FavoriteCell.swift
//  Movie Application
//
//  Created by oluwayemisi oguntayo on 18/01/2022.
//



import Foundation
import UIKit
import SnapKit




class FavoriteCell: UICollectionViewCell{
    
    var infos : MoviesCoreDataModel? {
        didSet{
            guard
                
                let coin_title = infos?.title,
                let coin_image = infos?.poster,
                let coin_body = infos?.year

            else{

            return
            }
         
            title.text = coin_title
            body.text = coin_body
            imageView.downloaded(from: coin_image)
       
        }
    }

    lazy var background_view: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 2
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        
      return view
    }()
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "BitCoin"
        label.textColor = .white
        label.numberOfLines = 0
        label.font = label.font.withSize(18)
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    
    lazy var body: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "BitCoin"
        label.textColor = .white
        label.font = label.font.withSize(9)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    
    lazy var imageView: UIImageView = {
         let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .center
          return imageView
      }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func initializeView (){
        backgroundColor = .clear
        addSubview(background_view)
        background_view.addSubview(imageView)
        background_view.addSubview(title)
        background_view.addSubview(body)
       
        background_view.snp.makeConstraints{ maker in
            maker.height.equalTo(300)
            maker.leading.trailing.equalToSuperview().inset(24)
        }
        
        imageView.snp.makeConstraints{ maker in
            maker.leading.trailing.equalTo(background_view).inset(14)
            maker.top.equalTo(background_view).offset(10)
            maker.height.equalTo(200)
        }
        
        title.snp.makeConstraints{ maker in
            maker.leading.trailing.equalTo(background_view).inset(10)
            maker.top.equalTo(imageView.snp.bottom).offset(10)
        }

        body.snp.makeConstraints{ maker in
            maker.leading.trailing.equalTo(background_view).inset(10)
            maker.top.equalTo(title.snp.bottom).offset(5)
        }
        
    }

    

}
