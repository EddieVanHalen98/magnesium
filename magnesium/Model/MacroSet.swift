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

struct Macros: Hashable {
    
    let calories: Double
    
    let carbs: Double
    let protein: Double
    let fat: Double
    
    func toDict() -> [MacroType: Double] {
        var dict = [MacroType: Double]()
        
        dict[.calories] = calories
        dict[.carbs] = carbs
        dict[.protein] = protein
        dict[.fat] = fat
        
        return dict
    }
}

enum MealType: String {
    
    case breakfast, lunch, dinner, snacks
}

enum MacroType: String {
    
    case calories, carbs, protein, fat
}

struct MacroSet: Hashable {
    
    let identifier: String
    let foodTitle: String
    let meal: MealType
    let macros: [MacroType: Double]
    let dateAdded: Date
    
    init(for foodTitle: String, at meal: MealType, with macros: Macros) {
        self.identifier = UUID().uuidString
        self.foodTitle = foodTitle
        self.meal = meal
        self.macros = macros.toDict()
        self.dateAdded = Date()
    }
    
    init(fromEntity entity: MacroSetEntity) {
        self.identifier = entity.identifier!
        self.foodTitle = entity.foodTitle!
        self.meal = MealType(rawValue: entity.meal!)!
        self.macros = Macros(calories: entity.calories,
                             carbs: entity.carbs,
                             protein: entity.protein,
                             fat: entity.fat).toDict()
        self.dateAdded = entity.dateAdded!
    }
    
    @discardableResult
    func getEntity(context: NSManagedObjectContext) -> MacroSetEntity {
        let entity = MacroSetEntity(context: context)
        entity.identifier = identifier
        entity.foodTitle = foodTitle
        entity.meal = meal.rawValue
        
        entity.calories = macros[.calories]!
        entity.carbs = macros[.carbs]!
        entity.protein = macros[.protein]!
        entity.fat = macros[.fat]!
        
        entity.dateAdded = dateAdded
        
        return entity
    }
}

class MacroSetStore: ObservableObject {
    
    @Published var macroSets = [MacroSet]()
    
    init() {
        loadStoredMacroSets()
    }
    
    func loadStoredMacroSets() {
//        DispatchQueue.global(qos: .userInteractive).async {
            let storedMacroSets: [MacroSet] = DataGateway.shared.getMacroSetEntities().map { entity in
                return MacroSet(fromEntity: entity)
            }.filter { macroSet in Calendar.current.isDateInToday(macroSet.dateAdded) }
            
            DispatchQueue.main.async { self.macroSets = storedMacroSets }
//        }
    }
    
    func addMacroSet(_ macroSet: MacroSet) {
        macroSets.append(macroSet)
        DataGateway.shared.saveMacroSet(macroSet)
    }
}
