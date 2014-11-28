// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//Queue - First in, First out, FIFO

class Queue {
    
    var queueArray = [String]()
    
    func enqueue(stringToEnqueue : String) {
        self.queueArray.append(stringToEnqueue)
    }
    
    func dequeue() -> String? {
        if self.queueArray.first != nil {
            return queueArray.removeAtIndex(0)
        } else {
            return nil
        }
    }
    
    func peek() -> String? {
        if let value = queueArray.first {
            return queueArray.first
        }
        return nil
    }
}

var myQueue = Queue()
myQueue.enqueue("Hello")
myQueue.enqueue("Bye")
myQueue.enqueue("Yo")
myQueue.dequeue()
myQueue.peek()
