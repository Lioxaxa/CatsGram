//
//  LoginViewController.swift
//  Lesson 9 (12) Insta App
//
//  Created by Alex Pupko on 6.06.21.
//

import UIKit

final class LoginViewController: UIViewController {
    
    @IBOutlet private weak var errorLabel: UILabel!
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var surnameTextField: UITextField!
    
    @IBOutlet private weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        errorLabel.isHidden = true
        loginButton.layer.cornerRadius = 15
        
    }
    @IBAction private func nameTextField(_ sender: Any) {
    }
    
    @IBAction private func loginButton(_ sender: UIButton) {
        
        
        
        //        if nameTextField.text?.isEmpty == true && surnameTextField.text?.isEmpty == true{
        //            errorLabel.isHidden = false
        //
        //
        //        } else {
        //            errorLabel.isHidden = true
        //        }
        
        nameTextField.layer.borderWidth = 0
        nameTextField.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        surnameTextField.layer.borderWidth = 0
        surnameTextField.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let controller =
                storyBoard.instantiateViewController(withIdentifier: "ListingViewController") as?
                ListingViewController,
              nameTextField.text?.isEmpty == false else {
            
            nameTextField.layer.borderWidth = 1
            nameTextField.layer.borderColor = UIColor.red.cgColor
            
            surnameTextField.layer.borderWidth = 1
            surnameTextField.layer.borderColor = UIColor.red.cgColor
            
            return
        }
        
        
        if let loginName = nameTextField.text {
            
            UserDefaults.standard.setValue(loginName, forKey: String.profileTitle)
        }
        
        present(controller, animated: true, completion: {
            UserDefaults.standard.setValue(true, forKey: String.isUserLoggedIn)
        })
        
    }
    
    
    
    
    
    
}
