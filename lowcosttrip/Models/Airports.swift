//
//  Airports.swift
//  lowcosttrip
//
//  Created by Admin on 30.05.2021.
//

import Foundation
import MapKit

struct Airport {

    var name: String
    var shortname: String
    var route: [String]?
    var lat: CLLocationDegrees
    var long: CLLocationDegrees
}

let airports = [
    Airport(name: "Москва - Домодедово", shortname: "DME", route:["Аэроэкспресс", "Такси", "Электричка", "Маршрутка"], lat: 55.416006, long: 37.897951),
    Airport(name: "Москва - Шереметьево", shortname: "SVO", route:["Аэроэкспресс", "Такси", "Маршрутка"], lat: 55.972778, long: 37.414722),
    Airport(name: "Москва - Внуково", shortname: "VKO", route:["Аэроэкспресс", "Такси", "Метро", "Маршрутка"], lat: 55.6058121, long: 37.2882462),
    Airport(name: "Москва - Жуковский", shortname: "ZIA", route:["Такси", "Метро", "Маршрутка"], lat: 55.5614395, long: 38.1181793),
    Airport(name: "Санкт-Петербург - Пулково", shortname: "LED", route:["Такси", "Метро", "Маршрутка", "Каршеринг"], lat: 59.939039, long: 30.315785),
    Airport(name: "Адлер (Сочи)", shortname: "AER", route:["Такси", "Маршрутка", "Каршеринг"], lat: 43.450000, long: 39.960000),
    Airport(name: "Воронеж", shortname: "VOZ", route:["Такси", "Маршрутка"], lat: 51.810000, long: 39.23000),
    Airport(name: "Ростов-на-Дону", shortname: "ROV", lat: 47.260000, long: 39.820000),
    Airport(name: "Минск", shortname: "MSQ", lat: 53.900000, long: 27.566666),
    Airport(name: "Париж — Шарль-де-Голль", shortname: "CDG", lat:  49.009722, long: 2.547778),
    Airport(name: "Киев", shortname: "IEV", lat: 50.401943, long: 30.450832),
    Airport(name: "Лондон - Хитроу", shortname: "LHR", lat: 51.480000, long: -0.460000),
    Airport(name: "Мадрид", shortname: "MAD", lat: 40.490000, long: -3.570000),
    Airport(name: "Рим", shortname: "FCO", lat: 41.800000, long: 12.250000)
]
