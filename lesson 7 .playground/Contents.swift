import UIKit

var isInControl = true

func selfDrive(){
    if isInControl {
        print("Все отлично")
    } else if isInControl == false {
        print("Есть ошибки")
    }
}
selfDrive()

isInControl = false
selfDrive()


// Перечисление ошибок с протоколом error
enum TeslaError: Error {
    case lostGPS
    case lowBattery
}

var lostGPS: Bool = true
var lowBattery: Bool = true

func autoTeslaDrive(){
    if lostGPS{
        print("Потерян сигнал GPS")
    }
    
    if lowBattery{
        print("Низкий заряд батареи")
    }
}
// Указываем, что метод содержит ошибки throws.
func autoDriveTesla() throws {
    if lostGPS{
        throw TeslaError.lostGPS
       }
       
       if lowBattery{
        throw TeslaError.lowBattery
       }
}

//Обработчик ошибок
do {
    try autoDriveTesla()
} catch TeslaError.lostGPS{
    print("Потерян сигнал GPS")
} catch TeslaError.lowBattery{
    print("Низкий заряд батареи")
}


enum ProgramError: Error {
    case maxSizeLimit
    case fileNotFound
    case serverError(error: Int)
}

struct File {
    var image: String
    var size: Int
}

class pictureDownload {
    var fileDownload = [
        "dog.jpeg": File(image: "dog", size: 12),
        "cat.jpeg": File(image: "cat", size: 5),
        "car.jpeg": File(image: "car", size: 9)
        ]
    
    var sizeDownload = 10
    var errorValue = 200
  // guard работает как иф-елсе только можно использовать переменную вне условия
    func downloadItem(itemNamed name: String, error: Int) throws{
        guard let file = fileDownload[name] else {
            throw ProgramError.fileNotFound
        }
        guard file.size < sizeDownload else {
            throw ProgramError.maxSizeLimit
        }
        guard error == 200 else {
            throw ProgramError.serverError(error: errorValue)
        }
        print("Картинка \(file.image) была загружена")
   }
}

let UICollection = [
    "TableView": "dog.jpeg",
    "TabBar": "cat.jpeg",
    "CollectionView": "car.jpeg"
]


func download(element: String, funcDownload: pictureDownload) throws{
    let serverMessage = 404
    let collectionView = UICollection[element] ?? "LoadScreen"
    try funcDownload.downloadItem(itemNamed: collectionView, error: serverMessage)
}



//
////Обрабатываем ошибки
do {
    try download(element: "TabBar", funcDownload: pictureDownload())
} catch ProgramError.fileNotFound{
    print("Файл не найден")
} catch ProgramError.maxSizeLimit{
    print("слишком большой файл")
} catch ProgramError.serverError(let errorCode){
    print("Ошибка сервера \(errorCode)")
}


func someTrowsFunction() throws -> Int? {
    return 10
}
//Первый вариант
var y: Int?
do {
    y = try someTrowsFunction()
    
}catch {
    y = nil
}
//Записи идентичны друг-другу
let x = try? someTrowsFunction()

//func fetchData -> Data? {
//    if let data = try? fetchDataFormatDisk() {return data}
//    if let data = try? ServerError {return data}
//    return nil
//}


//let photo = try! loadImage(atPath: "./Resourse/car.png")


//Функции высшего порядка
//На примере массива
//комманд+сонтрол+пробел вывод эмодзи
var array: [String] = ["fire","snow","rain","fire"]

print(array)
//map Служит для того что бы вызвать массив и преобразовать его. В случае необходимости вывести
print(array.map {_ in "snowball"})


//получаем вывод информации об искомом объекте, без изменения исходного массива
print(array.filter{i in i == "fire"})

//Преобразование массива, в обратном порядке
array.reverse()

//Поиск объекта в массиве, выдаёт булевое значение
print(array.contains{i in i == "fire"})

//Вывод первых 2 х элементов и последних 2х
print(array.prefix(2))
print(array.suffix(2))

//Поменяли местами элементы массива
array.swapAt(0, 2)
print(array)

//рандомно перемешивает элементы массива
array.shuffle()
print(array)

//УДаление последнего элемента из массива
//если массив пустой - попласт вернёт нил
//print(array.popLast())
//print(array)
//print(array.removeLast())
//print(array)

//Удаление первого элемента, можем указать количество элементов не воздействуя на сам массив
print(array.dropFirst(2))
print(array)

//Удаление последних элементов, можем указать количество элементов не воздействуя на сам массив
print(array.dropLast(2))
print(array)

//УДаление элементов по фильтру, например элемент - огонь
array.removeAll {i in i == "fire"}
print(array)
