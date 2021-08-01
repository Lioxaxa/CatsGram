//
//  AddPhotoViewController.swift
//  Lesson 9 (12) Insta App
//
//  Created by Alex Pupko on 29.06.21.
//

import UIKit

class AddPhotoViewController: UIViewController {
    
    @IBOutlet weak var choosedPhoto: UIImageView!
    @IBOutlet weak var addPhotoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addPhotoButton.layer.cornerRadius = 15
        
    }
    @IBAction func addPhotoButton(_ sender: UIButton) {
        
        let pickerController = UIImagePickerController()
        
        pickerController.sourceType = .photoLibrary
        pickerController.allowsEditing = true
        pickerController.delegate = self
        present(pickerController, animated: true, completion: nil)
        
    }
    
}


//MARK: - UIImagePickerControllerDelegate
extension AddPhotoViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
   
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
         if let image = info[.editedImage] as? UIImage {
            choosedPhoto.image = image
         }
         picker.dismiss(animated: true)

     }
    
}
    
