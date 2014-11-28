// Playground - noun: a place where people can play

//Hash Table

import Foundation

class HashTable {
    
    var size: Int
    var fillBucket = 0
    private var buckets: Array<HashBucket!>
    
    //initalize the buckets
    init(size: Int) {
        self.size = size
        //declare array with size
        self.buckets = Array<HashBucket!>(count: size, repeatedValue: nil)
        
        /*
        //note: same as...
        for i in 0..<size {
            var bucket = HashBucket()
            self.buckets.append(bucket)
        }
        */
    }
    
    //return the hash value to be used
    func createHash(key: String) -> Int! {
        
        var total: Int = 0
        for character in key.unicodeScalars {
            total += Int(character.value)
        }
        
        /*
        returning the hash value. size count is used as the dividend.  To make sure that all possible outcomes.
        */
        
        return total % self.size
    }
    
    //add key using a specific hash
    func addWord(key: String, value: AnyObject) {
        
        var hashindex = self.createHash(key)
        
        var bucket = HashBucket()
        var head: HashBucket!
        
        bucket.key = key
        bucket.value = value
        
        //check for an existing list
        if (self.buckets[hashindex] == nil) {
            self.buckets[hashindex] = bucket
        } else {
            println("a collision occured, now will use linked list, chaining")
            head = self.buckets[hashindex]
            //append new item to the head of the list
            bucket.next = head
            head = bucket
            
            //update the chianed list
            self.buckets[hashindex] = head
        }
    }
    
    //determine is the word is found in the hash table
    func findKey(key: String, value: AnyObject) -> Bool! {
        
        var hashIndex = self.createHash(key)
        
        //determine is the value is present
        if(self.buckets[hashIndex] == nil) {
            println("the key is not found in the hash table")
            return false
        } else {
            //iterate through the list of items to find a match
            var current = self.buckets[hashIndex]
            
            while(current.key != nil && current != nil) {
                if(current.key == key) {
                    println("\(key) found in hash table")
                    self.fillBucket++
                    return true
                }
                println("now searching key through the chained list")
                current = current.next
            }
        }
        println("name not found in the hash table")
        return false
    }
    
    //remove object with Key
    func removeWord(key: String) {
        var hashIndex = self.createHash(key)
        var previousBucket: HashBucket?
        var bucket = self.buckets[hashIndex]
        
        if(self.buckets[hashIndex] == nil) {
            println("the key is not found in the hash table")
            return
        } else {
            while (bucket != nil) {
                if (bucket.key == key) {
                    var nextBucket = bucket.next
                    self.buckets[hashIndex] = bucket.next
                    println("\(key) removed")
                } else {
                    previousBucket?.next = bucket.next
                }
                self.fillBucket--
                return
            }
        }
    }
    
}

class HashBucket {
    var key: String!
    var value: AnyObject!
    var next: HashBucket!

}













