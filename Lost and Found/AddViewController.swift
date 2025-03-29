//
//  AddViewController.swift
//  Lost and Found
//
//  Created by Faeze Memari on 20/02/25.
//

import Photos
import PhotosUI
import UIKit

class AddViewController: UIViewController, PHPickerViewControllerDelegate {
    
    private var picURL: String?
    // func of the PHPicker delegate
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true, completion: nil) // dismiss the viewcontroller
        results.forEach { result in
            result.itemProvider.loadObject(ofClass: UIImage.self) { [weak self] reading, error in // weak self to not cause a memory leak
                guard let image = reading as? UIImage, error == nil else{ // as?: convert to UIImage if possible or return nil
                    return
                } // guard = if
                
                DispatchQueue.main.async { //puprple warning: UIImageView.image must be used from main thread only
                    self?.imageView.image = image // Assign the image to the UIImageView
                }
            }
            result.itemProvider.loadFileRepresentation(forTypeIdentifier: UTType.image.identifier) { [weak self] url, error in
                guard let self = self, let url = url, error == nil else {
                    print("Error loading file URL: \(String(describing: error))")
                    return
                }
                
                do {
                    // Create a destination URL in your app's documents directory
                    let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
                    let fileName = url.lastPathComponent
                    let destinationURL = documentsDirectory.appendingPathComponent(fileName)
                    
                    // Remove any existing file
                    if FileManager.default.fileExists(atPath: destinationURL.path) {
                        try FileManager.default.removeItem(at: destinationURL)
                    }
                    
                    // Copy the file
                    try FileManager.default.copyItem(at: url, to: destinationURL)
                    
                    // Now you can use destinationURL safely
                    self.picURL = destinationURL.absoluteString
                    
                    // Update UI on main thread if needed
                    DispatchQueue.main.async {
                        print("File saved at: \(self.picURL)")
                    }
                } catch {
                    print("Error copying file: \(error)")
                }
            }
        }
    } // NSItemProvider: An item provider for conveying data or a file between processes during drag-and-drop or copy-and-paste activities, or from a host app to an app extension.
    
      // reading: NSItemProviderReading: The protocol for implementing a class to allow an item provider to create an instance of the class.
    
    
    private let labelTextField: UITextField = {
        let labelTextField = UITextField()
        labelTextField.font = .systemFont(ofSize: 20)
        labelTextField.placeholder = "Name"
        labelTextField.backgroundColor = .black.withAlphaComponent(0.2)
        labelTextField.layer.cornerRadius = 5
        return labelTextField
    }()
    
    private let locTextField: UITextField = {
        let locTextField = UITextField()
        locTextField.font = .systemFont(ofSize: 20)
        locTextField.placeholder = "Location"
        
        locTextField.backgroundColor = .black.withAlphaComponent(0.2)
        locTextField.layer.cornerRadius = 5
        return locTextField
    }()
    
    private let descTextView: UITextView = {
        let descTextView = UITextView()
        descTextView.font = .systemFont(ofSize: 20)
        descTextView.text = "Insert your discription here."
        descTextView.backgroundColor = .black.withAlphaComponent(0.2)
        descTextView.layer.cornerRadius = 5
        return descTextView
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let addImageButton: UIButton = {
        let addImageButton = UIButton()
        addImageButton.setTitle("Select an image", for: .normal)
        addImageButton.setTitleColor(.link, for: .normal)
        addImageButton.addTarget(self, action: #selector(didTapAddImageButton), for: .touchUpInside)
        return addImageButton
    }()
    
    
    
    private let submitButton: UIButton = {
        let editButton = UIButton()
        editButton.setTitle("Submit", for: .normal)
        editButton.setTitleColor(.link, for: .normal)
        editButton.addTarget(self, action: #selector(didTapSubmitButton), for: .touchUpInside)
        return editButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 223/255.0, green: 239/255.0, blue: 199/255.0, alpha: 1)
        view.addSubview(imageView)
        view.addSubview(labelTextField)
        view.addSubview(locTextField)
        view.addSubview(descTextView)
        view.addSubview(addImageButton)
        view.addSubview(submitButton)
        configureConstraints()
        
    }
    
    func configureConstraints() {
        
        
        // constraints
        imageView.translatesAutoresizingMaskIntoConstraints = false
        labelTextField.translatesAutoresizingMaskIntoConstraints = false
        locTextField.translatesAutoresizingMaskIntoConstraints = false
        descTextView.translatesAutoresizingMaskIntoConstraints = false
        addImageButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            // Label constraints
            labelTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            labelTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            labelTextField.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.7),
            labelTextField.heightAnchor.constraint(equalToConstant: labelTextField.sizeThatFits(CGSize(width: labelTextField.frame.width, height: .greatestFiniteMagnitude)).height),
            
            // Loc constraints
            locTextField.topAnchor.constraint(equalTo: labelTextField.bottomAnchor, constant: 10),
            locTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            locTextField.widthAnchor.constraint(equalTo: labelTextField.widthAnchor),
            locTextField.heightAnchor.constraint(equalTo: labelTextField.heightAnchor),
            
            // Desc contraints
            descTextView.topAnchor.constraint(equalTo: locTextField.bottomAnchor, constant: 10),
            descTextView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            descTextView.widthAnchor.constraint(equalTo: labelTextField.widthAnchor),
            descTextView.heightAnchor.constraint(equalTo: labelTextField.heightAnchor, multiplier: 3),
            
            // add image button constraints
            addImageButton.topAnchor.constraint(equalTo: descTextView.bottomAnchor, constant: 10),
            addImageButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            // Desc contraints
            imageView.topAnchor.constraint(equalTo: addImageButton.bottomAnchor, constant: 10),
            imageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            imageView.widthAnchor.constraint(equalTo: labelTextField.widthAnchor),
            imageView.heightAnchor.constraint(equalTo: labelTextField.widthAnchor),
            
            // submit button constraints
            submitButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            submitButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
            
            
        ])

    }
    
    @objc private func didTapAddImageButton() {
        var config = PHPickerConfiguration(photoLibrary: .shared()) // you don't need permission
        config.selectionLimit = 1 // PhotoPicker doesn't have this
        config.filter = .images // filter only images in the gallery
        let vc = PHPickerViewController(configuration: config) // not a real viewcontroller but photos app hosted on top of the app
        vc.delegate = self // callback to get the result out
        present(vc, animated: true)
    }
    

    
    @objc private func didTapSubmitButton() {
        guard let name = labelTextField.text else {
            return
        }
        guard let loc = locTextField.text else {
            return
        }
        guard let desc = descTextView.text else {
            return
        }
        guard let img = picURL else {
            return
        }
        addNewObject(object: Object(name: name, location: loc, discription: desc, image: img))
        let vc = TableViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
