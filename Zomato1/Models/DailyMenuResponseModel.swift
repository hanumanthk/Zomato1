//
//  SayHelloResponse.swift
//  Zomato1
//
//  Created by iOS Training on 12/15/18.
//  Copyright © 2018 iOS Training. All rights reserved.
//

import Foundation

struct DailyMenuResponseModel: Decodable {
    var dailyMenus: [Dailymenu] = [Dailymenu]()
    
    
    var status: String = ""
}

struct Dailymenu: Decodable {
    var daily_menu_id: String = ""
    var start_date: String = ""
    var name: String = ""
    var dishes:[Dish] = [Dish]()
    
}

struct Dish: Decodable {
    var dish_id: String = ""
    var name: String = ""
    var price: String = ""
    
}

