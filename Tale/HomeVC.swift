//
//  HomeVC.swift
//  Tale
//
//  Created by Jesse Tellez on 7/18/16.
//  Copyright © 2016 Inspir. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    var trendingStories: [Story] = []
    var currentUser: User!
    var genreArray: [Genre] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        currentUser = User(name: "JesseFest")
        
        genreArray = DataManager.sharedInstance.getGenres()
        
        makeSampleTrendingStories()
    }
    
    func makeSampleTrendingStories() {
        //this is the base
        let exampleText = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        let baseExtension = Extension(owner: currentUser, nil, exampleText)
        
        let someStory = Story(title: "Kingdom Amalor", UIImage(named: "fantasy.jpg"), baseExtension, category: .Adventure, owner: baseExtension.owner)
        let someStory2 = Story(title: "The Basement Key", UIImage(named: "horror.jpg"), baseExtension, category: .Horror, owner: baseExtension.owner)
        let someStory3 = Story(title: "Loves First Sight", UIImage(named: "romance.jpg"), baseExtension, category: .Romance, owner: baseExtension.owner)
        let someStory4 = Story(title: "Simon's Path", UIImage(named: "mystery.jpg"), baseExtension, category: .Mystery, owner: baseExtension.owner)
        let someStory5 = Story(title: "Cloverfield", UIImage(named: "UFO.jpg"), baseExtension, category: .ScienceFiction, owner: baseExtension.owner)
        
        trendingStories = [someStory, someStory2, someStory3, someStory4, someStory5]
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "ToDetailView" {
            
            if let detailsVC = segue.destinationViewController as? BaseStoryVC {
                if let story = sender as? Story {
                    detailsVC.story = story
                }
            }
        }
        
        if segue.identifier == "toGenreTableView" {
            if let genreTableView = segue.destinationViewController as? GenreTableVC {
                if let genre = sender as? Genre {
                    genreTableView.genre = genre
                }
            }
        }
    }
}


extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trendingStories.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("spotlightCell", forIndexPath: indexPath) as! SpotlightCVC
        
        cell.configureCell(trendingStories[indexPath.row])
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("ToDetailView", sender: trendingStories[indexPath.row])
    }
    
    
}


extension HomeVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genreArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("genreCell", forIndexPath: indexPath) as! GenreTBCell
        
        cell.configureCell(genreArray[indexPath.row])
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("toGenreTableView", sender: genreArray[indexPath.row])
    }
}

