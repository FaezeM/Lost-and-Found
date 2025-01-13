//
//  CollectionViewController.swift
//  Lost and Found
//
//  Created by Faeze Memari on 02/12/24.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

 
    @IBAction func profileButton(_ sender: Any) {
    }
    
    private var itemList: UICollectionView?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: view.frame.width, height: 100)
        
        itemList = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let itemList = itemList else {
            return
        } // wrap it for the addSubView (it should never be optional because we signed it in the last line
        
        itemList.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        
        itemList.backgroundColor = view.backgroundColor
        
        itemList.dataSource = self // UICollectionViewDataSource protocol needed
        itemList.delegate = self // UICollectionViewDelegate protocol needed
        
        view.addSubview(itemList)
        itemList.frame = view.bounds
        
    }
    

        
    // The next 2 funcs is because [Collection]ViewController does not
    // conform to UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath)
        return cell
    }
        

        
        
}
