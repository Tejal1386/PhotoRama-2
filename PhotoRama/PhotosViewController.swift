//
//  Photo.swift
//  PhotoRama
//  Auther Name: Tejal Patel - 300972812
//  Created by Tejal Patel on 2018-03-12.
//
import UIKit

class PhotosViewController: UIViewController, UICollectionViewDelegate {
   
    
    @IBOutlet weak var collectionView: UICollectionView!
    var store: PhotoStore!
    
    let photoDataSource = PhotoDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = photoDataSource
        collectionView.delegate = self
        store.fetchInterstingPhotos{
            (photosResult)  -> Void in
            switch photosResult{
            case let .success(photos): print("successfully found \(photos.count) photos.")
            
                self.photoDataSource.photos = photos
                
            case let .failure(error):
                print("Error fetching interesting photos:  \(error)")
                self.photoDataSource.photos.removeAll()
            }
            self.collectionView.reloadSections(IndexSet(integer: 0))
            
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        let myImageViewPage: MyImageViewController = self.storyboard?.instantiateViewController(withIdentifier: "MyImageViewController") as! MyImageViewController
        
        myImageViewPage.selectedImage =   photoDataSource.photos[indexPath.row]
        
        self.navigationController?.pushViewController(myImageViewPage, animated: true)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let photo = photoDataSource.photos[indexPath.row]
        
        //download the image data, which could take some time
        store.fetchImage(for: photo) { (result) -> Void in
            
            //the  index path for the photo migth have changed between the
            //time the request started and finish , so find the most recent indexpath
            
            guard let photoIndex = self.photoDataSource.photos.index(of: photo),
                case let .success(image) = result else {
                    return
            }
            
            let photoIndexPath = IndexPath(item: photoIndex, section: 0)
            
            if let cell = self.collectionView.cellForItem(at: photoIndexPath) as? PhotoCollectionViewCell{
                cell.update(with: image)
            }
        }
        
    }
    
   
}
