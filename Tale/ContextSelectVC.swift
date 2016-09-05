//
//  ContextSelectVC.swift
//  Tale
//
//  Created by Jesse Tellez on 7/26/16.
//  Copyright © 2016 Inspir. All rights reserved.
//

import UIKit

public let MAX_CHAR_COUNT = 335

class ContextSelectVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextViewDelegate {
    
    //the stuff from this vc is possibly retaining
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var extensionTextFeild: UITextView!
    
    private var checked: Bool! = false
    private var initialState: Bool = true
    
    var selectedContextText: Extension? = nil
    //this might need to be an array of Extensions...but how do we get the stories base?
    var extensionArray: [Extension]! = []
    static var delegate: ReturnContentBackDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        extensionTextFeild.delegate = self
    }
    
    deinit {
        NSLog("The contextSelectVC has be deinitialized")
    }
    
    func setUpTableViewData(story: Story) {
        //passing it this way may be causing it to retain memory
        var resArray = [Extension]()
        guard story.base != nil else {
            print("A stories base cannot be empty at this point")
            dismissViewControllerAnimated(true, completion: nil)
            return
        }
        
        resArray.append(story.base)
        if let additions = story.activeAdditions where additions.count > 0 {
            for i in 0 ..< additions.count {
                let addition = story.activeAdditions?.nodeAtIndex(i)
                resArray.append((addition?.value)!)
            }
        }
        extensionArray = resArray
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return extensionArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("selectableCell", forIndexPath: indexPath) as? SelectableTVC
        cell?.config(withContent: extensionArray[indexPath.row])
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let selectedIndex = tableView.indexPathForSelectedRow
        let currentCell = tableView.cellForRowAtIndexPath(selectedIndex!) as? SelectableTVC
        currentCell?.selectedImageView.hidden = false
        selectedContextText = currentCell?.addition
        
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
        print("a row has been deselected")
        selectedContextText = nil
        if let cell = tableView.cellForRowAtIndexPath(indexPath) as? SelectableTVC {
            cell.selectedImageView.hidden = true
        }
        
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        
        if textView.text == "The Story Continues....." {
            textView.text = ""
            textView.textColor = UIColor.blackColor()
        }
        textView.becomeFirstResponder()
        
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        
        if textView.text == "" {
            textView.text = "The Story Continues....."
            textView.textColor = UIColor.lightGrayColor()
        }
        textView.resignFirstResponder()
        
    }
    
    @IBAction func createPressed(sender: AnyObject) {
        
        if selectedContextText != nil {
            if !(extensionTextFeild.text?.isEmpty)! {
                if (extensionTextFeild.text.characters.count <= MAX_CHAR_COUNT) {
                    ContextSelectVC.delegate.returnNewExtension(extensionTextFeild.text!, contextRef: selectedContextText!)
                    dismissViewControllerAnimated(true, completion: nil)
                } else {
                    print("Too many characters!")
                }
            } else {
                print("Please Enter a new addition")
            }
        } else {
            print("Please Select a context")
        }
        
    }
    
    @IBAction func exitPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
