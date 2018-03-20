//
//  PhotoCollectionViewCell.swift
//  PhotoRama
//
//  Created by Tejal Patel on 2018-03-19.
//  Copyright © 2018 Centennial College. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var spinner: UIActivityIndicatorView!
    
    func update(with image: UIImage?){
        if let imageDisplay = image {
            spinner.stopAnimating()
            imageView.image = imageDisplay
        }else {
            spinner.startAnimating()
            imageView.image = nil
        }
    }
    
    override func awakeFromNib(){
        super.awakeFromNib()
        update(with: nil)
    }
    
    override func prepareForReuse(){
        super.prepareForReuse()
        update(with: nil)
    }
}
