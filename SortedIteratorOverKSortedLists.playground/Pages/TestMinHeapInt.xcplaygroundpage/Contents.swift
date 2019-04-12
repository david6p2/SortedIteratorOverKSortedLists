//: [Previous](@previous)

import Foundation
//: ### Tests Code Goes here
import XCTest

class MyTests : XCTestCase {
  
  func testInsertKey() {
    print("Starting")
    let h = MinHeapInt()
    h.insertKey(3)
    h.insertKey(2)
    XCTAssertEqual(h.heapArray, [2,3], "The returned array is not sorted as a min heap")
    h.deleteKey(atIndex:1)
    XCTAssertEqual(h.heapArray, [2], "The returned array is not sorted as a min heap")
    h.insertKey(15)
    h.insertKey(5)
    h.insertKey(4)
    h.insertKey(45)
    let firstMin = h.extractMin()
    print("Going to extract min")
    print(firstMin)
    XCTAssertEqual(firstMin, 2, "It didn't return the minimum value")
    print("The heapArray is \(h.heapArray)")
    print(h.getMin())
    h.decreaseKey(atIndex: 2, withNewValue: 1)
    print("The heapArray is \(h.heapArray)")
    XCTAssertEqual(h.heapArray, [1,15,4,45], "The returned array is not sorted as a min heap")
    print(h.getMin())
    XCTAssertEqual(h.getMin(), 1, "It didn't return the minimum value")
  }
}

class PlaygroundTestObserver : NSObject, XCTestObservation {
  func testCase(_ testCase: XCTestCase, didFailWithDescription description: String, inFile filePath: String?, atLine lineNumber: Int) {
    print("Test failed on line \(lineNumber): \(testCase.name ), \(description)")
  }
}

let observer = PlaygroundTestObserver()
let center = XCTestObservationCenter.shared
center.addTestObserver(observer)

struct TestRunner {
  
  func runTests(testClass:AnyClass) {
    print("Running test suite \(testClass)")
    
    let tests = testClass as! XCTestCase.Type
    let testSuite = tests.defaultTestSuite
    testSuite.run()
    let run = testSuite.testRun as! XCTestSuiteRun
    
    print("Ran \(run.executionCount) tests in \(run.testDuration)s with \(run.totalFailureCount) failures")
  }
}

TestRunner().runTests(testClass:MyTests.self)
//: [Next](@next)
