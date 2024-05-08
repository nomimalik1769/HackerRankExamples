import UIKit

func plusMinus(arr: [Int]) -> Void {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.generatesDecimalNumbers = true
    formatter.minimumFractionDigits = 6
    formatter.maximumFractionDigits = 6
    let positiveV = arr.filter({$0 > 0})
    let negativeV = arr.filter({$0 < 0})
    let zeroV = arr.filter({$0 == 0})
    if positiveV.count > 0{
        let positiveAnswer = Double(positiveV.count) / Double(arr.count)
        print(formatter.string(for: positiveAnswer)!)
    }
    if negativeV.count > 0{
        let tempAnswer = Double(negativeV.count) / Double(arr.count)
        print(formatter.string(for: tempAnswer)!)
    }
    if zeroV.count > 0{
        let tempAnswer = Double(zeroV.count) / Double(arr.count)
        print(formatter.string(for: tempAnswer)!)
    }else{
        print(formatter.string(for: 0)!)
    }
}
plusMinus(arr: [1 ,-2 ,-7, 9 ,1 ,-8 ,-5])



func minimumMaximum(arr:[Int]){
    var temp = arr
    let minSum = temp.sorted(by: <).dropLast().reduce(0, +)
    let maxSum = temp.sorted(by: <).dropFirst().reduce(0, +)
    print("\(minSum)"+" "+"\(maxSum)")
    
    
}
//minimumMaximum(arr: [1,3,5,7,9])
minimumMaximum(arr: [1,2,3,4,5])

func timeConversion(s: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "hh:mm:ssa"
    dateFormatter.amSymbol = "AM"
    dateFormatter.pmSymbol = "PM"
    if let date = dateFormatter.date(from: s){
        dateFormatter.dateFormat = "HH:mm:ss"
        return dateFormatter.string(from: date)
    }
    return ""

}
print(timeConversion(s: "12:01:00AM"))


func findMedian(arr: [Int]) -> Int {
    let halfCount = arr.count / 2
    let tempArr = arr.sorted(by: <)
    return tempArr[halfCount]
}

findMedian(arr: [5,3,1,2,4])


func diagonalDifference(arr: [[Int]]) -> Int {
    var primaryDiagnol = 0
    var secondaryDiagnol = 0
    var result = 0
    var j = -1
    for (index,value) in arr.enumerated(){
        j += 1
        let k = (arr.count-1-index)
        primaryDiagnol += (arr[index][j])
        secondaryDiagnol += arr[index][k]
    }
    return abs(primaryDiagnol - secondaryDiagnol)
}

let input = [[1,2,3],[4,5,6],[9,8,9]]
print(diagonalDifference(arr: input))

func countingSort(arr: [Int]) -> [Int] {
    var sortedArr = Array(repeating: 0, count: 100)
    for (value) in arr{
        sortedArr[value] += 1
    }
    return sortedArr
}
print(countingSort(arr: [1,1,3,2,1]))

func flipMatrix(arr:[[Int]]) -> Int{
    var a = arr
    let n = a.count
    var sum = 0
    for i in 0..<(n / 2) {
        for j in 0..<(n / 2) {
            
            sum += max(
                a[i][j],
                a[i][n - j - 1],
                a[n - i - 1][j],
                a[n - i - 1][n - j - 1]
            )
        }
    }
    return sum
}

let matrix = [[8, 4, 1, 5],
              [2, 6, 7, 9],
              [3, 12, 10, 11],
              [16, 14, 13, 15]]
print(flipMatrix(arr: matrix))


func zigZagSequence(arr:[Int]) -> [Int]{
    let temp = arr.count / 2
    let left  = Array(arr[0..<temp]).sorted(by: <)
    let right = Array(arr[temp...arr.count-1]).sorted(by: >)
    return left + right
}

print(zigZagSequence(arr: [1,2,3,4,5,6,7]))

func towerBreaker(m:Int,n:Int) -> Int{
    if m == 1 || n % 2 == 0{
        return 2
    }else{
        return 1
    }
}
print(towerBreaker(m: 2, n: 2))

func caesarCipher(s: String, k: Int) -> String {
    var encryptedText = ""
    let alphabetCount = 26
    
    for char in s {
        if char.isLetter {
            let asciiValue: UInt8
            if char.isUppercase {
                asciiValue = Character("A").asciiValue!
            } else {
                asciiValue = Character("a").asciiValue!
            }
            
            let shiftValue = ((Int(char.asciiValue!) - Int(asciiValue) + k) % alphabetCount)
            
            let newCharAsciiValue = asciiValue + UInt8(shiftValue)
            let newChar = Character(UnicodeScalar(newCharAsciiValue))
            encryptedText += String(newChar)
        } else {
            encryptedText += String(char)
        }
    }
    
    return encryptedText
}
print(caesarCipher(s: "159357lcfd", k: 98))
//print(caesarCipher(s: "Hello_World!", k: 4))
