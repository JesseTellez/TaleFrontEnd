//
//  ReadViewController.swift
//  Tale
//
//  Created by Jesse Tellez on 8/30/16.
//  Copyright © 2016 Inspir. All rights reserved.
//

//import UIKit
//
//
//class ReadViewController: UIViewController, CHTCollectionViewDelegateWaterfallLayout {
//    
//    @IBOutlet weak var collectionView: UICollectionView!
//   // let genre = Genre()
//    
//    var genreStrArray = ["Fantasy", "Horror", "Sciphy", "Romance", "Nonfiction", "Something"]
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        genre.buildImageArray()
//        
//        collectionView.dataSource = self
//        collectionView.delegate = self
//        setUpCollectionView()
//    }
//    
//    func setUpCollectionView() {
//        let layout = CHTCollectionViewWaterfallLayout()
//        layout.minimumColumnSpacing = 1.0
//        layout.minimumInteritemSpacing = 1.0
//        layout.columnCount = 2
//        layout.headerHeight = 50
//        self.collectionView.autoresizingMask = [UIViewAutoresizing.FlexibleHeight, UIViewAutoresizing.FlexibleWidth]
//        self.collectionView.alwaysBounceVertical = true
//        self.collectionView.collectionViewLayout = layout
//    }
//    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//        // create a cell size from the image size, and return the size
//        let imageSize: CGSize
//        if indexPath.row % 2 == 0 {
//            imageSize = CGSize(width: 150, height: 200)
//        } else if indexPath.row % 3 == 0 {
//            imageSize = CGSize(width: 70, height: 50)
//        } else {
//            imageSize = CGSize(width: 200, height: 50)
//        }
//        return imageSize
//    }
//
//}
//
//extension ReadViewController: UICollectionViewDelegate {
//}
//
//extension ReadViewController: UICollectionViewDataSource {
//    
//    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
//        return 1
//    }
//    
//    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return genre.genreImages.count
//    }
//    
//    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
//        
//        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("GenreCell", forIndexPath: indexPath) as! ImageHomeViewCell
//        
//        cell.configureCell(genreStrArray[indexPath.row])
//        cell.image.image = genre.genreImages[indexPath.row]
//        
//        return cell
//    }
//    
//}


