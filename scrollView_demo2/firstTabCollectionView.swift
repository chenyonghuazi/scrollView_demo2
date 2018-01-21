//
//  firstTabCollectionView.swift
//  scrollView_demo2
//
//  Created by Edwin on 2018/1/21.
//  Copyright © 2018年 Edwin. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func setLayout(){
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
        layout.itemSize = CGSize(width: (self.view.frame.width - 75) / 3, height: (self.myCollectionView.frame.height) / 2)
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 4
        myCollectionView.collectionViewLayout = layout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionImageSet.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! firstTabCollectionViewCell
        cell.myImageView.image = UIImage(named: collectionImageSet[indexPath.row])
        cell.myImageView.contentMode = .scaleAspectFit
        cell.myImageView.layer.cornerRadius = 6
        cell.myImageView.clipsToBounds = true
        cell.myLabel.text = collectionImageSet[indexPath.row]
        return cell
    }
    
    
    
}
