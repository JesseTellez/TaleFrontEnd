//
//  BaseStoryVC.swift
//  Tale
//
//  Created by Jesse Tellez on 7/21/16.
//  Copyright © 2016 Inspir. All rights reserved.
//

import UIKit
import Foundation

protocol ReturnContentBackDelegate {
    func returnNewExtension(content: String, contextRef: Extension)
}

class BaseStoryVC: UIViewController, ReturnContentBackDelegate {
    
    @IBOutlet weak var extensionTableView: UITableView!
    @IBOutlet weak var storyTitleLabel: UILabel!
    @IBOutlet weak var baseStoryLabel: UILabel!
    @IBOutlet weak var storyImageView: UIImageView!
    
    static var delegate: ReturnContentBackDelegate!
    
    var currentUser: User!
    var story: Story!
    weak var selectedContext: Extension?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        extensionTableView.delegate = self
        extensionTableView.dataSource = self
        currentUser = User(name: "JesseFest")
        
        createSampleData()
        
        ContextSelectVC.delegate = self
        
        storyTitleLabel.text = story.title
        storyImageView.image = story.image
        baseStoryLabel.text = story.base.content
        
        print("my story is \(story.title)")

    }
    
    func returnNewExtension(content: String, contextRef: Extension) {
        if contextRef.content ==  story.base.content {
            let newExtension = Extension(owner: currentUser, nil, content)
            newExtension.votes = 1000
            story.addAddition(newExtension)
        } else {
            let newExtension = Extension(owner: currentUser, contextRef, content)
            newExtension.votes = 1000
            story.addAddition(newExtension)
        }
        extensionTableView.reloadData()
    }
    
    func createSampleData() {
        
        let extensionText = "The dragon when to the zoo and the found some animal friends.  When the dragon arived, he was shocked to see that the zoo only consisted of a group of penguinz.  The penguinz ate him...it was a good day.  Here is another line for the story....i need more lines so here is another line"
        
        let extensionText2 = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
        //this one has the best size text
//        let extensionText2 = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
        
        let extensionText3 = "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful."
        
        let extensionText4 = "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio."
        //a new reference to the story needs to be made like this
        let someExtension = Extension(owner: currentUser, nil, extensionText)
        someExtension.votes = 30
        let anotherExtension = Extension(owner: currentUser, nil, "THIS IS ANOTHER EXTENSION")
        anotherExtension.votes = 29
        let someExtension2 = Extension(owner: currentUser, someExtension, extensionText2)
        someExtension2.votes = 15
        let anotherExtension2 = Extension(owner: currentUser, someExtension, "THIS IS ANOTHER EXTENSION 2")
        anotherExtension2.votes = 10
        let someExtension3 = Extension(owner: currentUser, someExtension2, extensionText3)
        someExtension3.votes = 8
        let anotherExtension3 = Extension(owner: currentUser, someExtension2, "THIS IS ANOTHER EXTENSION 3")
        anotherExtension3.votes = 20
        let someExtension4 = Extension(owner: currentUser, someExtension3, extensionText4)
        someExtension4.votes = 10
        
        story.addAddition(someExtension)
        story.addAddition(someExtension2)
        story.addAddition(someExtension3)
        story.addAddition(someExtension4)
        story.addAddition(anotherExtension)
        story.addAddition(anotherExtension2)
        story.addAddition(anotherExtension3)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toModalView" {
            if let ContextVC = segue.destinationViewController as? ContextSelectVC {
                //if I want to modifiy this story, it may need t be a reference..
                //this might also be causing it to retain memory
                ContextVC.setUpTableViewData(story)
            }
        }
        if segue.identifier == "toExtensionDetial" {
            if let DetailContextVC = segue.destinationViewController as? DetailContextVC {
                DetailContextVC.setupRelatedAdditions(story, selectedContext: selectedContext!)
            }
        }
    }
}


extension BaseStoryVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let exCount = story.activeAdditions?.count where exCount > 0 {
            return exCount
        }
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("extensionCell", forIndexPath: indexPath) as? ExtensionTVC
//        cell?.configureCell((story.activeAdditions?.nodeAtIndex(indexPath.row)!.value.content)!)
        cell?.configureCellWithAddition((story.activeAdditions?.nodeAtIndex(indexPath.row)!.value)!)
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedIndex = tableView.indexPathForSelectedRow
        let currentCell = tableView.cellForRowAtIndexPath(selectedIndex!) as? ExtensionTVC
        selectedContext = currentCell?.addition1
        print("The Selected Context is: \(selectedContext)")
        self.performSegueWithIdentifier("toExtensionDetial", sender: self)
    }
}

