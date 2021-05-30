//
//  Airports.swift
//  lowcosttrip
//
//  Created by Admin on 30.05.2021.
//

import Foundation

struct Airport {
    
    var name: String
    var shortname: String
    var route: [String]?
}

let airports = [
    Airport(name: "Москва - Домодедово", shortname: "DME", route:["Аэроэкспресс", "Такси", "Электричка", "Маршрутка"]),
    Airport(name: "Москва - Шереметьево", shortname: "SVO", route:["Аэроэкспресс", "Такси", "Маршрутка"]),
    Airport(name: "Москва - Внуково", shortname: "VKO", route:["Аэроэкспресс", "Такси", "Метро", "Маршрутка"]),
    Airport(name: "Москва - Жуковский", shortname: "ZIA", route:["Такси", "Метро", "Маршрутка"]),
    Airport(name: "Санкт-Петербург - Пулково", shortname: "LED", route:["Такси", "Метро", "Маршрутка", "Каршеринг"]),
    Airport(name: "Адлер (Сочи)", shortname: "AER", route:["Такси", "Маршрутка", "Каршеринг"]),
    Airport(name: "Воронеж", shortname: "VOZ", route:["Такси", "Маршрутка"]),
    Airport(name: "Ростов-на-Дону", shortname: "RVI"),
    Airport(name: "Минск", shortname: "MSQ"),
    Airport(name: "Париж — Шарль-де-Голль", shortname: "CDG"),
    Airport(name: "Киев", shortname: "IEV"),
    Airport(name: "Лондон - Хитроу", shortname: "LHR"),
    Airport(name: "Мадрид", shortname: "MAD"),
    Airport(name: "Рим", shortname: "FCO")
]
