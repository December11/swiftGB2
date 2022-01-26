//
//  PhotosCollectionViewController.swift
//  VKApp
//
//  Created by Alla Shkolnik on 18.12.2021.
//

import UIKit

class FriendCollectionViewController: UICollectionViewController {
    
    var friend: User?

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(UINib(nibName: "ImageCollectionCell", bundle: nil), forCellWithReuseIdentifier: "imageCollectionCell")
    }

    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "photoPreview"{
            guard
                let photoPreviewController = segue.destination as? PhotoPreviewViewController,
                let indexPath = sender as? IndexPath,
                friend?.photos != nil
            else { return }
            let currentPhoto = friend?.photos[indexPath.item]
            photoPreviewController.currentActivePhoto = currentPhoto
            photoPreviewController.photos = (friend?.photos)!
            photoPreviewController.activePhotoIndex = indexPath.item
        }
    }
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friend?.photos.count ?? 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "imageCollectionCell",
                for: indexPath)
                as? ImageCollectionCell
        else { return UICollectionViewCell() }
        cell.configureItem(picture: friend?.photos[indexPath.row])
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "photoPreview", sender: indexPath)
    }

}

extension FriendCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.bounds.width, height: collectionView.bounds.width)
    }
}
