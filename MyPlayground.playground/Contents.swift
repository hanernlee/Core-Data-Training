////: Playground - noun: a place where people can play
//
//
//var arr = [1, 5, 3, 9, 6, 4, 8]
//
//
//func mergeSort(_ array: [Int]) -> [Int] {
//    guard array.count > 1 else { return array }
//
//    let middleIndex = array.count / 2
//
//    let leftArray = mergeSort(Array(array[0..<middleIndex]))
//
//    let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
//
//    return merge(leftPile: leftArray, rightPile: rightArray)
//}
//
//func merge(leftPile: [Int], rightPile: [Int]) -> [Int] {
//
//    var leftIndex = 0
//    var rightIndex = 0
//
//    var orderedPile = [Int]()
//
//    while leftIndex < leftPile.count && rightIndex < rightPile.count {
//        if leftPile[leftIndex] < rightPile[rightIndex] {
//            orderedPile.append(leftPile[leftIndex])
//            leftIndex += 1
//        } else if leftPile[leftIndex] > rightPile[rightIndex] {
//            orderedPile.append(rightPile[rightIndex])
//            rightIndex += 1
//        } else {
//            orderedPile.append(leftPile[leftIndex])
//            leftIndex += 1
//
//            orderedPile.append(rightPile[rightIndex])
//            leftIndex += 1
//        }
//    }
//
//    while leftIndex < leftPile.count {
//        orderedPile.append(leftPile[leftIndex])
//        leftIndex += 1
//    }
//
//    while rightIndex < rightPile.count {
//        orderedPile.append(rightPile[rightIndex])
//        rightIndex += 1
//    }
//
//    return orderedPile
//}
//
//print(mergeSort(str))

//Binary Search

//var array = [1, 3, 4, 5, 9, 10, 32] // Sorted

let numbers = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67]

func binarySearch<T: Comparable>(_ array: [T], key: T) -> Int? {
    var lowerBound = 0
    var upperBound = array.count
    while lowerBound < upperBound {
        let midPoint = lowerBound + (upperBound - lowerBound) / 2
        if array[midPoint] == key {
            print(midPoint)
            return midPoint
        } else if array[midPoint] < key {
            lowerBound = midPoint + 1
        } else {
            upperBound = midPoint
        }
    }
    return nil
}
binarySearch(numbers, key: 43)  // gives 13








