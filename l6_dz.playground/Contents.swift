import UIKit

struct queue <T: Comparable> {
    var items = [T]()
    mutating func add (_ item: T){
        items.append(item)
    }
    mutating func next() -> T {
        print("Следующий \(items.first!)")
        return items.removeFirst()
    }
    func filter(item: T){
        print("ищем  \(items.filter{$0 == item})")
    }
    mutating func propertySort() -> [T]{
        return items.sorted(by: <)
    }
    subscript (index: Int) -> T? {
        return(index < items.count ? items[index] : nil)
    }
    func printCount(){
        print(items.count)
    }
}


var test = queue<String>(items:["Алексей"])

test.add("Сергей")
test.add("Иван")
test.add("Петр")
test.add("Николай")

print(test.items)
test.propertySort()

print(test.propertySort())

test.next()
test.next()
test.next()
test.filter(item: "Петр")
test.printCount()

