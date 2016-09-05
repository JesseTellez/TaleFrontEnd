//
//  DetailContextVC.swift
//  Tale
//
//  Created by Jesse Tellez on 8/2/16.
//  Copyright © 2016 Inspir. All rights reserved.
//

import UIKit

class DetailContextVC: UIViewController {
    
    @IBOutlet weak var currentWriterImage: UIImageView!
    @IBOutlet weak var likeLabel: UIButton!
    @IBOutlet weak var flagButton: UIButton!
    @IBOutlet weak var upvoteLabel: UILabel!
    @IBOutlet weak var additionsTableView: UITableView!
    @IBOutlet weak var currentAdditionLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    
    var relatedAdditions: [Extension]! = []
    var selectedContext1: Extension!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        additionsTableView.dataSource = self
        additionsTableView.delegate = self
        currentAdditionLabel.text = selectedContext1.content
    }
    
    func setupRelatedAdditions(story: Story, selectedContext: Extension) {
        //relatedAdditions = story.findAllExtensionsWithIndex(selectedContext.indexRef)
        relatedAdditions = story.findAllAdditionsWithException(selectedContext.indexRef, exception: selectedContext)
        selectedContext1 = selectedContext
        //you cant set this up before the controller loads into memory!!!
    }
}

extension DetailContextVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return relatedAdditions.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("detailCell", forIndexPath: indexPath) as? ContextDetailCell
        //this might include itself
        cell?.configureCell(relatedAdditions[indexPath.row].content)
        return cell!
    }
}
