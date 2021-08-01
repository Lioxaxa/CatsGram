//
//  ProfileCell.swift
//  Lesson 9 (12) Insta App
//
//  Created by Alex Pupko on 10.06.21.
//

import UIKit

struct ProfileControllerModel {
    let profileImage: UIImage
    let nameString: String
    let interestingsString: String
    let addresString: String
    let followersCount: String
    let followingCount: String
    let postsCount: String
    
    var photos: [UIImage]
}

final class ProfileViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    
    enum ControllerSections {
        case mainInfo
        case photo
    }
    
    private var profileModel: ProfileControllerModel
    private let dataSource: [ControllerSections] = [.mainInfo, .photo]
    
    
    
    required init?(coder: NSCoder) {
        profileModel = ProfileControllerModel (profileImage:  #imageLiteral(resourceName: "5-1"),
                                               nameString: "Кит",
                                               interestingsString: "Eat and Sleep",
                                               addresString: "New York",
                                               followersCount: "123",
                                               followingCount: "42",
                                               postsCount: "3",
                                               photos: [#imageLiteral(resourceName: "4-1"), #imageLiteral(resourceName: "5-1"), #imageLiteral(resourceName: "7-1"), #imageLiteral(resourceName: "3-1"), #imageLiteral(resourceName: "6-1"), #imageLiteral(resourceName: "2-1"), #imageLiteral(resourceName: "1-1"), #imageLiteral(resourceName: "8-1"), UIImage(named: "9-1")!])
        super.init(coder: coder)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: ProfileMainInfoCell.description(), bundle: nil), forCellReuseIdentifier:   ProfileMainInfoCell.description())
        
        tableView.register(UINib(nibName: PhotoTableViewCell.description(), bundle: nil), forCellReuseIdentifier:   PhotoTableViewCell.description())
        
        view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        
    
        NotificationCenter.default.addObserver(self, selector: #selector(addPhotoMethod),
                                               name: .postBookmark,
                                               object: nil)
    }
    
    @objc private func addPhotoMethod() {
        
        profileModel.photos.append(#imageLiteral(resourceName: "3-1"))
        tableView.reloadData()
    }
    
    
    
    //расчет высоты ячейки
    private func setupPhotosHeightFor(width: CGFloat) -> CGFloat {
        let squareHeight = width / 3
        let rowsCount = Int(profileModel.photos.count / 3)
        let additionRow =  profileModel.photos.count%3 > 0 ? 1 : 0
        let rowsSumm = rowsCount + additionRow
        
        return squareHeight * CGFloat(rowsSumm)
    }
    
}

//MARK: -UITableViewDataSource, UITableViewDelegate
extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if dataSource[indexPath.row] == .photo {
            return setupPhotosHeightFor(width: tableView.frame.width)
            
        } else {
            return 350
            //    UITableView.automaticDimension - автоматический расчёт ( нe работает из-за констрейнта)
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch dataSource[indexPath.row] {
        
        case .mainInfo:
            let cell = tableView.dequeueReusableCell(withIdentifier: ProfileMainInfoCell.description(),
                                                     for: indexPath) as! ProfileMainInfoCell
            
            let model = ProfileMainInfoCellModel(profileImage: profileModel.profileImage,
                                                 nameString: profileModel.nameString,
                                                 interestingsString: profileModel.interestingsString,
                                                 addresString: profileModel.addresString,
                                                 followersCount: profileModel.followersCount,
                                                 followingCount: profileModel.followingCount,
                                                 postsCount: profileModel.postsCount)
            
            cell.setupWith(model: model)
            cell.delegate = self
            return cell
            
        case .photo:
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotoTableViewCell.description(),
                                                     for: indexPath) as! PhotoTableViewCell
            
            cell.delegate = self
            cell.setupWith(photos: profileModel.photos)
            return cell
        }
    }
    
    
}

//MARK: - PhotoTableViewCellDelegate

extension ProfileViewController: PhotoTableViewCellDelegate {
    func photoSelected(photo: UIImage) {
        
        let controller = FullsizeImageViewController(image: photo,
                                                     profileImage: #imageLiteral(resourceName: "3-1"),
                                                     name: "Allcats")
        present(controller, animated: true, completion: nil)
        
    }
}

//MARK: - PhotoTableViewCellDelegateEditProfile ALERT MESSAGE

extension ProfileViewController:  ProfileCellDelegate {
    func editProfile() {
        
        let alert = UIAlertController(title: "Attention",
                                      message: "Вы перешли в редактор профиля",
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default) { action in
            
            
            // здесь пишем что будет выполняться по нажатию
        }
        
        let cancel = UIAlertAction(title: "Отмена", style: .cancel) { alert in
            
        }
        
        let privet = UIAlertAction(title: "PRIVET", style: .destructive) { alert in
            
        }
        
        alert.addAction(cancel)
        alert.addAction(action)
        alert.addAction(privet)
        
        present(alert, animated: true, completion: nil)
    }
    
}

