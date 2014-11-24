// Playground - noun: a place where people can play

//Implemetning Linked List

//insert
//insertHead
//remove
//printAllKeys


import UIKit

class Node<T: Equatable> {
    var value: T? = nil
    var next: Node? = nil
}

class LinkedList<T: Equatable> {
    
    var head = Node<T>()
    
    //insert at the end
    func insert(value: T) {
        //find to see if empty list
        if self.head.value == nil {
            self.head.value = value
        } else {
            //find last node with a value
            var lastNode = self.head
            while lastNode.next != nil {
                lastNode = lastNode.next!
            }
            
            //once found, create a new node and connect to the next value
            let newNode = Node<T>()
            newNode.value = value
            lastNode.next = newNode
        }
    }
    
    func insertHead(value: T) {
        if self.head.value == nil {
            self.head.value == value
        } else {
            let newNode = Node<T>()
            newNode.value = value
            newNode.next = self.head
            self.head = newNode
        }
    }
    
    func remove(value: T) {
        if self.head.value != nil {
            var node = self.head
            //Need to keep track of the previous node
            var previousNode = Node<T>()
            //Find the node with the value and if it exists in this list
            //If found (node.value == value), exit the loop
            while node.value != value && node.next != nil {
                //previous node is current node
                previousNode = node
                node = node.next!
            }
            
            //When found, connect the previous node to the current node's next
            if node.value == value {
                if node.next != nil {
                    previousNode.next = node.next
                } else {
                    //If at the end, the next is nil
                    previousNode.next = nil
                }
            }
        }
    }
    
    func printAllKeys() {
        var current: Node! = self.head
        println("------------------")
        //assign the next instance
        while current != nil {
            println("The item is: \(current.value!)")
            current = current.next
        }
    }
    
    
}


var myList = LinkedList<Int>()
myList.insert(100)
myList.insert(200)
myList.insert(300)
myList.remove(300)
myList.remove(300)
myList.printAllKeys()












