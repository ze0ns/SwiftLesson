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
