//
//  PopView.swift
//  Tale
//
//  Created by Jesse Tellez on 7/19/16.
//  Copyright © 2016 Inspir. All rights reserved.
//

import UIKit
import TabDrawer

public class PopView: UIView {

    public var buttonOptions: [TableItemOption] = []
    public var mask: UIView!
    public var raised: Bool = false
    public var view: UIView!
    public var configuration: RaisedViewConfiguration!
    public var raiseView: RaisedView!
    public var closeBlock : (() -> Void)?
    public var openBlock : (() -> Void)?
    public var tabbar: UIView!
    
    convenience public init(items : [TableItemOption], config : RaisedViewConfiguration?, tab: UIView) {
        self.init(frame : CGRectZero)
        self.buttonOptions = items
        self.configuration = config ?? RaisedViewConfiguration.defaultConfiguration()
        self.tabbar = tab
    }
    
    override init(frame : CGRect) {
        super.init(frame : frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func placeOn(view : UIView) {
        self.view = view
        view.addSubview(self)
        self <- [ Left(0), Right(0), Bottom(0), Height(49) ]
        makeMask()
        makeRaisedView()
    }
    
    func makeRaisedView() {
        raiseView = RaisedView(tableItems: buttonOptions, delegate: self, configuration: configuration)
        addSubview(raiseView)
        raiseView <- [ Left(0), Right(0), Bottom(0), Height(0) ]
        raiseView.setUp()
    }
    
    func makeMask() {
        mask = UIView(frame: CGRectZero)
        mask.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        mask.opaque = false
        mask.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(maskTapped(_:))))
        view.addSubview(mask)
        mask <- [Left(0), Right(0), Top(0), Bottom(0)]
        mask.removeFromSuperview()
    }
    
    public func maskTapped(sender : UITapGestureRecognizer) {
        lower {}
    }
}

extension PopView: RaisedViewDelegate {
    
    public func selectedOption() {
        lower {}
    }
    
    public func transitioningToHeight(height: CGFloat) {
        UIView.animateWithDuration(0.2) {
            self <- Height(height + 49)
            self.raiseView <- Height(height)
            self.view.layoutIfNeeded()
        }
    }
    
    public func transitioningToSize(size: CGFloat) {
        UIView.animateWithDuration(0.2) {
            
        }
    }
    
    public func raise(completion : (() -> Void)?) {
        raised = true
        view.insertSubview(mask, aboveSubview: tabbar)
        //view.insertSubview(mask, belowSubview: self)
        mask <- [Left(0), Right(0), Top(0), Bottom(0)]
        UIView.animateWithDuration(0.3, animations: {
            self.mask.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
            self <- Height(149)
            self.raiseView <- Height(100)
            self.view.layoutIfNeeded()
        }) { (success) in
            completion?()
            self.openBlock?()
        }
    }
    
    public func lower(completion : (() -> Void)?) {
        raised = false
        UIView.animateWithDuration(0.1, animations: {
            self.mask.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        }) { (s) in
            self.mask.removeFromSuperview()
            UIView.animateWithDuration(0.3, animations: {
                self <- Height(49)
                self.raiseView <- Height(0)
                self.view.layoutIfNeeded()
            }) { (success) in
                completion?()
                self.closeBlock?()
            }
        }
    }

}
