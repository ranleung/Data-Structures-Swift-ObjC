// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


class Queue {
    
    var queueArray = [String]()
    
    func enqueue(stringToEnqueue : String) {
    self.queueArray.append(stringToEnqueue)
    }
    
    func dequeue() -> String? {
        if !queueArray.isEmpty {
            var dequeuedString = queueArray.first
            queueArray.removeAtIndex(0)
            return dequeuedString!
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