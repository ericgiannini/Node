//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

public class Node< T : Comparable > {
    //Value and children vars
    public var value:T
    public var childLeft:Node?
    public var childRight:Node?
    public weak var parent:Node?
    
    //Initialization
    public convenience init(value: T) {
        self.init(value: value, left: nil, right: nil, parent:nil)
    }
    
    //Initialization
    public init(value:T, left:Node?, right:Node?,
        parent:Node?) {
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

    public class func traverseInOrder(node:Node?) {
        guard let node = node else {
            return
        }
        
        Node.traverseInOrder(node: node.childLeft)
        print(node.value)
        Node.traverseInOrder(node: node.childRight)
        
    }
    
    public class func traversePreOrder(node: Node?) {
        guard let node = node else {
            return
        }
        print(node.value)
        Node.traversePreOrder(node: node.childLeft)
        Node.traversePreOrder(node: node.childRight)
    }
    
    public class func traversePostOrder(node: Node?) {
        
        guard let node = node else {
            return
        }
        
        Node.traversePostOrder(node: node.childLeft)
        
        Node.traversePostOrder(node: node.childRight)
        
        print(node.value)
        
    }

    public func search(value:T) -> Node?  {
        // If we find the value
        if value == self.value {
            return self }
        // If the value is less than the current node value ->
        // recursive search in the left subtree. If is bigger,
        // search in the right one.
        if value < self.value {
            guard let left = childLeft else {
                return nil
            }
            return left.search(value: value)
        } else {
            guard let right = childRight else {
                return nil
            }
            return right.search(value: value)
        }
    }
    
}

let rootNode = Node(value: 10)
rootNode.insertNodeFromRoot(value: 20)
rootNode.insertNodeFromRoot(value: 5)
rootNode.insertNodeFromRoot(value: 21)
rootNode.insertNodeFromRoot(value: 8)
rootNode.insertNodeFromRoot(value: 4)

Node.traverseInOrder(node: rootNode)

Node.traversePreOrder(node: rootNode)

print("Search result: " + "\(rootNode.search(value: 1)?.value)")
print("Search result: " + "\(rootNode.search(value: 4)?.value)")

