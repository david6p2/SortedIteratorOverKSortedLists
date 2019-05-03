//: [Previous](@previous)

import Foundation

//: Implement the iterator solution here
//: 
struct IteratorSortedLists<T:Comparable>: Sequence, IteratorProtocol {
    var lists: [[T]]
    let heap = MinHeapNode<Element>()
    
    init(lists: [[Element]]) {
        self.lists = lists
        
        for (index,array) in lists.enumerated() {
            let heapNode = HeapNode(element:array[0], i: index, j:0)
            heap.insertKey(heapNode)
        }
    }
    
    mutating func next() -> T? {
        if heap.heapSize > 0 {
            // extract the min from the min heap
            let min = heap.extractMin()
            // remove that value from the array it belogns
            lists[min.i].removeFirst()
            // add the next value of that array to the minHeap, if it exist
            if lists[min.i].count > 0, let firstValue = lists[min.i].first {
                let nextHeapNode = HeapNode(element:firstValue, i: min.i, j: min.j+1)
                heap.insertKey(nextHeapNode)
            }
            
            // add the extracted min to the output array
            return min.element
        } else {
            return nil
        }
    }
}

var iterator = IteratorSortedLists(lists: [[1, 4, 5, 8, 9],
                                           [3, 4, 4, 6],
                                           [0, 2, 8]])
var array = [Int]()
while let value = iterator.next() {
    array.append(value)
}

let filter = array.first { $0 > 4 }
filter
//: [Next](@next)
