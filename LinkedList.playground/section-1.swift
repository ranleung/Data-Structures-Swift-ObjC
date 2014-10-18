// Playground - noun: a place where people can play

//Implemetning Linked List

import UIKit

class Node<T> {
    var value: T?
    var next: Node? = nil
    
    init(_ value:T) {
        self.value = value
    }
}

class LinkedList <T> {
    var head: Node<T>? = nil
    
    func insert(value: T) {
        //0th case when the list is initally empty
        if head == nil {
            head = Node<T>(value)
        } else {
            var lastNode = head
            //Finding the last node on the list
            while lastNode?.next != nil {
                lastNode = lastNode?.next
            }
        
            //Once found
            let newNode = Node(value)
            lastNode?.next = newNode
        }
    }
    
    func remove(value: T) {
        //Case 1: Target node is the head
        //Case 2: Target node is the tail
        //Case 3: Target node is middle
        
        if head != nil {
            var node = head
            var previousNode: Node<T>? = nil
            while (node?.value != value) && (node?.next != nil) {
                previousNode = node
                node = node?.next
                
            }
            
            if node?.value == value {
                if node?.next != nil {
                    previousNode?.next = nil
                }
                else {
                    previousNode?.next = node?.next
                }
            }
        }
    }
    
    
    
}




var linkedList = LinkedList<Int>()


























