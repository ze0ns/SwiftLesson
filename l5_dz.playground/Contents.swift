import UIKit

protocol car{
   
    var ObemDvig: Double {get}
    var massa: Double {get}
    var Cvet: String {get}
    var Marka: String {get}
    var StatusDvig: String {get set}
    
    func runDvig() -> Bool
}

extension actionCar {
    enum actionWindow: String{
        case up   = "Поднять"
        case down = "Опустить"
    }
    func windows(action: actionWindow) -> (){
        switch action {
        case .up: self.StatusDvig
        
        }
    }
}
