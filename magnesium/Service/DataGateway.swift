//
//  DataGateway.swift
//  magnesium
//
//  Created by James Saeed on 04/12/2019.
//  Copyright © 2019 James Saeed. All rights reserved.
//

import Foundation
import CoreData

class DataGateway {
    
    static let shared = DataGateway(NSManagedObjectContext.current)
    
    var managedObjectContext: NSManagedObjectContext
    
    init(_ managedObjectContext: NSManagedObjectContext) {
        self.managedObjectContext = managedObjectContext
    }
}

// MARK: - User Profile

extension DataGateway {
    
    func getUserProfile() -> UserProfileEntity? {
        let request: NSFetchRequest<UserProfileEntity> = UserProfileEntity.fetchRequest()
        
        do {
            let userProfiles = try self.managedObjectContext.fetch(request)
            return userProfiles.first
        } catch {
            print("error")
        }
        
        return nil
    }
    
    func saveUserProfile(_ userProfile: UserProfile) {
        userProfile.getEntity(context: self.managedObjectContext)
        
        do {
            try self.managedObjectContext.save()
        } catch {
            print("error")
        }
    }
}

// MARK: - User Macros

extension DataGateway {
    
    func getMacroSetEntities() -> [MacroSetEntity] {
        var macroSets = [MacroSetEntity]()
        let request: NSFetchRequest<MacroSetEntity> = MacroSetEntity.fetchRequest()
        
        do {
            macroSets = try self.managedObjectContext.fetch(request)
        } catch {
            print("error")
        }
        
        return macroSets
    }
    
    func saveMacroSet(_ macroSet: MacroSet) {
        macroSet.getEntity(context: self.managedObjectContext)
        
        do {
            try self.managedObjectContext.save()
        } catch {
            print("error")
        }
    }
    
    func deleteMacroSet(_ macroSet: MacroSet) {
        for entity in getMacroSetEntities() {
            guard let identifier = entity.identifier else {
                continue
            }
            
            if macroSet.identifier == identifier {
                managedObjectContext.delete(entity)
                
                do {
                    try managedObjectContext.save()
                } catch {
                    print("error")
                }
                
                return
            }
        }
    }
}
