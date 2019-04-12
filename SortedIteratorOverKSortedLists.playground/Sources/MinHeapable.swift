import Foundation

public protocol MinHeapable {
  associatedtype Element
  var heapArray: [Element] { get set }
  var heapSize: Int { get set }
  
  /// to heapify a subtree with the root at given index
  func minHeapify(_ i:Int)
  
  /// to get index of parent of node at index i
  func parent(_ i:Int) -> Int
  /// to get index of left child of node at index i
  func left(_ i:Int) -> Int
  /// to get index of right child of node at index i
  func right(_ i:Int) -> Int
  
  /// Returns the minimum key (key at root) from min heap
  func getMin() -> Element
  /// Method to remove minimum element (or root) from min heap
  func extractMin() -> Element
  /// Decreases key value of key at index i to new_val
  func decreaseKey(atIndex i:Int, withNewValue value:Element)
  /// Inserts a new key 'key'
  func insertKey(_ key:Element)
  /// Deletes a key stored at index i
  func deleteKey(atIndex i:Int)
}
