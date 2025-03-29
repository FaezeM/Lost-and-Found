//
//  CollectionViewController.swift
//  Lost and Found
//
//  Created by Faeze Memari on 02/12/24.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var loadedObjects: [Object] = loadObjects() ?? Objects
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // not optional
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        
        let object = loadedObjects[indexPath.row]
        

        cell.configure(text: object.name, locName: object.location, img: object.image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // return view.safeAreaLayoutGuide.layoutFrame.height/10
        let baseHeight = view.safeAreaLayoutGuide.layoutFrame.height / 10
        // traitCollection = The phone's current display properties
        // .compact == small
        return traitCollection.verticalSizeClass == .compact ? // if in landscape mode == the height is small
        baseHeight * (UIScreen.main.bounds.width / UIScreen.main.bounds.height) : // normalHeight * (screen width / screen height)
        baseHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true) // it will no longer be highlighted
        let object = loadedObjects[indexPath.row]
        let vc = LostObjectViewController(passingItem: object)
        navigationController?.pushViewController(vc, animated: true)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return loadedObjects.count
    }
    
    private let profileButton: UIButton = {
        let profileButton = UIButton()
        profileButton.setTitle("Profile", for: .normal)
        profileButton.setTitleColor(.link, for: .normal)
        profileButton.addTarget(self, action: #selector(didTapProfileButton), for: .touchUpInside)
        return profileButton
    }()
    
//    private let addButton: UIButton = {
//        let addButton = UIButton()
//        addButton.setTitle("+", for: .normal)
//        addButton.setTitleColor(.link, for: .normal)
//        //addButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
//        addButton.addTarget(self, action: #selector(didTapAddButton), for: .touchUpInside)
//        return addButton
//    }()
    
    private let tableview: UITableView = {
        let tableView = UITableView()
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier) // created a xib
        tableView.backgroundColor = .clear
        return tableView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !UserDefaults.standard.bool(forKey: "didSaveObjects") {
            saveObjects(objects: Objects)
            UserDefaults.standard.set(true, forKey: "didSaveObjects")
        }

        
        view.backgroundColor = UIColor(red: 223/255.0, green: 239/255.0, blue: 199/255.0, alpha: 1)
        tableview.dataSource = self
        tableview.delegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAddButton))
        view.addSubview(profileButton)
        view.addSubview(tableview)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // constraints
        tableview.translatesAutoresizingMaskIntoConstraints = false
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // table constraints
            tableview.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableview.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableview.topAnchor.constraint(equalTo: profileButton.bottomAnchor, constant: 10),
            tableview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            // Profile button constraints
            profileButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            profileButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
        ])

    }
    
    @objc private func didTapProfileButton() {
        let vc = ViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func didTapAddButton() {
        let vc = AddViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
        
        
}


