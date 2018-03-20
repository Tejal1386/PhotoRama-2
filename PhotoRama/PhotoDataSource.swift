//
//  PhotoDataSource.swift
//  PhotoRama
//
//  Created by Tejal Patel on 2018-03-19.
//  Copyright © 2018 Centennial College. All rights reserved.
//

import UIKit

class PhotoDataSource: NSObject, UICollectionViewDataSource{
 
    
    var photos = [Photo]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifir = "UICollectionViewCell"
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifir, for: indexPath) as! PhotoCollectionViewCell
        return cell
    }
    
    
}
