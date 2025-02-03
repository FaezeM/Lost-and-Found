//
//  TableViewCell.swift
//  Lost and Found
//
//  Created by Faeze Memari on 02/02/25.
//

import UIKit

class TableViewCell: UITableViewCell {

    static let identifier = "TableViewCell"
    
    private let image: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cat")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.text = "cat"
        return label
    }()
    
    private let loc: UILabel = {
        let loc = UILabel()
        loc.font = .systemFont(ofSize: 14)
        loc.text = "Main St."
        return loc
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        contentView.addSubview(image)
        contentView.addSubview(label)
        contentView.addSubview(loc)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // constraints
        image.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        loc.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // Image constraints
            image.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            image.centerYAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerYAnchor),
            image.heightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.heightAnchor),
            image.widthAnchor.constraint(equalTo: image.heightAnchor),
            
            // Label constraints
            label.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            label.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 10),
            
            // Loc constraints
            loc.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            loc.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: 10),
            loc.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10)
        ])
    }
    
}
