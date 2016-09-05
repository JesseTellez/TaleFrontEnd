//
//  GenreTableVC.swift
//  Tale
//
//  Created by Jesse Tellez on 9/3/16.
//  Copyright © 2016 Inspir. All rights reserved.
//

import UIKit

class GenreTableVC: UIViewController {
    @IBOutlet weak var genreTableView: UITableView!
    var genre: Genre!
    var storyArray: [Story] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        genreTableView.delegate = self
        genreTableView.dataSource = self
        storyArray = DataManager.sharedInstance.getStoriesForGenre(genre)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toStoryDetail" {
            if let detailsView = segue.destinationViewController as? BaseStoryVC {
              if let story = sender as? Story {
                detailsView.story = story
              }
  
            }
        }
    }
}

extension GenreTableVC: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storyArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("storyCell", forIndexPath: indexPath) as! StoryTVCell
        cell.configureCell(storyArray[indexPath.row])
        return cell
    }
}

extension GenreTableVC: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("toStoryDetail", sender: storyArray[indexPath.row])
    }
}
