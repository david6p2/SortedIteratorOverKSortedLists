# Sorted Iterator Over K Sorted Lists

This is the problem statement

Given K sorted lists of up to N elements in each list, return a sorted iterator over all the items.

Importent notes:

- K denotes the number of lists.
- N denotes the length of the longest list.
- You may assume K << N
- There aren't necessarily N items in each list, but there could be.
- Items are not unique, if an item appears X times (in a single list or in several lists), we would expect the iterator to return the item X consecutive times.

Receiving the following lists:

1. [1, 4, 5, 8, 9]

2. [3, 4, 4, 6]

3. [0, 2, 8]

Would yield the following result:

[0, 1, 2, 3, 4, 4, 4, 5, 6, 8, 8, 9]

## Possible strategies to solve it:

I was faced with this problem and was unable to solved at first.

Possible solutions strategies are (taked from https://www.geeksforgeeks.org/merge-k-sorted-arrays/):

- Concatenate all arrays in one and finally, sort the output array using any O(n Log n) sorting algorithm. This approach takes O(nk Log nk) time. 
- Other solution is the divide and conquer mechanism, that would be to first merge arrays into groups of 2. After first merging, we have k/2 arrays. We again merge arrays in groups, now we have k/4 arrays. We keep doing it unit we have one array left. The time complexity of this solution would O(nk Log k). How? Every merging in first iteration would take 2n time (merging two arrays of size n). Since there are total k/2 merging, total time in first iteration would be O(nk). Next iteration would also take O(nk). There will be total O(Log k) iterations, hence time complexity is O(nk Log k)
- The solution I choose was to use Min Heap. This Min Heap based solution has same time complexity which is O(nk Log k). But for different sized arrays, this solution works much better. 

## What was my first approach to solve it

First, you may ask why do I have so many comments in all the code. Well, when I'm going to solve this type of algorithmic problems, I use to write what I'am going to do before I begin to code, so that way I won't get lost at the middle of coding the solution or miss any of the steps I talked about at first.

Priority Queue (MinHeap) solution was the one I thought first time I saw the problem, but I got stuck when trying to implement the Min Heap (priority queue). I didn't really know that was named a priority queue and didn't know the different way you can implement them. 

Another blocker for me was the concept of iterator, because I never had to implement an iterator in Swift neither Objective-C. So here I add and implementation of an iterator based on (https://developer.apple.com/documentation/swift/iteratorprotocol)

You can also find here:

* Generic protocols with associated types (https://www.bobthedeveloper.io/blog/generic-protocols-with-associated-type)
* How to run Unit Test in playgrounds
* CustomStringConvertible protocol implementation
* IteratorProtocol implementation
* Also this was useful https://stackoverflow.com/questions/26224693/how-can-i-make-public-by-default-the-member-wise-initialiser-for-structs-in-swif as I didn't know that the the default memberwise initializer for a structure type is considered private. To make it public you have to create and implement your own.
