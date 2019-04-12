//: [Previous](@previous)

//: Implementation of the iterator protocol as explained in
//: https://developer.apple.com/documentation/swift/iteratorprotocol
import Foundation

struct Countdown: Sequence {
  let start: Int
  
  func makeIterator() -> CountdownIterator {
    return CountdownIterator(self)
  }
}
struct CountdownIterator: IteratorProtocol {
  let countdown: Countdown
  var times = 0
  
  init(_ countdown: Countdown) {
    self.countdown = countdown
  }
  
  mutating func next() -> Int? {
    let nextNumber = countdown.start - times
    guard nextNumber > 0
      else { return nil }
    
    times += 1
    return nextNumber
  }
}

let threeTwoOne = Countdown(start: 3)
for count in threeTwoOne {
  print("\(count)...")
}

//: [Next](@next)
