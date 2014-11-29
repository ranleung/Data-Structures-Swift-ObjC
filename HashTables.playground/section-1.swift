// Playground - noun: a place where people can play

//Hash Table

import Foundation

class HashTable {
    
    var size: Int
    var fillBucket = 0
    var buckets: Array<HashBucket!>
    
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
    func addWord(key: String, value: String) {
        
        var hashindex = self.createHash(key)
        println("Hashindex: \(hashindex)")
        
        var bucket = HashBucket()
        var head: HashBucket!
        
        bucket.key = key
        bucket.value = value
        
        self.fillBucket++
        
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
            println(hashindex)
        }
    }
    
    //determine is the word is found in the hash table
    func findKey(key: String, value: String) -> Bool! {
        
        var hashIndex = self.createHash(key)
        println("Finding hashindex: \(hashIndex)")

        //determine is the value is present
        if(self.buckets[hashIndex] == nil) {
            println("the key is not found in the hash table")
            return false
        } else {
            //iterate through the list of items to find a match
            var current = self.buckets[hashIndex]
            
            while(current != nil) {
                if(current.key == key && current.value == value) {
                    println("\(key) found in hash table")
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
    func removeWord(key: String, value: String) -> String {
        var hashIndex = self.createHash(key)
        var previousBucket: HashBucket?
        var bucket = self.buckets[hashIndex]
        
        //check if there is a bucket for this hashIndex
        if(bucket == nil) {
            return ("No Bucket at this key exists")
        } else {
            while (bucket != nil) {
                if (bucket.key == key && bucket.value == value) {
                    //If there is a previous bucket
                    if previousBucket != nil {
                        previousBucket?.next = bucket.next
                        self.fillBucket--
                        return("REMOVED: \(key) - \(value)")
                    }
                    //If the first one
                    self.buckets[hashIndex] = bucket.next
                    self.fillBucket--
                    return("REMOVED: \(key) - \(value)")
                } else {
                    previousBucket = bucket
                    bucket = bucket.next
                }
            }
            return ("KEY WITH VALUE NOT FOUND: \(key) - \(value)")
        }
    }
    
}


class HashBucket {
    var key: String!
    var value: String!
    var next: HashBucket!
    
}


var myHashTable = HashTable(size: 10)

myHashTable.addWord("brands", value: "apple")
myHashTable.addWord("clothing", value: "jacket")
myHashTable.addWord("coffee", value: "latte")
myHashTable.addWord("brands", value: "samsung")
myHashTable.addWord("brands", value: "HTC")

myHashTable.findKey("brands", value: "HTC")
myHashTable.findKey("brands", value: "dsds")

myHashTable.removeWord("dsds", value: "dds")
myHashTable.removeWord("brands", value: "fdsfds")
myHashTable.removeWord("brands", value: "HTC")
myHashTable.removeWord("brands", value: "samsung")
myHashTable.findKey("brands", value: "HTC")


println(myHashTable.fillBucket)










