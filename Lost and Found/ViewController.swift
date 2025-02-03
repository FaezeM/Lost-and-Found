//
//  ViewController.swift
//  Lost and Found
//
//  Created by Faeze on 6/17/24.
//

import UIKit

class ViewController: UIViewController {


    private let nameTextView: UITextView = {
        let nameTextView = UITextView()
        nameTextView.font = .systemFont(ofSize: 14)
        nameTextView.text = "Name"
        nameTextView.isEditable = false
        return nameTextView
    }()
    
    private let surnameTextView: UITextView = {
        let surnameTextView = UITextView()
        surnameTextView.font = .systemFont(ofSize: 14)
        surnameTextView.text = "Surname"
        surnameTextView.isEditable = false
        return surnameTextView
    }()
    
    private let emailTextView: UITextView = {
        let emailTextView = UITextView()
        emailTextView.font = .systemFont(ofSize: 14)
        emailTextView.text = "email@example.com"
        emailTextView.isEditable = false
        return emailTextView
    }()
    
    private let passwordTextView: UITextView = {
        let passwordTextView = UITextView()
        passwordTextView.font = .systemFont(ofSize: 14)
        passwordTextView.text = "password"
        passwordTextView.isEditable = false
        return passwordTextView
    }()
    
    private let editButton: UIButton = {
        let editButton = UIButton()
        editButton.setTitle("edit", for: .normal)
        editButton.setTitleColor(.link, for: .normal)
        editButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return editButton
    }()
    
    override func viewDidLoad() {

        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 223/255.0, green: 239/255.0, blue: 199/255.0, alpha: 1)
        view.addSubview(editButton)
        view.addSubview(nameTextView)
        view.addSubview(surnameTextView)
        view.addSubview(emailTextView)
        view.addSubview(passwordTextView)
        setupUI()
        // Do any additional setup after loading the view.
        
    }
    
    var toggleEditButton = false

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let sizeThatFitsContent = nameTextView.sizeThatFits(CGSize(width: nameTextView.frame.width, height: .greatestFiniteMagnitude))
        
        // constraints
        editButton.translatesAutoresizingMaskIntoConstraints = false
        nameTextView.translatesAutoresizingMaskIntoConstraints = false
        surnameTextView.translatesAutoresizingMaskIntoConstraints = false
        emailTextView.translatesAutoresizingMaskIntoConstraints = false
        passwordTextView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // name constraints
            nameTextView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            nameTextView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -100),
            nameTextView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5),
            nameTextView.heightAnchor.constraint(equalToConstant: nameTextView.sizeThatFits(CGSize(width: nameTextView.frame.width, height: .greatestFiniteMagnitude)).height),
            
            // surname constraints
            surnameTextView.topAnchor.constraint(equalTo: nameTextView.bottomAnchor, constant: 10),
            surnameTextView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            surnameTextView.widthAnchor.constraint(equalTo: nameTextView.widthAnchor),
            surnameTextView.heightAnchor.constraint(equalTo: nameTextView.heightAnchor),
            
            // email constraints
            emailTextView.topAnchor.constraint(equalTo: surnameTextView.bottomAnchor, constant: 10),
            emailTextView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            emailTextView.widthAnchor.constraint(equalTo: nameTextView.widthAnchor),
            emailTextView.heightAnchor.constraint(equalTo: nameTextView.heightAnchor),
            
            // password constraints
            passwordTextView.topAnchor.constraint(equalTo: emailTextView.bottomAnchor, constant: 10),
            passwordTextView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            passwordTextView.widthAnchor.constraint(equalTo: nameTextView.widthAnchor),
            passwordTextView.heightAnchor.constraint(equalTo: nameTextView.heightAnchor),
            
            // button constraints
            editButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            editButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])

    }
    
    private func setupUI() {
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedSurname = UserDefaults.standard.object(forKey: "surname")
        let storedEmail = UserDefaults.standard.object(forKey: "email")
        let storedPassword = UserDefaults.standard.object(forKey: "password")
        
        
        if let newName = storedName as? String {
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
    }
    
    @objc private func didTapButton() {
        
        if toggleEditButton == false {
            toggleEditButton = true
            buttonSelected()
        } else {
            toggleEditButton = false
            buttonNotSelected()
        }
    }
    
    
    
    private func buttonNotSelected() {
        editButton.setTitle("edit", for: .normal)
        nameTextView.isEditable = false
        surnameTextView.isEditable = false
        emailTextView.isEditable = false
        passwordTextView.isEditable = false
        saveButtonClicked()
    }
    
    private func buttonSelected() {
        editButton.setTitle("save", for: .normal)
        nameTextView.isEditable = true
        surnameTextView.isEditable = true
        emailTextView.isEditable = true
        passwordTextView.isEditable = true
    }
    
    private func saveButtonClicked() {
        
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


