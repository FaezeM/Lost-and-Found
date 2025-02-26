//
//  LostObjectViewController.swift
//  Lost and Found
//
//  Created by Faeze Memari on 15/02/25.
//

import UIKit

class LostObjectViewController: UIViewController {
    
    private var portraitConstraints: [NSLayoutConstraint] = []
    private var landscapeConstraints: [NSLayoutConstraint] = []

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    private let loc: UILabel = {
        let loc = UILabel()
        loc.font = .systemFont(ofSize: 14)
        return loc
    }()
    
    private let desc: UITextView = {
        let desc = UITextView()
        desc.font = .systemFont(ofSize: 14)
        desc.backgroundColor = .clear
        desc.layer.borderWidth = 0.2
        desc.isEditable = false
        desc.isScrollEnabled = true
        return desc
    }()
    
    init(passingItem: Object) {
        self.imageView.image = passingItem.image
        self.label.text = passingItem.name
        self.loc.text = passingItem.location
        self.desc.text = passingItem.discription
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 223/255.0, green: 239/255.0, blue: 199/255.0, alpha: 1)
        view.addSubview(imageView)
        view.addSubview(label)
        view.addSubview(loc)
        view.addSubview(desc)
        configureConstraints()
    }
    
    func configureConstraints() {
        
        
        // constraints
        imageView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        loc.translatesAutoresizingMaskIntoConstraints = false
        desc.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // Image constraints
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            imageView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.5),
            
            // Label constraints
            label.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            label.centerYAnchor.constraint(equalTo: imageView.safeAreaLayoutGuide.centerYAnchor),
            
            // Loc constraints
            loc.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            loc.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 10),
            loc.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
            
            // Desc contraints
            desc.heightAnchor.constraint(equalTo: imageView.heightAnchor),
            desc.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            desc.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            desc.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            desc.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
            
            
        ])

    }
    




}
