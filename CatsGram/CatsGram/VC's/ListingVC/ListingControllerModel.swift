//
//  ListingControllerModel.swift
//  Lesson 9 (12) Insta App
//
//  Created by Alex Pupko on 3.06.21.
//

import Foundation

import UIKit

final class  ListingModel {
    let profileTitle: String
    let profileImage: UIImage
    let listingImage: UIImage
    let description: String
    var statistics:(like: Int, views: Int)
    var isLiked: Bool
    var isComment: Bool
    var isExpanded: Bool
    var isMark: Bool
    var isDots: Bool
    var isShared: Bool
    var isSettinged: Bool
    let identifier: Int
    
    var comments: [CommentModel]
    
    var attributedComment: NSAttributedString {
        let string = NSMutableAttributedString(string: "")
        for comment in comments {
            let attributedString = NSMutableAttributedString(string: comment.commentOwner,
                                                       attributes: [.font :
                                                                        UIFont.boldSystemFont(ofSize: 16.0)])
            attributedString.append(NSAttributedString(string: "\(comment.commentText)",
                                                       attributes: [.font : UIFont.systemFont(ofSize: 16.0, weight: .light)]))
            attributedString.append(NSAttributedString(string: "\n",
                                                       attributes: [.font : UIFont.systemFont(ofSize: 16.0,
                                                                                              weight: .light)]))
            string.append(attributedString)
        }
        
        return string
    }
    
    
    
    
    var attribudtedDescription: NSMutableAttributedString {
        
        let attributedString =  NSMutableAttributedString(string: profileTitle,
                                                          attributes: [.font : UIFont.boldSystemFont(ofSize: 17.0)])
        
        attributedString.append(NSAttributedString(string: " \(description)",
                                                   attributes: [.font : UIFont.systemFont(ofSize: 17.0, weight: .light)]))
        
        return attributedString
    }
    
    init (profileTitle: String, profileImage: UIImage,listingImage: UIImage, description: String, statistics:(like: Int, views: Int), isLiked: Bool, isComment: Bool,  isExpanded: Bool, isMark: Bool, isDots: Bool, isShared: Bool, isSettinged: Bool, identifier: Int, comments: [CommentModel])
    {
        
        self.profileTitle = profileTitle
        self.profileImage = profileImage
        self.listingImage = listingImage
        self.description = description
        self.statistics = statistics
        self.isLiked = isLiked
        self.isComment = isComment
        self.isExpanded = isExpanded
        self.isMark = isMark
        self.isDots = isDots
        self.isShared = isShared
        self.isSettinged = isSettinged
        self.identifier = identifier
        self.comments = comments
    
    }
}

struct CommentModel {
    let commentOwner: String
    let commentText: String
}
