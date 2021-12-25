//
//  PhotosCollectionViewController.swift
//  VKApp
//
//  Created by Alla Shkolnik on 18.12.2021.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    
    var image: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(UINib(nibName: "ImageCollectionCell", bundle: nil), forCellWithReuseIdentifier: "imageCollectionCell")
    }

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "imageCollectionCell",
                for: indexPath)
                as? ImageCollectionCell
        else { return UICollectionViewCell() }
        cell.configureItem(image: image ?? UIImage(named: "photo7.png"))
        return cell
    }

}
