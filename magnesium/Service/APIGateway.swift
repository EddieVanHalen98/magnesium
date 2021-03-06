//
//  APIGateway.swift
//  magnesium
//
//  Created by James Saeed on 26/12/2019.
//  Copyright © 2019 James Saeed. All rights reserved.
//

import Foundation

class APIGateway {
    
    static let shared = APIGateway()
    
    let baseURL = "https://api.edamam.com/api/food-database"
    let appId = "c0498bb3"
    let appKey = "025d1ad807e0dc0cc9402bdb039a1347"
    
    let customURL = "http://192.168.0.183:3000"
    
    private func get(endpoint: String, completion: @escaping (Data?) -> ()) {
        let url = URL(string: "\(baseURL)\(endpoint)&app_id=\(appId)&app_key=\(appKey)")!
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            completion(data)
        }.resume()
    }
    
    private func getCustom(endpoint: String, completion: @escaping (Data?) -> ()) {
        let url = URL(string: "\(customURL)\(endpoint)")!
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            completion(data)
        }.resume()
    }
}

extension APIGateway {
    
    func search(query: String, completion: @escaping ([FoodItem]?) -> ()) {
        get(endpoint: "/parser?ingr=\(query.addingPercentEncoding(withAllowedCharacters: .alphanumerics)!)") { data in
            let jsonFoodItems = try! JSONDecoder().decode(JSONFoodItems.self, from: data!)
            let foodItems = jsonFoodItems.parsed
                .map { $0.foodItem }
                .filter { $0.nutrients.allExist() }
            
            DispatchQueue.main.async { completion(foodItems) }
        }
    }
    
    func search(barcode: String, completion: @escaping (FoodItem?) -> ()) {
        getCustom(endpoint: "/\(barcode)") { data in
            let foodItem = try! JSONDecoder().decode(FoodItem.self, from: data!)
            
            DispatchQueue.main.async { completion(foodItem) }
        }
    }
}
