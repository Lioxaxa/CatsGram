//
//  DateViewController.swift
//  Lesson 9 (12) Insta App
//
//  Created by Alex Pupko on 5.07.21.
//

import UIKit

final class DateViewController: UIViewController {
    
    @IBOutlet weak var openURL: UIButton!
    @IBOutlet weak var showDateButton: UIButton!
    
    @IBOutlet weak var dateOneLabel: UILabel!
    @IBOutlet weak var dateTwoLabel: UILabel!
    @IBOutlet weak var dateThreeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showDateButton.layer.cornerRadius = 15
        openURL.layer.cornerRadius = 15
    }
    
    
    @IBAction func showDateButton(_ sender: UIButton) {
        
        let currentDate = Date()

        let dateString = DateFormatter.dateOneFormatter().string(from: currentDate)
        let dateTwoString = DateFormatter.dateTwoFormatter().string(from: currentDate)
        let dateThreeString = DateFormatter.dateThreeFormatter().string(from: currentDate)
        
        dateOneLabel.text = dateString
        dateTwoLabel.text = dateTwoString
        dateThreeLabel.text = dateThreeString
        
    }
    
    @IBAction func openURL(_ sender: Any) {
        
        
        if let url = URL(string: "https://onliner.by") {
                    UIApplication.shared.open(url)
                }
    }
    
}

// MARK: - DateFormatter
extension DateFormatter {
    static func dateOneFormatter() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        return dateFormatter
    }
    
    static func dateTwoFormatter() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = " d MMM, HH:mm"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        return dateFormatter
    }
    
    static func dateThreeFormatter() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM, yyyy HH:mm"
        dateFormatter.locale = Locale(identifier: "en_EN")
        return dateFormatter
    }
}




