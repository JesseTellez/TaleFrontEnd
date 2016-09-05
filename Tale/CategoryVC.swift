//
//  CategoryVC.swift
//  Tale
//
//  Created by Jesse Tellez on 7/17/16.
//  Copyright © 2016 Inspir. All rights reserved.
//

import UIKit

//this can be read vc

class CategoryVC: UIViewController {

    @IBOutlet weak var collectionViewOne: UICollectionView!
    @IBOutlet weak var collectionViewTwo: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension CategoryVC: UICollectionViewDelegate {
    
    
}

extension CategoryVC: UICollectionViewDataSource {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
}
