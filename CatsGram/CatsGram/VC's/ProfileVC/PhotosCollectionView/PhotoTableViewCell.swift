//
//  PhotoCollectionViewTableViewCell.swift
//  Lesson 9 (12) Insta App
//
//  Created by Alex Pupko on 14.06.21.
//

import UIKit

protocol PhotoTableViewCellDelegate: AnyObject {
    func photoSelected(photo: UIImage)
}

final class PhotoTableViewCell: UITableViewCell {
    @IBOutlet private weak var collectionView: UICollectionView!

    var dataSource: [UIImage] = []
    
    weak var delegate: PhotoTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        let nib = UINib(nibName: PhotoCollectionViewCell.description(), bundle: nil)

        collectionView.register(nib, forCellWithReuseIdentifier: PhotoCollectionViewCell.description())
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func setupWith(photos: [UIImage]) {
        dataSource = photos
        collectionView.reloadData()
    }
    
    override class func description() -> String {
        return "PhotoTableViewCell"
    }

}

//MARK: - UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout

extension PhotoTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
        
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photo = dataSource[indexPath.item]
        delegate?.photoSelected(photo: photo)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.description(), for: indexPath) as! PhotoCollectionViewCell
        cell.setupWith(photo: dataSource[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.width / 3
        return CGSize(width: size, height: size)
        
    }

}



