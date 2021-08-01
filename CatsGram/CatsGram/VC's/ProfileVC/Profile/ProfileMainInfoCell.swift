//
//  ProfileMainInfoCellTableViewCell.swift
//  Lesson 9 (12) Insta App
//
//  Created by Alex Pupko on 10.06.21.
//

import UIKit

protocol ProfileCellDelegate: AnyObject {
    func editProfile()
}

struct ProfileMainInfoCellModel {
    let profileImage: UIImage
    let nameString: String
    let interestingsString: String
    let addresString: String
    let followersCount: String
    let followingCount: String
    let postsCount: String
}

final class ProfileMainInfoCell: UITableViewCell {

    @IBOutlet private weak var profileImage: UIImageView!
    @IBOutlet private weak var postCountText: UILabel!
    @IBOutlet private weak var postLabel: UILabel!
    @IBOutlet private weak var followersCount: UILabel!
    @IBOutlet private weak var followersLabel: UILabel!
    @IBOutlet private weak var followingCount: UILabel!
    @IBOutlet private weak var followingLabel: UILabel!
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var interestsLabel: UILabel!
    @IBOutlet private weak var adressLabel: UILabel!
    
    @IBOutlet private weak var editButton: UIButton!
   
    
    weak var delegate: ProfileCellDelegate?

    
    override func awakeFromNib() {
        super.awakeFromNib()

        profileImage.layer.cornerRadius = profileImage.frame.height / 2
        profileImage.layer.masksToBounds = true
        profileImage.layer.borderWidth = 2.0
        profileImage.layer.borderColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    }
    
    func setupWith(model:ProfileMainInfoCellModel) {
      
        profileImage.image = model.profileImage
        nameLabel.text = model.nameString
        interestsLabel.text = model.interestingsString
        adressLabel.text = model.addresString
        followersCount.text = model.followersCount
        followingCount.text = model.followingCount
        postCountText.text = model.postsCount
    
 }

    override class func description() -> String {
        return "ProfileMainInfoCell"
    }

    @IBAction func editProfileButton(_ sender: UIButton) {
   
        delegate?.editProfile()

    }
    
    
}



