//
//  CustomCollectionViewCell.swift
//  Lost and Found
//
//  Created by Faeze Memari on 13/01/25.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "Cell"
    
    private let cellImage:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "house")
        imageView.backgroundColor = .yellow
        return imageView
    }()
    
    private let cellLabel:UILabel = {
        let label = UILabel()
        label.text = "house"
        label.backgroundColor = .green
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .green
        contentView.addSubview(cellImage)
        contentView.addSubview(cellLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented") // for previous line
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        cellLabel.frame = CGRect(x: contentView.frame.size.height + 10,
                                 y: 5,
                                 width: contentView.frame.size.width-10,
                                 height: 50)
        
        cellImage.frame = CGRect(x: 5,
                                 y: 0,
                                 width: contentView.frame.size.height,
                                 height: contentView.frame.size.height) // so it won't overlap the label
    }
    
}
