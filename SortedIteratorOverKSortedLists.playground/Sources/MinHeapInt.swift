import Foundation

public class MinHeapInt: MinHeapable {
  // MARK: MinHeapable implementation
  // Properties
  public var heapArray: [Int]
  public var heapSize: Int
  
  public func getMin() -> Int {
    return heapArray[0]
  }
  
  public func extractMin() -> Int {
    
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
  
  public func decreaseKey(atIndex i: Int, withNewValue value: Int) {
    var i = i
    heapArray[i] = value
    
    // Fix the min heap property if it is violated
    while (i != 0 && heapArray[parent(i)] > heapArray[i]) {
      swap(&heapArray[i], &heapArray[parent(i)])
      i = parent(i)
    }
  }
  
  public func insertKey(_ key: Int) {
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
    while (i != 0 && heapArray[parent(i)] > heapArray[i]) {
      swap(&heapArray[i], &heapArray[parent(i)])
      i = parent(i)
    }
    print("The final heapArray is \(heapArray)")
  }
  
  public func deleteKey(atIndex i: Int) {
    
    /// New implementation when the Element type doesn't have a min value like Int.min
    print("Going to delete key: \(heapArray[i]) at index: \(i)")
    print("The heapArray before is \(heapArray)")
    if (i != heapSize-1) {
      swap(&heapArray[i], &heapArray[heapSize-1])
      // Set the last element as the new root
      swap(&heapArray[0], &heapArray[i])
    }
    
    _ = heapArray.popLast()

    // Reduce the size of the heap
    heapSize -= 1
    // And Heapify
    minHeapify(0)
    print("The heapArray after removing the element is \(heapArray)")
    ///
    
//    print("Going to delete Key at index \(i) = \(heapArray[i])")
//    decreaseKey(atIndex: i, withNewValue: self.minValueForElementType())
//    print("The heapArray after decreasing value at index \(i) is \(heapArray)")
//    _ = extractMin()
//    print("The heapArray after extract min is \(heapArray)")
  }
  
  public init() {
    self.heapSize = 0
    self.heapArray = []
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
  
  /// A recursive method to heapify a subtree with the root at given index
  /// This method assumes that the subtrees are already heapified
  public func minHeapify(_ i:Int) {
    // Take left child index
    let leftIndex = left(i)
    // Take right child index
    let rightIndex = right(i)
    // Take index of the smallest that is suposed to be the root
    var smallest = i
    // check if left child is smaller
    if (leftIndex < heapSize && heapArray[leftIndex] < heapArray[i]) {
      smallest = leftIndex
    }
    // check if right child is smaller
    if (rightIndex < heapSize && heapArray[rightIndex] < heapArray[smallest]) {
      smallest = rightIndex
    }
    
    // if left or right child where smaller than root, you have to swap them and heapify again
    if (smallest != i) {
      swap(&heapArray[i], &heapArray[smallest])
      minHeapify(smallest)
    }
  }
  
  func minValueForElementType() -> Int {
    return Int.min
  }
}
