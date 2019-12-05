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

// MARK: - User Macros

extension DataGateway {
    
    func getUserMacroSetEntities() -> [UserMacroSetEntity] {
        var userMacroSets = [UserMacroSetEntity]()
        let request: NSFetchRequest<UserMacroSetEntity> = UserMacroSetEntity.fetchRequest()
        
        do {
            userMacroSets = try self.managedObjectContext.fetch(request)
        } catch {
            print("error")
        }
        
        return userMacroSets
    }
    
    func saveUserMacroSet(userMacroSet: UserMacroSet) {
        userMacroSet.getEntity(context: self.managedObjectContext)
        
        do {
            try self.managedObjectContext.save()
        } catch {
            print("error")
        }
    }
    
    func deleteUserMacroSet(userMacroSet: UserMacroSet) {
        for entity in getUserMacroSetEntities() {
            guard let identifier = entity.identifier else {
                continue
            }
            
            if userMacroSet.identifier == identifier {
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
