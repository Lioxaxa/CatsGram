//
//  CommentsViewController.swift
//  Lesson 9 (12) Insta App
//
//  Created by Alex Pupko on 2.06.21.
//

import UIKit



protocol CommentViewControllerDelegate: AnyObject {
    func commentSaved(identifier: Int, comment: String)
}

struct CommentViewControllerModel{
    let currentValue: String
    let identifier: Int
    
}

final class CommentsViewController: UIViewController {
    
    @IBOutlet private weak var commentTextField: UITextField!
    @IBOutlet private weak var saveButton: UIButton!
    
    weak var delegate: CommentViewControllerDelegate?
    
    let identifier: Int
    
    init(identifier: Int) {
        self.identifier = identifier
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.layer.cornerRadius = 10
   
    
        let rightButton = UIButton(type: .system)
                rightButton.setTitle("Закрыть", for: .normal)
                rightButton.setTitleColor(.black, for: .normal)
                rightButton.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
                rightButton.contentHorizontalAlignment = .right
                rightButton.isEnabled = false
                rightButton.sizeToFit()
        
                navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButton)
        
    }
    @objc func closeAction() {
        dismiss(animated: true, completion: nil)
    }

    @IBAction private func saveButton(_ sender: UIButton) {
        
        delegate?.commentSaved(identifier: identifier, comment: commentTextField.text!)
        dismiss(animated: true, completion: nil)

        
        
//        navigationController?.popViewController(animated: true)
           
//        delegate?.valueSaved(value: emptyTextField.text ?? "", textFieldID: parentTextFieldID)
//            navigationController?.popViewController(animated: true)
        
    }



    
}
