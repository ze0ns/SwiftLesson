import UIKit

func swapTowInt(_ a: inout Int, _ b: inout Int){
    let temp = a
    a = b
    b = temp
}

var someInt = 3
var anotherInt = 5

swapTowInt(&someInt, &anotherInt )
print(anotherInt)
print(someInt)

func swapTowDouble(_ a: inout Double, _ b: inout Double){
    let temp = a
    a = b
    b = temp
}

func swapTowString(_ a: inout String, _ b: inout String){
    let temp = a
    a = b
    b = temp
}


// универсальная функция
func swapTowValue<Type>(_ a: inout Type, _ b: inout Type){
    let temp = a
    a = b
    b = temp
}


swapTowValue(&someInt, &anotherInt)

var someString = "Петя"
var anotherString = "Вася"

swapTowValue(&someString, &anotherString)
print(someString)
print(anotherString)


// Создаем стек

struct StackInt {
    var items = [Int]()
    mutating func push(_ item: Int)
    {
        items.append(item)
    }
    mutating func pop() -> Int
    {
        return items.removeLast()
    }
}
struct StackString {
    var items = [String]()
    mutating func push(_ item: String)
    {
        items.append(item)
    }
    mutating func pop() -> String
    {
        return items.removeLast()
    }
}

//Универсальный стэк
struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element)
    {
        items.append(item)
    }
    mutating func pop() -> Element
    {
        return items.removeLast()
    }
}
var stackOfString = Stack<String>()
stackOfString.push("one")
stackOfString.push("two")
stackOfString.push("tree")


print(stackOfString)
print(stackOfString.pop())


//class SomeClass{
//    
//}
//
//protocol SomeProtocol {
//    
//    
//}
//
//func someFunction <T: SomeClass, U: SomeProtocol>(some: T,someU: U){
//    
//}

func findIndex(ofStrinf valueToFind: String, in array: [String]) -> Int?{
    for (index, value) in array.enumerated(){
        if value == valueToFind{
            return index
        }
    }
    return nil
}

var stringArray = ["кот","Собака","Курица"]

if let foundIndex = findIndex(ofStrinf: "кот", in: stringArray){
    print("Индекс \(foundIndex)")
}


// универсальный
// Ограничиваем протоколом Equatable - который говорит свифту, что входящий параметры будет содержать равенство или не равенство
func findIndexUniversal<T: Equatable>(ofStrinf valueToFind: T, in array: [T]) -> Int?{
    for (index, value) in array.enumerated(){
        if value == valueToFind {
            return index
        }
    }
    return nil
}

var stringArrayUniversal = ["кот","Собака","Курица"]

if let foundIndexUniversal = findIndexUniversal(ofStrinf: "Собака", in: stringArrayUniversal){
    print("Индекс \(foundIndexUniversal)")
}

class StreetAddres {
    let number: String
    let street: String
    let unit: String?
    
    init(_ number: String, _ street: String, _ unit: String? = nil) {
        self.number = number
        self.street = street
        self.unit = unit
    }
    
}

extension StreetAddres: Equatable{
    static func == (lhs: StreetAddres, rhs:StreetAddres ) -> Bool{
        return  lhs.number == rhs.number && lhs.street == rhs.street
    }
}

let aStreet = StreetAddres("1780", "Nevskiy")
let bStreet = StreetAddres("39", "Lenina")

print(aStreet == bStreet)

// Subscripting

struct TimeTable{
    let multiplier: Int
    subscript(index: Int) -> Int {
    return multiplier * index
    }
}

let t = TimeTable(multiplier: 3)
print("\(t[5])")



struct welcome{
    var a = "Hellou"
    var b = "Hi"
    var c = "Privet"
    
    subscript(index: Int) -> String {
        get{
            switch index {
            case 0: return a
            case 1: return b
            case 2: return c
            default:
                return ""
            }
            
        }
        //newValue - переменная передаваемая
        set{
            switch index {
            case 0: a = newValue
            case 1: b = newValue
            case 2: c = newValue
            default: break
            }
        }
    }
    subscript(index: Int, word: String) -> String {
        var text = self[index]
        text += " " + word
        return text
    }
    
}

var hi = welcome()
print(hi[0])

hi[0] = "Здоровеньки былы"
print(hi[0])

print(hi[0, "WWDC"])

//  Замыкания

let hello = {print("Hello")}

hello()
let arrayValue = [3,4,5,12,321,443,5551,354,7885]

func filterA(array: [Int], function:(Int)->Bool) -> [Int]{
    var newFilterArray = [Int]()
    for i in array {
        if function(i){
            newFilterArray.append(i)
        }
    }
    return newFilterArray
}

func compare(i: Int) -> Bool {
    return i % 2 == 1
}

filterA(array: arrayValue, function: compare)

filterA(array: arrayValue, function: {(i: Int) -> Bool in return i % 2 == 0})

let names = ["Александр","Иван","Сергей"]

func backward(_ s1: String, _ s2: String) -> Bool{
    return s1 > s2
}
var reverseNames = names.sorted(by: backward)
print(reverseNames)

reverseNames = names.sorted(by: {(s1: String, s2: String) -> Bool in return s1 > s2})
reverseNames = names.sorted(by: {s1, s2 in return s1 > s2})
print(reverseNames)
reverseNames = names.sorted {$0 < $1}
print(reverseNames)
