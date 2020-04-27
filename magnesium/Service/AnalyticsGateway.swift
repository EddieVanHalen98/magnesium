//
//  AnalyticsGateway.swift
//  magnesium
//
//  Created by James Saeed on 28/04/2020.
//  Copyright © 2020 James Saeed. All rights reserved.
//

import Foundation
import Firebase

class AnalyticsGateway {
    
    static let shared = AnalyticsGateway()
    
    func logTapsTaken(_ amount: Int) {
        Analytics.logEvent("taps",
                           parameters: ["amount": amount])
    }
  
      func logBarcodeScan(_ successful: Bool) {
        Analytics.logEvent("barcodeScan",
                           parameters: ["successful": successful])
    }
  
      func logHealthKitImport(_ successful: Bool) {
        Analytics.logEvent("healthKitImports",
                           parameters: nil)
    }
}
