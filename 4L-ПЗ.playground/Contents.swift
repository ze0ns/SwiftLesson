import UIKit

class Car {
    //Общие свойства: Объем двигателя, Масса машины, Цвет, Марка машины, Количество дверей
    var ObemDvig: Double
    var massa: Double
    var Cvet: carColor
    var Marka: String
    var KDV: KolDverei
    var SDvig: StatusDvigatel = .off
    var action: actionEngine?
    
    //Количество дверей
    enum KolDverei: String{
        case two = "две двери"
        case three = "три двери"
        case four = "детыре двери"
        case five = "пять дверей"
    }
    //Цвет автомобиля
    enum  carColor: String{
        case Black = "Черного"
        case White = "Белого"
    }
    //Статус двигателя
    enum StatusDvigatel: String{
        case on = "Заведен"
        case off = "Заглушен"
    }
    
    //Действие с двигателем
    enum actionEngine: String{
        case start
        case turnOff
    }

    //Вывод информации
    func decription(){
        print("Атомобиль марки \(Marka) \(Cvet.rawValue) цвета, имеет массу \(massa) и объем двигателя \(ObemDvig). Имеет \(KDV.rawValue). В данный момент двигатель - \(SDvig.rawValue) ")
        }
    
    func runDvig(action: actionEngine){
        switch action {
            case .start:
                self.SDvig = .on
            case .turnOff:
                self.SDvig = .off
        }
    }
    //Инициализация свойств
    init(Marka: String, carColor: carColor, massa: Double, ObemDvig: Double, KolDverei: KolDverei, StatusDvigatel: StatusDvigatel){
        self.ObemDvig = ObemDvig
        self.massa = massa
        self.Cvet = carColor
        self.Marka = Marka
        self.KDV = KolDverei
        self.SDvig = StatusDvigatel
       }

    init(Marka: String, carColor: carColor, massa: Double, ObemDvig: Double, KolDverei: KolDverei, StatusDvigatel: StatusDvigatel, actions: actionEngine){
            self.ObemDvig = ObemDvig
            self.massa = massa
            self.Cvet = carColor
            self.Marka = Marka
            self.KDV = KolDverei
            self.SDvig = StatusDvigatel
            self.action = actions
            self.runDvig(action: actions)
        }
}
//Класс спортивных автомобилей
class sportCar: Car {
    //Добавим свойства для спортивных автомобилей: Материал кузова, Тип коробки, Скорость разгона до 100км/ч
    var mCusov : bodyMatterial
    var korobka : transmissoin
    var SpeedOnSto: Double
    var StatusForsage: StatusF
    

    // Материал кузова
    enum  bodyMatterial: String{
        case carbon     = "Карбон"
        case steel      = "Сталь"
        case alluinium  = "Алюминий"

    }

    //Тип коробки
    enum  transmissoin: String{
        case auto       = "Автомат"
        case manual     = "Ручная"

    }
    enum  StatusF: String{
        case on      = "Включен"
        case off     = "Выключен"

    }
    
    //Действия с форсажем
    func runForce(action: StatusF){
        switch action {
        case  .off:
            self.StatusForsage = .off
        case .on:
            self.StatusForsage = .on
        }
    }
    
    override func decription(){
        print("Атомобиль марки \(Marka) \(Cvet.rawValue) цвета, с материалом кузова - \(mCusov.rawValue). Разгоняется до 100 км/ч за \(SpeedOnSto) сек. ")
        }
    
    init(Marka: String, carColor: carColor, massa: Double, ObemDvig: Double, KolDverei: KolDverei, StatusDvigatel: StatusDvigatel, materialCusov: bodyMatterial, TypeTransmition: transmissoin,SOnSt: Double, StForce: StatusF) {
        self.mCusov = materialCusov
        self.korobka = TypeTransmition
        self.SpeedOnSto = SOnSt
        self.StatusForsage = StForce

    //Обращение к родительскому инициализатору
    super.init(Marka: Marka, carColor: carColor, massa: massa, ObemDvig: ObemDvig, KolDverei: KolDverei, StatusDvigatel: StatusDvigatel)
    }


}

//Класс грузовых автомобилей
class trunkCar: Car {
    //Добавим свойства для грузовых автомобилей: Материал кузова, Тип коробки, Скорость разгона до 100км/ч
    var CusovStatus : kuzov
    var MGruza : Mgruza


    //Загруженность кузова
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
        
    override func decription(){
            print("Атомобиль марки \(Marka) \(Cvet.rawValue) цвета, Грузоподъемностью \(MGruza), В данный моент имеет статус кузова \(CusovStatus)")
            }
        
        
    
    init(Marka: String, carColor: carColor, massa: Double, ObemDvig: Double, KolDverei: KolDverei, StatusDvigatel: StatusDvigatel, CusovSt: kuzov, MGruza: Mgruza) {
        self.CusovStatus = CusovSt
        self.MGruza = MGruza

        super.init(Marka: Marka, carColor: carColor, massa: massa, ObemDvig: ObemDvig, KolDverei: KolDverei, StatusDvigatel: StatusDvigatel)
    }


}


//Обычный автомобиль
var car1 = Car(Marka: "Жигули", carColor: .Black, massa: 1200, ObemDvig: 1, KolDverei:.four, StatusDvigatel: .off)
car1.decription()
//Запускаем двигатель
car1.runDvig(action: .start)
//проверяем статус двигателя
print(car1.SDvig.rawValue)


//Спортивный автомобиль
var car2 = sportCar(Marka: "Ferrari", carColor: .Black, massa: 1200, ObemDvig: 5, KolDverei: .two, StatusDvigatel: .on, materialCusov: .carbon, TypeTransmition: .auto, SOnSt: 4,StForce: .off)
car2.decription()
//Проверяем статус форсажа
print(car2.StatusForsage.rawValue)
//Запускаем форсаж
car2.runForce(action: .on)
//Проверяем статус форсажа
print(car2.StatusForsage.rawValue)

//Грузовой автомобиль
var car3 = trunkCar(Marka: "MAZ", carColor: .Black, massa: 20000, ObemDvig: 10, KolDverei: .two, StatusDvigatel: .off, CusovSt: .chasttKuz(kg: 10000), MGruza: .KuzIPricep(Kuzov: 5000, Pricep: 5000))
//Вагружаем все из кузова
car3.decription()
car3.unloadKuzov(action: .unload)
//Проверяем статус кузова
print(car3.CusovStatus)

