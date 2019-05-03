//: [Previous](@previous)
//:
//: To solve this problem, these would be the steps I would follow:
//:
//: Create the array to return the answer
//:
//: Create the priority queue (minHeap)
//:
//: Add the first element of each k Arrays to the minHeap
//:
//: While min heap is not empty
//:
//: extract the min from the min heap
//:
//: add the extracted min value to the output array
//:
//: remove that value from the array it belogns
//: 
//: add the next value of that array to the minHeap, if it exist
//:

import Foundation

func mergeKSortedLists(_ lists: [[Int]]) -> [Int] {
  var lists = lists
  // Create the array to return
  var output: [Int] = []
  // Create the minHeap
  let heap = MinHeapNode<Int>()
  // Add the first element of each k Arrays to the minHeap
  for (index,array) in lists.enumerated() {
    let heapNode = HeapNode(element:array[0], i: index, j:0)
    heap.insertKey(heapNode)
  }
  
  // repeat step extrac until min heap is empty
  while heap.heapSize > 0 {
    // extract the min from the min heap
    let min = heap.extractMin()
    // add the extracted min to the output array
    output.append(min.element)
    // remove that value from the array it belogns
    lists[min.i].removeFirst()
    // add the next value of that array to the minHeap, if it exist
    if lists[min.i].count > 0, let firstValue = lists[min.i].first {
      let nextHeapNode = HeapNode(element:firstValue, i: min.i, j: min.j+1)
      heap.insertKey(nextHeapNode)
    }
  }
  
  return output
}
//: 1: [1, 4, 5, 8, 9]
//:
//: 2: [3, 4, 4, 6]
//:
//: 3: [0, 2, 8]

var result = mergeKSortedLists([[1, 4, 5, 8, 9],
                                [3, 4, 4, 6],
                                [0, 2, 8] ])

//: [0, 1, 2, 3, 4, 4, 4, 5, 6, 8, 8, 9]
print(result)

//: [Next](@next)
