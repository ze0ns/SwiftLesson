import UIKit

enum ProgramError: Error {
    case maxMessageLimit
    case noWiFi
    case serverError(error: Int)
}

struct email {
    var Subject: String
    var size: Int
    var Body: String
    var attachment: Bool
}

class emailClient{
    //Наши сообщения на сервере
    var inboundMessage = [
        "m001.eml": email(Subject: "Привет", size: 300,Body: "Привет, как дела, давно не виделись", attachment: false),
        "m002.eml": email(Subject: "Распродажа", size: 12000,Body: "Только сегодня. Распродажа в нашем магазине", attachment: true),
        "m003.eml": email(Subject: "Семинар по теме - Программирование на SWIFT", size: 200,Body: "ПРиглашаем Вас на семинар...", attachment: false),
        "m004.eml": email(Subject: "Срочный отчёь", size: 19000,Body: "Переделай мне отчет, Отчет во вложении", attachment: true),
    ]
    
    var maxMessageSize = 10240
    var errorValue = 500
    
    //Метод для скачивание сообщений
    func downloadMessage(itemNamed name: String, error: Int) throws{
        guard let email = inboundMessage[name] else {
            throw ProgramError.noWiFi
        }
        guard email.size < maxMessageSize else {
            throw ProgramError.maxMessageLimit
        }
        guard error == 200 else {
            throw ProgramError.serverError(error: errorValue)
        }
        print("Сообщение \(email.Subject) была загружено")
    }
}
let UICollection = [
    "TableView": "m001.eml",
    "TabBar": "m002.eml",
    "CollectionView": "m003.eml"
]

func downloadMessage(element: String, funcDownload: emailClient) throws{
    let serverMessage = 404
    let collectionView = UICollection[element] ?? "LoadScreen"
    try funcDownload.downloadMessage(itemNamed: collectionView, error: serverMessage)
}

do {
    try downloadMessage(element: "TableView", funcDownload: emailClient())
} catch ProgramError.noWiFi{
     print("Нет подключения к WiFi")
} catch ProgramError.maxMessageLimit{
     print("Слишком большое сообщение")
} catch ProgramError.serverError(let errorCode){
    print("Ошибка сервера \(errorCode)")
}
