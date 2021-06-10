import UIKit

protocol car{
   
    var ObemDvig: Double {get set}
    var massa: Double {get set}
    var Cvet: String {get set}
    var Marka: String {get set}
    var StatusWindows: String {get set}
    var StatusDvig: Double {get set}
    
    func runDvig(action: Int) -> Bool
    
}

extension car {

    mutating func windows(action: String) -> (){
        switch action {
        case "up"  : self.StatusWindows = "up"
        case "down": self.StatusWindows = "down"
        default:
           self.StatusWindows = "up"
        }
    }
    mutating func actionDvig(action: Double) -> (){
        switch action {
        case 1  : self.StatusDvig = 1
        case 0  : self.StatusDvig = 0
        default:
           self.StatusDvig = 0
        }
    }
}


// Класс спортивные автомобили
class sportCar: car{
       var ObemDvig: Double
       var massa: Double
       var Cvet: String
       var Marka: String
       var StatusWindows: String
       var StatusDvig: Double
       var SpeedOnSto: Double
       var StatusForsage: StatusF = .off
    
    enum  StatusF: String{
         case on      = "Включен"
         case off     = "Выключен"

     }
    
    func runDvig(action: Int) -> Bool {
        switch action {
               case  0:
                   self.StatusDvig = 0
                    return false
               case  1:
                   self.StatusDvig = 1
                    return true
        default:
              self.StatusForsage = .off
              return false
        }
        
    }
 
    init(ObemDvig: Double, massa: Double, Cvet: String, Marka: String, StatusWindows: String, StatusDvig: Double, SpeedOnSto: Double){
        self.ObemDvig = ObemDvig
        self.massa = massa
        self.Cvet = Cvet
        self.Marka = Marka
        self.StatusWindows = StatusWindows
        self.StatusDvig = StatusDvig
        self.SpeedOnSto = SpeedOnSto
       }

}


// Класс Грузовые автомобили
class trunkCar: car{
       var ObemDvig: Double
       var massa: Double
       var Cvet: String
       var Marka: String
       var StatusWindows: String
       var StatusDvig: Double
       var CusovStatus : kuzov
       var MGruza : Mgruza
    
        enum kuzov {
        case pustKuz(empty: String)
        case pustKuz(full: String)
        case chasttKuz(kg: Double)
    }
    //Грузоподъемность
    enum  Mgruza{
        case Kuz(tonn: Double)
        case KuzIPricep(Kuzov: Double, Pricep: Double)

    }
    func runDvig(action: Int) -> Bool {
        switch action {
               case  0:
                   self.StatusDvig = 1
                    return false
               case  1:
                   self.StatusDvig = 0
                    return true
        default:
              self.StatusDvig = 0
              return false
        }
    enum actionKuzov{
        case unload
        case upload
    }
    
    //Методы класса
    func unloadKuzov(action: actionKuzov){
        switch action {
        case  .unload:
            self.CusovStatus = .pustKuz(empty:"Разгрузили")
        case .upload:
            self.CusovStatus = .pustKuz(full: "Погрузили")
        }
    }
        
    }
 
    init(ObemDvig: Double, massa: Double, Cvet: String, Marka: String, StatusWindows: String, StatusDvig: Double, CusovStatus : kuzov, MGruza: Mgruza){
        self.ObemDvig = ObemDvig
        self.massa = massa
        self.Cvet = Cvet
        self.Marka = Marka
        self.StatusWindows = StatusWindows
        self.StatusDvig = StatusDvig
        self.CusovStatus = CusovStatus
        self.MGruza = MGruza
       }

}

extension trunkCar
{
     func decription(){
            print("Атомобиль марки \(Marka) \(Cvet) цвета, Грузоподъемностью \(MGruza), В данный моент имеет статус кузова \(CusovStatus)")
            }
}

extension sportCar{
    func decription(){
        print("Атомобиль марки \(Marka) \(Cvet) цвета. Разгоняется до 100 км/ч за \(SpeedOnSto) сек. ")
        }
}


var car1 = sportCar(ObemDvig: 2.3, massa: 2000, Cvet: "Red", Marka: "BMV", StatusWindows: "up", StatusDvig: 0, SpeedOnSto: 4)

var car2 = trunkCar(ObemDvig: 4, massa: 40000, Cvet: "Blue", Marka: "Audi", StatusWindows: "down", StatusDvig: 1, CusovStatus: .pustKuz(empty: "Пустой"), MGruza: .Kuz(tonn: 20))


car1.runDvig(action: 0)
car2.actionDvig(action: 1)


car1.decription()
car2.decription()
