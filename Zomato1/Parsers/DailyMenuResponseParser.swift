//
//  DailyMenuResponseParser.swift
//  Zomato1
//
//  Created by iOS Training on 12/18/18.
//  Copyright © 2018 iOS Training. All rights reserved.
//

import Foundation
struct ZomatoParsers {
    static func parserDailyMenuResponse(withData data: Data) -> DailyMenuResponseModel? {
        let decoderObject = JSONDecoder.init()
        do {
            let zomatoResponse = try decoderObject.decode(DailyMenuResponseModel.self, from: data)
            return zomatoResponse
        } catch (let error) {
            print(("unable to parse the data with error \(error)"))
        }
        return nil
    }
    
}

struct ZomatoParsersManully {
    static func parserDailyResponseManully(withData data: Data) -> DailyMenuResponseModel? {
        do {
            let dataDictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            print(" response data dictionary -- \(dataDictionary)")
            var responseZomato = DailyMenuResponseModel()
            if let dictResponseData = dataDictionary as? [String: Any] {
                responseZomato.status = dictResponseData["status"] as! String
                if let arrayDailyMenu = dictResponseData["daily_menus"] as? [[String: Any]] {
                    for dictMenu in arrayDailyMenu {
                        var dailyMenuObject = Dailymenu()
                        if let dictDailyMenu = dictMenu["daily_menu"] as? [String: Any] {
                            dailyMenuObject.daily_menu_id = dictDailyMenu["daily_menu_id"] as! String
                            dailyMenuObject.start_date = dictDailyMenu["start_date"] as! String
                            dailyMenuObject.name = dictDailyMenu["name"] as! String
                            if let arrayDishes = dictDailyMenu["dishes"] as? [[String: Any]] {
                                for dictDish in arrayDishes{
                                    if let dictDishObject = dictDish["dish"] as? [String: Any] {
                                        var dishModelObject = Dish()
                                        dishModelObject.dish_id = dictDishObject["dish_id"] as! String
                                        dishModelObject.name = dictDishObject["name"] as! String
                                        dishModelObject.price = dictDishObject["price"] as! String
                                        
                                        dailyMenuObject.dishes.append(dishModelObject)
                                        
                                    }
                                    
                                    
                                }
                            }
                            
                        }
                        responseZomato.dailyMenus.append(dailyMenuObject)
                    }
                    
                }
                return responseZomato
            }
        } catch (let jsonError) {
            print("failed to parse \(jsonError)")
        }
        return nil
    }
}

