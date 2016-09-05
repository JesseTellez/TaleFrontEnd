//
//  LinkedList.swift
//  Tale
//
//  Created by Jesse Tellez on 8/3/16.
//  Copyright © 2016 Inspir. All rights reserved.
//

import Foundation

public class LinkedListNode<T> {
    //this will be an extention
    var value: T
    var next: LinkedListNode?
    //previous is weak because we do not need to keep track of it all the time
    weak var previous: LinkedListNode?
    
    public init(value: T) {
        self.value = value
    }
}


public class LinkedList<T> {
    
    public typealias Node = LinkedListNode<T>
    private var head: Node?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: Node? {
        return head
    }
    
    public var last: Node? {
        if var node = head {
            while case let next? = node.next {
                node = next
            }
            return node
        } else {
            return nil
        }
    }
    
    public var count: Int {
        if var node = head {
            var c = 1
            while case let next? = node.next {
                node = next
                c += 1
            }
            return c
        } else {
            return 0
        }
    }
    
    public func nodeAtIndex(index: Int) -> Node? {
        
        if index >= 0 {
            var node = head
            var i = index
            //this is like a two way iteration
            while node != nil {
                if i == 0 { return node }
                i -= 1
                node = node!.next
            }
        }
        
        return nil
    }
    
    //wtf is a subscript
    public subscript(index: Int) -> T {
        let node = nodeAtIndex(index)
        assert(node != nil)
        return node!.value
    }
    
    public func append(value: T) {
        let newNode = Node(value: value)
        if let lastNode = last {
            //KEEP IN MIND: we are always adding to the end of the list
            newNode.previous = lastNode
            lastNode.next = newNode
        } else {
            head = newNode
        }
    }
    
    private func nodesBeforeAndAfter(index: Int) -> (Node?, Node?) {
        
        assert(index >= 0)
        
        var i = index
        var next = head
        var prev: Node?
        
        while next != nil && i > 0 {
            i -= 1
            prev = next
            next = next!.next
        }
        
        assert(i == 0)
        
        return (prev, next)
    }
    
    public func insert(value: T, atIndex index: Int) {
        let (prev, next) = nodesBeforeAndAfter(index)
        let newNode = Node(value: value)
        newNode.previous = prev
        newNode.next = next
        prev?.next = newNode
        next?.previous = newNode
        
        if prev == nil {
            head = newNode
        }
    }
    
    public func removeAll() {
        head = nil
    }
    
    //actually I will be removing nodes when they change
    public func removeNode(node: Node) -> T {
        let prev = node.previous
        let next = node.next
        
        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        
        next?.previous = prev
        node.previous = nil
        node.next = nil
        return node.value
    }
    
    public func removeLast() -> T {
        assert(!isEmpty)
        return removeNode(last!)
    }
    
    public func removeAtIndex(index: Int) -> T {
        let node = nodeAtIndex(index)
        assert(node != nil)
        return removeNode(node!)
    }
}

extension LinkedList: CustomStringConvertible {
    
    
    public var description: String {
        //this is not done
        var s = "["
        return s
    }
    
}

extension LinkedList {
    
    public func reverse() {
        var node = head
        while let currentNode = node {
            node = currentNode.next
            //we want it changed here so we pass the reference
            swap(&currentNode.next, &currentNode.previous)
            head = currentNode
        }
    }
}

//make more extensions as needed








