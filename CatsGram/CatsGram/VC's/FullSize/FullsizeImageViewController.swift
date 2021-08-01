//
//  FullsizeImageViewController.swift
//  Lesson 9 (12) Insta App
//
//  Created by Alex Pupko on 16.06.21.
//

import UIKit

class FullsizeImageViewController: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var actionButton: UIButton!
    
    private let image: UIImage
    private let profileImage: UIImage?
    private let name: String
    
    //    var scroll = UIScrollView()
    
    init (image: UIImage, profileImage: UIImage, name: String){
        self.image = image
        self.profileImage = profileImage
        self.name = name
        
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImageView.layer.cornerRadius = profileImageView.frame.width/2
        imageView.image = image
        profileImageView.image = profileImage
        profileName.text = name
        
        setupScrollView()
        
        actionButton.layer.cornerRadius = 20
        
    }
    
    
//MARK:- Zoom
    private func setupScrollView() {
        
        scrollView.zoomScale = 1
        scrollView.minimumZoomScale = 1
        scrollView.maximumZoomScale = 5
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView.contentSize = imageView.bounds.size
        scrollView.addSubview(imageView)
        scrollView.delegate = self
        
        view.addSubview(scrollView)
        

        // Зум по центру вью по нажатию кнопки
    }
    @IBAction func actionButton(_ sender: UIButton) {
        
        
        let zoomRect = zoomRectForScale(scale: 3.5, center: view.center)
        scrollView.zoom(to: zoomRect, animated: true)
        
        func zoomRectForScale(scale : CGFloat, center : CGPoint) -> CGRect {
            
            
            var zoomRect = CGRect.zero
            if let imageV = imageView {
                zoomRect.size.height = imageV.frame.size.height / scale
                zoomRect.size.width  = imageV.frame.size.width  / scale
                let newCenter = imageV.convert(center, from: view)
                zoomRect.origin.x = newCenter.x - ((zoomRect.size.width / 2.0))
                zoomRect.origin.y = newCenter.y - ((zoomRect.size.height / 2.0))
            }
            return zoomRect
        }
        
    }
    
    
}

//MARK:- UIScrollViewDelegate
extension FullsizeImageViewController: UIScrollViewDelegate {
    
    // возвращает зумленную фотку в исходное положение
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        scrollView.zoomScale = 1
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
}

















// МОЙ РАБОЧИЙ ВАРИАНТ

//        setupScrollView()
//        setZoomScale(for: scrollView.bounds.size)
//
//    }
//
//    func setupScrollView() {
//        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        scrollView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
//        scrollView.contentSize = imageView.bounds.size
//        scrollView.delegate = self
//        scrollView.addSubview(imageView)
//
//        view.addSubview(scrollView)
//        //
//        //    }
//        //    func recenterImage() {
//
//    }
//
//    func setZoomScale(for scrollViewSize: CGSize) {
//        let imageSize = imageView.bounds.size
//        let widthScale = scrollViewSize.width / imageSize.width
//        let heightScale = scrollViewSize.height / imageSize.height
//        let minimumScale = min(widthScale, heightScale)
//
//        scrollView.minimumZoomScale = minimumScale
//        scrollView.maximumZoomScale = 3.0
//
//    }
//}
//
////MARK:- UIScrollViewDelegate
//extension FullsizeImageViewController: UIScrollViewDelegate {
//
//    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
//        return imageView
//    }
//    //        func scrollViewDidZoom(_ scrollView: UIScrollView) {
//    //            recenterImage()
//    //        }
//
//}
//







