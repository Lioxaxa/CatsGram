//
//  UICollectionVIewCell.swift
//  Lesson 9 (12) Insta App
//
//  Created by Alex Pupko on 14.06.21.
//

import UIKit

final class PhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    
    func setupWith(photo: UIImage) {
        photoImageView.image = photo
        
    }
  
    override func awakeFromNib() {
        super.awakeFromNib()
        
        photoImageView.layer.borderWidth = 2
        photoImageView.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }

    override class func description() -> String {
        return "PhotoCollectionViewCell"
    }
}




