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

func palindromeIndex(s: String) -> Int {
    let reverse = s.reversed()
    if s == String(reverse){
        return -1
    }else{
        while true{
            var tempStr = s
            let temp = Array(s)
            for (i,v) in temp.enumerated(){
                if let index = tempStr.firstIndex(of: v){
                    tempStr.remove(at: index)
                    if tempStr == String(tempStr.reversed()){
                        return i
                    }else{
                        tempStr = s
                    }
                }
            }
        }
        
    }

}
print(palindromeIndex(s: "aaa"))


func gridChallenge(grid: [String]) -> String {
    var result = "YES"
    let temp = grid.map({$0.sorted(by: <)})
    let totalCount = temp.first?.count ?? 0
    for index in 0..<totalCount{
        let tempItem = temp[0][index]
        for i in 1..<temp.count{
            let value = temp[i][index]
            if tempItem > value{
                result = "NO"
                break
            }
        }
        
    }
    return result
}

print(gridChallenge(grid: ["abc","ade","efg"]))
//print(gridChallenge(grid: ["mpxz","abcd","wlmf"]))
//print(gridChallenge(grid: ["abc","hjk","mpq","rtv"]))
//print(gridChallenge(grid: ["ebacd","fghij","olmkn","trpqs","xywuv"]))
func dateFormat(){
    let date = "08-May-2024 at 5:51:13 PM"
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd-MM-yyyy 'at' h:mm:ss a"
    dateFormatter.timeZone = TimeZone.gmt
    if let dt = dateFormatter.date(from: date){
        print(dt)
    }
}
dateFormat()

func superDigit1(n: String, k: Int) -> Int {
    // Write your code here
    var answer = 0
//    let sum = n.reduce(0) { $0 + Int(String($1))! }
    var inputStr = ""
    for i in 0..<k{
        inputStr += n
    }
    answer = inputStr.map({Int(String($0))!}).reduce(0, +)
    if answer > 10{
        return superDigit(n: String(answer), k: 1)
    }
    return answer
}
func superDigit(n: String, k: Int) -> Int {
    // Write your code here
    var answer = 0
    let sum = n.reduce(0) { $0 + Int(String($1))! }
    answer = sum * k
    if answer > 10{
        return superDigit(n: String(answer), k: 1)
    }
    return answer
}
//Optimised Version
func superDigitOptimised(n: String, k: Int) -> Int {
    // Write your code here
    let sum = n.reduce(0) { $0 + Int(String($1))! }
    let superDigit = sum * k % 9
    return superDigit == 0 ? 9 : superDigit
}
//print(superDigitOptimised(n: "3546630947312051453014172159647935984478824945973141333062252613718025688716704470547449723886626736", k: 100000))
//print(superDigit1(n: "3546630947312051453014172159647935984478824945973141333062252613718025688716704470547449723886626736", k: 100000))

func minimumBribes( q: [Int]) {
    var queue = q
    let n = queue.count
    var bribes = 0
    
    for i in stride(from: n - 1, through: 0, by: -1) {
        if queue[i] != (i + 1) {
            if i - 1 >= 0 && queue[i - 1] == (i + 1) {
                bribes += 1
                queue.swapAt(i, i - 1)
            } else if i - 2 >= 0 && queue[i - 2] == (i + 1) {
                bribes += 2
                queue[i - 2] = queue[i - 1]
                queue[i - 1] = queue[i]
                queue[i] = i + 1
            } else {
                print("Too chaotic")
                return
            }
        }
    }
    
    print(bribes)
    
}
var item = [2, 1, 5, 3, 4]
minimumBribes(q: item)

func findStartPoint(petrolPumps: [[Int]]) -> Int {
    var start = 0
    var petrolRemaining = 0
    var smallAmount = 0
    
    for i in 0..<petrolPumps.count {
        let petrol = petrolPumps[i][0]
        let distance = petrolPumps[i][1]
        petrolRemaining += petrol - distance
        
        if petrolRemaining < 0 {
            start = i + 1
            smallAmount += petrolRemaining
            petrolRemaining = 0
        }
    }
    
    return petrolRemaining + smallAmount >= 0 ? start : -1
}

// Example usage:
let petrolPumps = [[4, 6], [6, 5], [7, 3], [4, 5]]
print(findStartPoint(petrolPumps: petrolPumps))

func dynamicArray(n: Int, queries: [String]) -> [Int] {
    var arr = Array(repeating: [Int](), count: n)
    var lastAnswer = 0
    var result = [Int]()
    
    for query in queries {
        let parts = query.split(separator: " ").map { Int($0)! }
        let type = parts[0]
        let x = parts[1]
        let y = parts[2]
        
        let idx = (x ^ lastAnswer) % n
        
        if type == 1 {
            arr[idx].append(y)
        } else if type == 2 {
            let element = y % arr[idx].count
            lastAnswer = arr[idx][element]
            result.append(lastAnswer)
        }
    }
    
    return result
}

// Example usage:
let n = 2
let queries = [
    "1 0 5",
    "1 1 7",
    "1 0 3",
    "2 1 0",
    "2 1 1"
]
print(dynamicArray(n: n, queries: queries)) // Output: [7, 3]


func arrayManipulation(n: Int, queries: [[Int]]) -> Int {
    var arr = Array(repeating: 0, count: n + 1)
    
    for query in queries {
        let a = query[0]
        let b = query[1]
        let k = query[2]
        
        arr[a] += k
        if b+1 <= n {
            arr[b+1] -= k
        }
    }
    
    var maxVal = 0
    var sum = 0
    for val in arr {
        sum += val
        maxVal = max(maxVal, sum)
    }
    
    return maxVal
}

// Example usage:
let n2 = 10
let queries2 = [
    [1, 5, 3],
    [4, 8, 7],
    [6, 9, 1]
]
print(arrayManipulation(n: n2, queries: queries2))
