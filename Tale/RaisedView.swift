//
//  RaisedView.swift
//  Tale
//
//  Created by Jesse Tellez on 7/19/16.
//  Copyright © 2016 Inspir. All rights reserved.
//

import UIKit

public struct TableItemOption {
    
    public var title: String?
    public var selectionBlock : (() -> Void)?
    
    public init(title: String, selectionBlock : (() -> Void)) {
        self.title = title
        self.selectionBlock = selectionBlock
    }
    
}

public protocol RaisedViewDelegate {
    func selectedOption()
    func transitioningToHeight(height: CGFloat)
    func transitioningToSize(size: CGFloat)
}

public class RaisedView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    public var options: [TableItemOption] = []
    public var delegate: RaisedViewDelegate!
    public var tableView: UITableView!
    public var config: RaisedViewConfiguration!
    
    convenience public init(tableItems: [TableItemOption], delegate: RaisedViewDelegate, configuration: RaisedViewConfiguration) {
        self.init(frame: CGRectZero)
        self.options = tableItems
        self.delegate = delegate
        self.config = configuration
        self.backgroundColor = configuration.viewBackgroundColor
    }
    
    override private init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public func setUp() {
        if options.count > 0 {
            makeTableView()
        }
    }
    
    private func makeTableView() -> UITableView {
        
        let tv = UITableView(frame: CGRectZero)
        tv.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        tv.separatorStyle = .None
        tv.delegate = self
        tv.dataSource = self
        tv.scrollEnabled = false
        return tv
    }
    
    public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    public func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 30
    }
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.selectionStyle = .None
        cell.textLabel?.font = config.tableViewTextFont
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.textLabel?.textAlignment = .Center
        cell.textLabel?.text = options[indexPath.row].title
        cell.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        return cell
    }
    
    public func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        options[indexPath.row].selectionBlock?()
    }
}
