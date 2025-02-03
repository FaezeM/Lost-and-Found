//
//  CollectionViewController.swift
//  Lost and Found
//
//  Created by Faeze Memari on 02/12/24.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // return view.safeAreaLayoutGuide.layoutFrame.height/10
        let baseHeight = view.safeAreaLayoutGuide.layoutFrame.height / 10
        // traitCollection = The phone's current display properties
        // .compact == small
        return traitCollection.verticalSizeClass == .compact ? // if in landscape mode == the height is small
        baseHeight * (UIScreen.main.bounds.width / UIScreen.main.bounds.height) : // normalHeight * (screen width / screen height)
        baseHeight //
    }
    
    private let profileButton: UIButton = {
        let profileButton = UIButton()
        profileButton.setTitle("Profile", for: .normal)
        profileButton.setTitleColor(.link, for: .normal)
        profileButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return profileButton
    }()
    
    private let tableview: UITableView = {
        let tableView = UITableView()
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier) // created a xib
        tableView.backgroundColor = .clear
        return tableView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 223/255.0, green: 239/255.0, blue: 199/255.0, alpha: 1)
        tableview.dataSource = self
        tableview.delegate = self
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
            
            // button constraints
            profileButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            profileButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])

    }
    
    @objc private func didTapButton() {
        let vc = ViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
        
}
