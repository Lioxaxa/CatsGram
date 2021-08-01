
import UIKit

final class ListingViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private let dataSource = [ListingModel(profileTitle: "Базилио",
                                           profileImage: #imageLiteral(resourceName: "4"),
                                           listingImage: #imageLiteral(resourceName: "4"),
                                           description: "Show me what you got Show me what you got Show me what you got Show me what you got Show me what you got Show me what you got Show me what you got Show me what you got Show me what you got Show me what",
                                           statistics: (like: 0, views: 20),
                                           isLiked: false,
                                           isComment: false,
                                           isExpanded: false,
                                           isMark: false,
                                           isDots: false,
                                           isShared: false,
                                           isSettinged: false,
                                           identifier: 0,
                                           comments: [CommentModel(commentOwner: "Vasia", commentText: " Nu ti vasja"),  CommentModel(commentOwner: "Gosha", commentText: " Nu ti petja"), CommentModel(commentOwner: "Grisha", commentText: " go po pivu")]),
                              
                              ListingModel(profileTitle: "Матроскин",
                                           profileImage: #imageLiteral(resourceName: "3"),
                                           listingImage: #imageLiteral(resourceName: "3"),
                                           description: "I am Boss - cat",
                                           statistics: (like: 9, views: 323),
                                           isLiked: false,
                                           isComment: false,
                                           isExpanded: false,
                                           isMark: false,
                                           isDots: false,
                                           isShared: false,
                                           isSettinged: false,
                                           identifier: 1,
                                           comments: [CommentModel(commentOwner: "Petro", commentText: " Darova")]),
                              
                              ListingModel(profileTitle: "Чеширский кот",
                                           profileImage: #imageLiteral(resourceName: "2"),
                                           listingImage: #imageLiteral(resourceName: "2"),
                                           description: "Spring is coming, Baby 😤 Spring is coming, Baby 😤 Spring is coming, Baby 😤 Spring is coming, Baby 😤 Spring is coming, Baby 😤 Spring is coming, Baby 😤 Spring is coming, Baby 😤 Spring is coming, Baby 😤 Spring is coming, Baby 😤",
                                           statistics: (like: 19, views: 2),
                                           isLiked: false,
                                           isComment: false,
                                           isExpanded: false,
                                           isMark: false,
                                           isDots: false,
                                           isShared: false,
                                           isSettinged: false,
                                           identifier: 2,
                                           comments: [CommentModel(commentOwner: "Ivan", commentText: " FIRE 🔥🔥🔥!!!")]),
                              
                              ListingModel(profileTitle: "КотВСапогах",
                                           profileImage: #imageLiteral(resourceName: "5"),
                                           listingImage: #imageLiteral(resourceName: "5"),
                                           description: " Bla bla blacaar",
                                           statistics: (like: 999, views: 20),
                                           isLiked: false,
                                           isComment: false,
                                           isExpanded: false,
                                           isMark: false,
                                           isDots: false,
                                           isShared: false,
                                           isSettinged: false,
                                           identifier: 3,
                                           comments: [CommentModel(commentOwner: "Anton", commentText: " Nice")]),
                              
                              ListingModel(profileTitle: "Абармот",
                                           profileImage: #imageLiteral(resourceName: "1"),
                                           listingImage: #imageLiteral(resourceName: "1"),
                                           description: "Hello kitty, call me",
                                           statistics: (like: 45, views: 132),
                                           isLiked: false,
                                           isComment: false,
                                           isExpanded: false,
                                           isMark: false,
                                           isDots: false,
                                           isShared: false,
                                           isSettinged: false,
                                           identifier: 4,
                                           comments: [CommentModel(commentOwner: "Jack", commentText: " SUUUPER 🚀")])]
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: ListingCell.description(), bundle: nil), forCellReuseIdentifier:   ListingCell.description())
    }
    
}
//MARK: - UITableViewDataSource, UItableViewDelegate
extension ListingViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) ->
    Int {
        return dataSource.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
    UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ListingCell.description(),
                                                 for: indexPath) as! ListingCell
        
        let modelsArray = dataSource.compactMap({ListingCellModel(profileTitle: $0.profileTitle,
                                                                  profileImage: $0.profileImage,
                                                                  listingImage: $0.listingImage,
                                                                  
                                                                  likeCount: "Likes: \($0.statistics.like)",
                                                                  photoDescription: $0.attribudtedDescription,
                                                                  photoComment: $0.attributedComment,
                                                                  isLiked: $0.isLiked,
                                                                  isComment: $0.isComment,
                                                                  isExpand: $0.isExpanded,
                                                                  isMarked: $0.isMark,
                                                                  isDots: $0.isDots,
                                                                  isShared: $0.isShared,
                                                                  isSettinged: $0.isSettinged,
                                                                  identifier: $0.identifier)})
        //        "\($0.profileTitle)\($0.description)"
        cell.delegate = self
        cell.setupWithModel(model:modelsArray[indexPath.row])
        
        return cell
    }
    
    
    
}

//MARK: - ListingCellDelegate
extension ListingViewController: ListingCellDelegate {
    func listingImageTapped(id: Int) {
        guard let data = dataSource.first(where: { $0.identifier == id}) else { return }
        
        let controller = FullsizeImageViewController(image: data.listingImage,
                                                     profileImage: data.profileImage,
                                                     name: data.profileTitle)
        
        let navi = UINavigationController(rootViewController: controller )
        present(navi, animated: true, completion: nil)
    }
    
    
    func likeButton(id: Int) {
        
        dataSource.first(where: {$0.identifier == id})?.isLiked.toggle()
        
        //teacher variant
        // model?.isliked.toggle()
        // model?.statistics.like = (model?.statistics.like ?? 0) + (model?.isLiked == true ? 1 : -1)
        
        
        if   dataSource.first(where: {$0.identifier == id})?.isLiked == true {
            dataSource.first(where: {$0.identifier == id})?.statistics.like+=1
        } else {
            dataSource.first(where: {$0.identifier == id})?.statistics.like-=1
        }
        tableView.reloadData()
        
    }
    
    func commentButton(id: Int) {
        //        dataSource.first(where: {$0.identifier == id})?.isComment.toggle()
        //        tableView.reloadData()
        //        let controller = CommentsViewController()
        //        navigationController?.pushViewController(controller, animated: true)
        
        let controller = CommentsViewController(identifier: id)
        
        present(UINavigationController(rootViewController: controller)
                , animated: true, completion: nil)
        
        //        let controller = CommentsViewController()
        //        let navigation = UINavigationController(rootViewController: controller)
        //        navigation.modalPresentationStyle = .fullScreen
        //        present(navigation, animated: true, completion: nil)
        //
        //        navigationController?.pushViewController(controller, animated: true)
        
        
    }
    
    func shareButton(id: Int) {
        dataSource.first(where: {$0.identifier == id})?.isShared.toggle()
        tableView.reloadData()
    }
    
    func bookmarkButton(id: Int) {
        
        dataSource.first(where: {$0.identifier == id})?.isMark.toggle()
        tableView.reloadData()
      
        // механизм отправки нотификации
        NotificationCenter.default.post(name: .postBookmark, object: nil)
    }
    
    func dotsButton(id: Int) {
        
        dataSource.first(where: {$0.identifier == id})?.isDots.toggle()
        tableView.reloadData()
    }
    
    func expandButtonTapped(id: Int) {
        
        dataSource.first(where: {$0.identifier == id})?.isExpanded.toggle()
        tableView.reloadData()
    }
    
    
    func photoSelected(photo: UIImage) {
        let controller = FullsizeImageViewController(image: photo, profileImage: #imageLiteral(resourceName: "3-1"),
                                                     name: "CatName")
        present(controller, animated: true, completion: nil)
    }
    
    
    
    // если происходят изменения для данных в таблице нужно всегда юзать reloadData
}


