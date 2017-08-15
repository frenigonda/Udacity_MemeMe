//
//  MemeCollectionViewController.swift
//  MemeMe
//
//  Created by purpon on 12/May/2017.
//  Copyright © 2017 purpon. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class MemeCollectionViewController: UICollectionViewController {
    
    var memes: [Meme] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Register cell classes
        //self.collectionView!.register(MemeCollectionViewCell.self, forCellWithReuseIdentifier: "MemeCollectCell")

    }
    
    override func viewWillAppear(_ animated: Bool) {
        memes = (UIApplication.shared.delegate as! AppDelegate).memes
        self.collectionView?.reloadData()
    }

        // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        print(memes.count)
        return memes.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemeCollectCell", for: indexPath) as! MemeCollectionViewCell
        let particularMeme = self.memes[(indexPath as NSIndexPath).row]
        
        cell.memeLabel.text = particularMeme.topText

    
        // Configure the cell
    
        return cell
    }

    
}
