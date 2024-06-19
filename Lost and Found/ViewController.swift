//
//  ViewController.swift
//  Lost and Found
//
//  Created by Faeze on 6/17/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buttonNotSelected()
    }
    
    @IBOutlet var editButton: UIButton!
    
    @IBOutlet var nameTextView: UITextView!
    
    @IBOutlet var surnameTextView: UITextView!
    
    @IBOutlet var emailTextView: UITextView!
    
    @IBOutlet var passwordTextView: UITextView!
    
    var toggleEditButton = false
    
    
    
    @IBAction func editClicked(_ sender: Any) {
        if toggleEditButton == false
        {
            toggleEditButton = true
            buttonSelected()
        }
        else
        {
            toggleEditButton = false
            buttonNotSelected()
        }
    }
    
    
    func buttonNotSelected()
    {
        editButton.setTitle("edit", for: .normal)
        nameTextView.isEditable = false
        surnameTextView.isEditable = false
        emailTextView.isEditable = false
        passwordTextView.isEditable = false
    }
    
    func buttonSelected()
    {
        editButton.setTitle("save", for: .normal)
        nameTextView.isEditable = true
        surnameTextView.isEditable = true
        emailTextView.isEditable = true
        passwordTextView.isEditable = true
    }
    
}

