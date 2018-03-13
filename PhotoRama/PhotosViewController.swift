//
//  Photo.swift
//  PhotoRama
//  Auther Name: Tejal Patel - 300972812
//  Created by Tejal Patel on 2018-03-12.
//
import UIKit

class PhotosViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var store: PhotoStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.fetchInterstingPhotos{
            (photosResult)  -> Void in
            switch photosResult{
            case let .success(photos): print("successfully found \(photos.count) photos.")
            
            if let firstPhoto = photos.first{
                self.updateImageView(for: firstPhoto)
                }
                
            case let .failure(error):
                print("Error fetching interesting photos:  \(error)")
            }
            
            
        }
    }
    
    
    func updateImageView(for photo: Photo){
        store.fetchImage(for: photo){
            (imageResult) -> Void in
            
            switch imageResult {
            case let .success(image):
                self.imageView.image = image
            case let .failure(error):
                print("Error downloading image: \(error)")
            }
        }
    }
}
