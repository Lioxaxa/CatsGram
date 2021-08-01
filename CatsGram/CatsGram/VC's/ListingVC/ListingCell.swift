//
//  ListingCell.swift
//  Lesson 9 (12) Insta App
//
//  Created by Alex Pupko on 24.05.21.
//

import UIKit

//protocol ListingCellModel: AnyObject {
//    var profileTitle: String? { get }
//    var profileImage: UIImage? { get }
//    var listingImage: UIImage? { get }
//    
//    var likeCount: String? { get }
//    
//    var photoDescription: NSAttributedString { get }
//    var photoComment: NSAttributedString { get }
//    
//    var isLiked: Bool { get }
//    var isComment: Bool { get }
//    var isExpand: Bool { get }
//    var isMarked: Bool { get }
//    var isDots: Bool { get }
//    var isShared: Bool { get }
//    var isSettinged: Bool { get }
//    var identifier: Int? { get }
//}
struct ListingCellModel {
    let profileTitle: String?
    let profileImage: UIImage?
    let listingImage: UIImage?

    let likeCount: String?

    let photoDescription: NSAttributedString
    let photoComment: NSAttributedString

    let isLiked: Bool
    let isComment: Bool
    let isExpand: Bool
    let isMarked: Bool
    let isDots: Bool
    let isShared: Bool
    let isSettinged: Bool
    let identifier: Int?
}

protocol ListingCellDelegate: AnyObject {
    func likeButton(id: Int)
    func commentButton(id: Int)
    func shareButton(id: Int)
    func bookmarkButton(id: Int)
    func dotsButton(id: Int)
    func expandButtonTapped(id: Int)

    func listingImageTapped(id: Int)
}

final class ListingCell: UITableViewCell {
    
    @IBOutlet private weak var profileTitle: UILabel!
    @IBOutlet private weak var profileImage: UIImageView!
    @IBOutlet private weak var listingImage: UIImageView!
    
    @IBOutlet private weak var likeButton: UIButton!
    @IBOutlet private weak var commentButton: UIButton!
    @IBOutlet private weak var shareButton: UIButton!
    @IBOutlet private weak var markButton: UIButton!
    @IBOutlet private weak var dotsButton: UIButton!
    
    @IBOutlet private weak var likeCountLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    @IBOutlet private weak var expandDescriptionButton: UIButton!
    @IBOutlet private weak var descriptionRightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var commentLabel: UILabel!
    
    
    var dataSource: [UIImage] = []
    
    weak var delegate: ListingCellDelegate?
    private var identifier: Int?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        listingImage.addGestureRecognizer(tap)
        


        
    }

    
    
    

    
    func setupWithModel(model: ListingCellModel) {
        identifier = model.identifier
        
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
        profileImage.layer.masksToBounds = true
        profileImage.layer.borderWidth = 2.0
        profileImage.layer.borderColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        
        likeButton.setBackgroundImage(UIImage.init(systemName: model.isLiked ?
                                                    "heart.fill" : "heart"), for: .normal)
        likeButton.tintColor = model.isLiked ? .red : .white
        
        markButton.setBackgroundImage(UIImage.init(systemName: model.isMarked ? "bookmark.fill" : "bookmark"), for: .normal)
        
        shareButton.setBackgroundImage(UIImage.init(systemName: model.isShared ? "paperplane.fill" : "paperplane"), for: .normal)
        
        // DOTS
        dotsButton.tintColor = model.isDots ? .white : .red
        
        descriptionLabel.attributedText = model.photoDescription
        likeCountLabel.text = model.likeCount
        
        descriptionLabel.numberOfLines = model.isExpand ? 0 : 1
        descriptionLabel.lineBreakMode = .byTruncatingTail
        descriptionRightConstraint.constant = model.isExpand ? 8 : 64
        expandDescriptionButton.isHidden = model.isExpand
        
        commentLabel.attributedText = model.photoComment
        
        if model.isExpand {
            descriptionRightConstraint.constant = 8
        } else {
            let isMoreThanOneLine = descriptionLabel.calculateMaxLines() > 1
            descriptionRightConstraint.constant = !isMoreThanOneLine ? 8 : 64
            expandDescriptionButton.isHidden = !isMoreThanOneLine
        }
        // здесть кнопка ЕЩЕ хайден если число строк не больше 1
        
        
        
        if let name = model.profileTitle {
            profileTitle.text = name
        }
        
        if let profileImg = model.profileImage{
            profileImage.image = profileImg
        }
        
        if let listingImg = model.listingImage {
            listingImage.image = listingImg
        }
    
    }
    override class func description() -> String {
        return "ListingCell"
    }
    
    
    
    @objc private func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        guard let id = identifier else { return }
        delegate?.listingImageTapped(id: id)
    }
    
 
    
    @IBAction private func likeButton(_ sender: UIButton) {
        guard let id = identifier else {return}
        delegate?.likeButton(id: id)
        
    }
    @IBAction private func commentButton(_ sender: UIButton) {
        guard let id = identifier else {return}
        delegate?.commentButton(id: id)
    }
    @IBAction private func shareButton(_ sender: UIButton) {
        guard let id = identifier else {return}
        delegate?.shareButton(id: id)
    }
    @IBAction private func bookmarkButton(_ sender: UIButton) {
        guard let id = identifier else {return}
        delegate?.bookmarkButton(id: id)
    }
    @IBAction private func dotsButton(_ sender: UIButton) {
        guard let id = identifier else {return}
        delegate?.dotsButton(id: id)
    }
    
    @IBAction private func expandButtonTapped(_ sender: UIButton) {
        guard let id = identifier else {return}
        delegate?.expandButtonTapped(id: id)
    }
}
 

