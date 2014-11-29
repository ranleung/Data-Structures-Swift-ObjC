//Binary Search Tree
//1 key(pointer) and 2 children - leaves(data)
//Left child's value is less than the parent
//Right child's value is greater than the parent

//Advantage is very fast look up
//O(log n) for insertion and lookup
//Run in logaithmic time, O(log n)


//Creating a self balance Binary Search Tree ...

import UIKit

class BinarySearchTree<T: Comparable> {
    
    var key: T? = nil
    var left: BinarySearchTree? = nil
    var right: BinarySearchTree? = nil
    
    func addNode(key: T) {
        //checking the root node
        if self.key == nil {
            self.key = key
            println("Root Node is: \(key)")
            return
        }
        
        //checking left side of the tree
        if key < self.key {
            //if left side key is occupied
            if self.left?.key != nil {
                self.left?.addNode(key)
            } else {
                //not occupied, create a new left child
                var leftChild = BinarySearchTree()
                leftChild.key = key
                self.left = leftChild
                println("\(key)")
            }
        }
        
        //checking right side of the tree
        if key > self.key {
            //if right side is occupied
            if self.right?.key != nil {
                self.right?.addNode(key)
            } else {
                //not occupied, create a new right leaf child
                var rightChild = BinarySearchTree()
                rightChild.key = key
                self.right = rightChild
                println("\(key)")
            }
        }
        
        if key == self.key {
            println("Duplicate value: \(key)")
            return
        }
    }
    
    //Traversal require O(n) since it must visit every node
    //inOrderTraversal - node.left, node.value, node.right
    func inOrderTraversal() {
        
        //If nothing in Tree
        if self.key == nil {
            println("Currently no Key")
            return
        }
        
        //traverse left side
        if self.left != nil {
            self.left?.inOrderTraversal()
        }
        
        println("Key is: \(self.key!)")
        
        //traverse right side
        if self.right != nil {
            self.right?.inOrderTraversal()
        }
    }
    
    //preOrderTraversal - node.value, node.left, node.right
    //postOrderTraversal - node.left, node.value, node.right
}




var root = BinarySearchTree<Int>()
root.addNode(13)
root.addNode(15)
root.addNode(16)
root.addNode(12)
root.addNode(100)
root.addNode(1)
root.inOrderTraversal()









