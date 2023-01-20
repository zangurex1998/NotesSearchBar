//
//  HomeViewController.swift
//  NotesSearchBar
//
//  Created by technomix on 16.01.23.
//

import UIKit

class HomeViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var nameTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
       
    }
    //MARK: - Actions
    
    @IBAction func didTapSubmit(_ sender: Any) {
        sendNotification()
    }
    
    
    
    //MARK: - Methods
    private func setUpUI(){
        nameTextField.attributedPlaceholder = NSAttributedString(string: "Enter your name",attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
    }
    private func sendNotification(){
        NotificationCenter.default.post(name: .name, object: nil, userInfo: ["user" : nameTextField.text ?? ""])
    }
    

    
}

extension Notification.Name{
    static let name = NSNotification.Name("userName")
}
