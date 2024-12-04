//
//  ViewController.swift
//  Lost and Found
//
//  Created by Faeze on 6/17/24.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var editButton: UIButton!
    
    @IBOutlet var nameTextView: UITextView!
    
    @IBOutlet var surnameTextView: UITextView!
    
    @IBOutlet var emailTextView: UITextView!
    
    @IBOutlet var passwordTextView: UITextView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedSurname = UserDefaults.standard.object(forKey: "surname")
        let storedEmail = UserDefaults.standard.object(forKey: "email")
        let storedPassword = UserDefaults.standard.object(forKey: "password")
                
                
        if let newName = storedName as? String{
                    nameTextView.text = newName
                }
                
        if let newSurname = storedSurname as? String{
                surnameTextView.text = newSurname
            }
        if let newEmail = storedEmail as? String{
                emailTextView.text = newEmail
            }
        if let newPassword = storedPassword as? String{
                passwordTextView.text = newPassword
            }
        buttonNotSelected()
    }
    
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
        saveButtonClicked()
    }
    
    func buttonSelected()
    {
        editButton.setTitle("save", for: .normal)
        nameTextView.isEditable = true
        surnameTextView.isEditable = true
        emailTextView.isEditable = true
        passwordTextView.isEditable = true
    }
    
    @IBAction func saveButtonClicked() {
            
            UserDefaults.standard.set(nameTextView.text!, forKey: "name")
            UserDefaults.standard.set(surnameTextView.text!, forKey: "surname")
            UserDefaults.standard.set(emailTextView.text!, forKey: "email")
            UserDefaults.standard.set(passwordTextView.text!, forKey: "password")
            
            nameTextView.text = nameTextView.text!
            surnameTextView.text = surnameTextView.text!
            emailTextView.text = emailTextView.text!
            passwordTextView.text = passwordTextView.text!
            
    }
    
}


