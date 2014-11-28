// Playground - noun: a place where people can play

import UIKit

//Stack - Last in, First out - LIFO

class Stack {
    
    var stackArray = [String]()
    
    func push(stringToPush : String) {
        self.stackArray.append(stringToPush)
    }
    
    func pop() ->String? {
        if self.stackArray.last != nil {
            var stringToReturn = self.stackArray.last
            self.stackArray.removeLast()
            return stringToReturn!
        } else {
            return nil
        }
    }
    
    func peep() -> String? {
        if let value = stackArray.last {
            return value
        }
        return nil
    }
}

var myStack = Stack()

myStack.push("Brad")
myStack.push("Bro")
myStack.push("Yo")
myStack.pop()
myStack.peep()
