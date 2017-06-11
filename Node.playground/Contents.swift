//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

public class Node<T:Comparable> {
    //Value and children vars
    public var value:T
    public var childLeft:Node?
    public var childRight:Node?
    public weak var parent:Node?
    
    //Initialization
    public convenience init(value: T) {
        self.init(value: value)
    }
    
    public init(value:T, left:Node , right:Node ,
                parent:Node ) {
        self.value = value
        self.childLeft = left
        self.childRight = right
        self.parent = parent
    }
    
    // methods
    
    public func insertNodeFromRoot(value: T) {
        
        if let _ = self.parent {
            print("Where is the root?")
            return
        }
        self.addNode(value: value)
    }
    
    private func addNode(value:T) {
        
        /* 
         
         The value is less than root value; insert it in the left subtree. Insert it into the left subtree if it exists; if not, create a new node and insert it as the left child
         
        */
        
        if value < self.value {
            if let childLeft = childLeft {
                childLeft.addNode(value: value)
            } else {
                let newNode = Node(value: value)
                newNode.parent = self
                childLeft = newNode
            }
        /*

         The value is greater than root value; insert it in the right subtree. Insert it into the right subtree if it exists; if not, create a new node and insert it as the right child
         
        */
            
        } else {
            if let childRight = childRight {
                childRight.addNode(value: value)
                
            } else {
                let newNode = Node(value: value)
                newNode.parent = self
                childRight = newNode
            }
        }
        
    }
}


