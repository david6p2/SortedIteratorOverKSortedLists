import Foundation

public struct HeapNode<Element: Comparable> : CustomStringConvertible {
  // Value of the node
  public var element: Element
  // Index of the array where the value was
  public var i: Int
  // Index of the value in the array where it belongs to
  public var j: Int
  
  public init(element: Element, i: Int, j: Int) {
    self.element = element
    self.i = i
    self.j = j
  }
  
  public var description: String {
    return "HeapNode[value:\(element), at Array: \(i), at Index: \(j)]"
  }
}

public class MinHeapNode<Element: Comparable>: MinHeapable {
  // Properties
  public var heapArray: [HeapNode<Element>]
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
  
  public func getMin() -> HeapNode<Element> {
    return heapArray[0]
  }
  
  public func extractMin() -> HeapNode<Element> {
    
    // Save the root that is the minimum
    let root = heapArray[0]
    // Set the last element as the new root
    heapArray[0] = heapArray[heapSize-1]
    _ = heapArray.popLast()
    // Reduce the size of the heap
    heapSize -= 1
    // And Heapify
    minHeapify(0)
    
    return root
  }
  
  public func decreaseKey(atIndex i: Int, withNewValue value: HeapNode<Element>) {
    var i = i
    heapArray[i].element = value.element
    
    // Fix the min heap property if it is violated
    while (i != 0 && heapArray[parent(i)].element > heapArray[i].element) {
      swap(&heapArray[i], &heapArray[parent(i)])
      i = parent(i)
    }
  }
  
  public func insertKey(_ key: HeapNode<Element>) {
    // First insert the new key at the end
    heapSize += 1
    var i = heapSize - 1
    heapArray.append(key)
    
    // Fix the min heap property if it is violated
    while (i != 0 && heapArray[parent(i)].element > heapArray[i].element) {
      swap(&heapArray[i], &heapArray[parent(i)])
      i = parent(i)
    }
  }
  
  public func deleteKey(atIndex i: Int) {
    
    /// New implementation when the Element type doesn't have a min value like Int.min
    swap(&heapArray[i], &heapArray[heapSize-1])
    
    // Set the last element as the new root
    swap(&heapArray[0], &heapArray[i])
    _ = heapArray.popLast()
    
    // Reduce the size of the heap
    heapSize -= 1
    // And Heapify
    minHeapify(0)
    ///
//    print("Going to delete Key at index \(i) = \(heapArray[i])")
//    let newValue = HeapNode(element: self.minValueForElementType(), i: heapArray[i].i, j: heapArray[i].j)
//    decreaseKey(atIndex: i, withNewValue: newValue)
//    print("The heapArray after decreasing value at index \(i) is \(heapArray)")
//    _ = extractMin()
//    print("The heapArray after extract min is \(heapArray)")
  }
}
