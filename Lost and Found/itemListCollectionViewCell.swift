//
//  itemListCollectionViewCell.swift
//  Lost and Found
//
//  Created by Faeze Memari on 02/12/24.
//

import UIKit

class itemListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    
    static let identifier = "itemListCollectionViewCell"
    
    public func configure(with image: UIImage) {
        imageView.image = image
    }
    
    static func nib() -> UINib {
        return UINib(nibName: itemListCollectionViewCell.identifier, bundle: nil)
        
        
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
