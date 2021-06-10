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
 
    init(ObemDvig: Double, massa: Double, Cvet: String, Marka: String, StatusWindows: String, StatusDvig: Double, SpeedOnSto: Double, CusovStatus : kuzov, MGruza: Mgruza){
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
