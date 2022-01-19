//
//  ExtensionFunctions.swift
//  Movie Application
//
//  Created by oluwayemisi oguntayo on 17/01/2022.
//

import Foundation
import UIKit

func random(length: Int = 6) -> String {
    let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    var randomString: String = ""
    
    for _ in 0..<length {
        let randomValue = arc4random_uniform(UInt32(base.count))
        randomString += "\(base[base.index(base.startIndex, offsetBy: Int(randomValue))])"
    }
    return randomString
}


extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}


extension UIImageView {
    func setRoundeded() {
           self.layer.cornerRadius = (self.frame.width / 2) //instead of let radius = CGRectGetWidth(self.frame) / 2
           self.layer.masksToBounds = true
       }
    }


func rotate(imageView: UIImageView) { //CAKeyframeAnimation
    
    let animation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
    animation.duration = 2
    animation.fillMode = CAMediaTimingFillMode.forwards
    animation.repeatCount = .infinity
    animation.values = [0, Double.pi/2, Double.pi, Double.pi*3/2, Double.pi*2]
    //Percentage of each key frame
    animation.keyTimes = [NSNumber(value: 0.0), NSNumber(value: 0.1),
                          NSNumber(value: 0.3), NSNumber(value: 0.8), NSNumber(value: 1.0)]
    
    imageView.layer.add(animation, forKey: "rotate")
}
 
func imageWithImage(image:UIImage, scaledToSize newSize:CGSize) -> UIImage{
    UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0);
    image.draw(in: CGRect(origin: CGPoint.zero, size: CGSize(width: newSize.width, height: newSize.height)))
    let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
    UIGraphicsEndImageContext()
    return newImage
}

func getCorrectNumber(somenumbers:String)->String{

    var number = ""
    if(somenumbers.prefix(1) == "0"){
        number = "234" + somenumbers.dropFirst()
    } else {
        number = "234"+somenumbers
    }
     return number
 }




