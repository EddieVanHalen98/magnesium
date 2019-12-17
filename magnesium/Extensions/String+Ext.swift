//
//  String+Ext.swift
//  magnesium
//
//  Created by James Saeed on 17/12/2019.
//  Copyright © 2019 James Saeed. All rights reserved.
//

import Foundation

extension String {
    
    var units: String {
        if self == "calories" {
            return "kcal"
        } else if self == "carbs" || self == "protein" || self == "fat" {
            return "g"
        } else {
            return ""
        }
    }
}
