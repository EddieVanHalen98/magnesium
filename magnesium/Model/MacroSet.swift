//
//  Macro.swift
//  magnesium
//
//  Created by James Saeed on 04/12/2019.
//  Copyright © 2019 James Saeed. All rights reserved.
//

import Foundation
import Combine
import CoreData

struct MacroSet: Hashable {
    
    let calories: Double
    
    let carbs: Double
    let protein: Double
    let fat: Double
}

enum MealType: String {
    
    case breakfast, lunch, dinner, snacks
}

enum MacroType: String {
    
    case calories, carbs, protein, fat
}

struct UserMacroSet: Hashable {
    
    let identifier: String
    let foodTitle: String
    let meal: MealType
    let macros: MacroSet
    let dateAdded: Date
    
    init(for foodTitle: String, at meal: MealType, with macros: MacroSet) {
        self.identifier = UUID().uuidString
        self.foodTitle = foodTitle
        self.meal = meal
        self.macros = macros
        self.dateAdded = Date()
    }
    
    init(fromEntity entity: UserMacroSetEntity) {
        self.identifier = entity.identifier!
        self.foodTitle = entity.foodTitle!
        self.meal = MealType(rawValue: entity.meal!)!
        self.macros = MacroSet(calories: entity.calories,
                               carbs: entity.carbs,
                               protein: entity.protein,
                               fat: entity.fat)
        self.dateAdded = entity.dateAdded!
    }
    
    @discardableResult
    func getEntity(context: NSManagedObjectContext) -> UserMacroSetEntity {
        let entity = UserMacroSetEntity(context: context)
        entity.identifier = identifier
        entity.foodTitle = foodTitle
        entity.meal = meal.rawValue
        
        entity.calories = macros.calories
        entity.carbs = macros.carbs
        entity.protein = macros.protein
        entity.fat = macros.fat
        
        entity.dateAdded = dateAdded
        
        return entity
    }
}

class UserMacroSetStore: ObservableObject {
    
    @Published var userMacroSets = [UserMacroSet]()
    
    init() {
        loadStoredUserMacroSets()
    }
    
    func loadStoredUserMacroSets() {
//        DispatchQueue.global(qos: .userInteractive).async {
            let storedUserMacroSets: [UserMacroSet] = DataGateway.shared.getUserMacroSetEntities().map { entity in
                return UserMacroSet(fromEntity: entity)
            }.filter { userMacroSet in Calendar.current.isDateInToday(userMacroSet.dateAdded) }
            
            DispatchQueue.main.async { self.userMacroSets = storedUserMacroSets }
//        }
    }
    
    func addUserMacroSet(_ userMacroSet: UserMacroSet) {
        userMacroSets.append(userMacroSet)
        DataGateway.shared.saveUserMacroSet(userMacroSet: userMacroSet)
    }
}
