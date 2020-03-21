//
//  UserProfile.swift
//  magnesium
//
//  Created by James Saeed on 07/03/2020.
//  Copyright © 2020 James Saeed. All rights reserved.
//

import Foundation
import CoreData

struct UserProfile {
    
    let sex: String
    let age: Int
    let height: Double
    let weight: Double
    let activityLevels: String
    let goal: String
    
    var caloriesGoal: Double {
        return (10 * weight) + (6.25 * height) + Double(5 * age) + (sex == "Male" ? 5 : -161) + (goal == "Gain" ? 500 : -500)
    }
    var proteinGoal: Double {
        return (caloriesGoal * 0.2) / 4
    }
    var carbsGoal: Double {
        return (caloriesGoal * 0.5) / 4
    }
    var fatGoal: Double {
        return (caloriesGoal * 0.3) / 9
    }
    
    init(sex: String, age: Int, height: Double, weight: Double, activityLevels: String, goal: String) {
        self.sex = sex
        self.age = age
        self.height = height
        self.weight = weight
        self.activityLevels = activityLevels
        self.goal = goal
    }
    
    init(fromEntity entity: UserProfileEntity) {
        self.sex = entity.sex!
        self.age = Int(entity.age)
        self.height = entity.height
        self.weight = entity.weight
        self.activityLevels = entity.activityLevels!
        self.goal = entity.goal!
    }
    
    @discardableResult
    func getEntity(context: NSManagedObjectContext) -> UserProfileEntity {
        let entity = UserProfileEntity(context: context)
        entity.sex = sex
        entity.age = Int64(age)
        entity.height = height
        entity.weight = weight
        entity.activityLevels = activityLevels
        entity.goal = goal
        
        return entity
    }
}
