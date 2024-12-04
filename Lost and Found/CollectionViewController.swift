//
//  CollectionViewController.swift
//  Lost and Found
//
//  Created by Faeze Memari on 02/12/24.
//

import UIKit

class CollectionViewController: UIViewController {
    
    @IBOutlet weak var itemList: UICollectionView!
    
    
    
    @IBAction func profileButton(_ sender: Any) {
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width: 50, height: 50)
        
        itemList.collectionViewLayout = layout
        
        itemList.register(itemListCollectionViewCell.nib(), forCellWithReuseIdentifier: itemListCollectionViewCell.identifier)

        itemList.delegate = self
        itemList.dataSource = self
    }
    
    


}

extension CollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        print("tapped")
    }
}

extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: itemListCollectionViewCell.identifier, for: indexPath) as! itemListCollectionViewCell
        
        cell.configure(with: UIImage(named: "Image")!)
        return cell
    }
    
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 50)
    }
}
