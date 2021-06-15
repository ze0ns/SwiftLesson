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
