import Foundation

public struct HeapNode : CustomStringConvertible {
  // Value of the node
  public var element: Int
  // Index of the array where the value was
  public var i: Int
  // Index of the value in the array where it belongs to
  public var j: Int
  
  public init(element: Int, i: Int, j: Int) {
    self.element = element
    self.i = i
    self.j = j
  }
  
  public var description: String {
    return "HeapNode[value:\(element), at Array: \(i), at Index: \(j)]"
  }
}

public class MinHeapNode: MinHeapable {
  // Properties
  public var heapArray: [HeapNode]
  public var heapSize: Int
  
  public init() {
    self.heapSize = 0
    self.heapArray = []
  }
  
  /// to heapify a subtree with the root at given index
  public func minHeapify(_ i:Int) {
    // Take left child index
    let leftIndex = left(i)
    // Take right child index
    let rightIndex = right(i)
    // Take index of the smallest that is suposed to be the root
    var smallest = i
    // check if left child is smaller
    if (leftIndex < heapSize && heapArray[leftIndex].element < heapArray[i].element) {
      smallest = leftIndex
    }
    // check if right child is smaller
    if (rightIndex < heapSize && heapArray[rightIndex].element < heapArray[smallest].element) {
      smallest = rightIndex
    }
    
    // if left or right child where smaller than root, you have to swap them and heapify again
    if (smallest != i) {
      swap(&heapArray[i], &heapArray[smallest])
      minHeapify(smallest)
    }
  }
  
  /// to get index of parent of node at index i
  public func parent(_ i:Int) -> Int {
    return (i-1)/2
  }
  
  /// to get index of left child of node at index i
  public func left(_ i:Int) -> Int {
    return (2*i + 1)
  }
  
  /// to get index of right child of node at index i
  public func right(_ i:Int) -> Int {
    return (2*i + 2)
  }
  
  public func getMin() -> HeapNode {
    return heapArray[0]
  }
  
  public func extractMin() -> HeapNode {
    
    // Save the root that is the minimum
    let root = heapArray[0]
    print("The heapArray is \(heapArray)")
    // Set the last element as the new root
    heapArray[0] = heapArray[heapSize-1]
    _ = heapArray.popLast()
    print("The heapArray after swaping the last element is \(heapArray)")
    // Reduce the size of the heap
    heapSize -= 1
    print("The heapSize after removin the min is \(heapSize)")
    // And Heapify
    minHeapify(0)
    
    return root
  }
  
  public func decreaseKey(atIndex i: Int, withNewValue value: HeapNode) {
    var i = i
    heapArray[i].element = value.element
    
    // Fix the min heap property if it is violated
    while (i != 0 && heapArray[parent(i)].element > heapArray[i].element) {
      swap(&heapArray[i], &heapArray[parent(i)])
      i = parent(i)
    }
  }
  
  public func insertKey(_ key: HeapNode) {
    print("Going to insert \(key)")
    print("The heapSize is \(heapSize)")
    // First insert the new key at the end
    heapSize += 1
    var i = heapSize - 1
    print("The index is \(i)")
    heapArray.append(key)
    
    print("The key is \(key)")
    
    print("The heapArray is \(heapArray)")
    // Fix the min heap property if it is violated
    while (i != 0 && heapArray[parent(i)].element > heapArray[i].element) {
      swap(&heapArray[i], &heapArray[parent(i)])
      i = parent(i)
    }
    print("The final heapArray is \(heapArray)")
  }
  
  public func deleteKey(atIndex i: Int) {
    
    /// New implementation when the Element type doesn't have a min value like Int.min
    print("The heapArray is \(heapArray)")
    swap(&heapArray[i], &heapArray[heapSize-1])
    
    // Set the last element as the new root
    swap(&heapArray[0], &heapArray[i])
    _ = heapArray.popLast()
    
    // Reduce the size of the heap
    heapSize -= 1
    // And Heapify
    minHeapify(0)
    print("The heapArray after removing the element is \(heapArray)")
    ///
//    print("Going to delete Key at index \(i) = \(heapArray[i])")
//    let newValue = HeapNode(element: self.minValueForElementType(), i: heapArray[i].i, j: heapArray[i].j)
//    decreaseKey(atIndex: i, withNewValue: newValue)
//    print("The heapArray after decreasing value at index \(i) is \(heapArray)")
//    _ = extractMin()
//    print("The heapArray after extract min is \(heapArray)")
  }
}
