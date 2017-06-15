//
//  LAContext.swift
//  CorporationExample
//
//  Created by Fernando Moya De Rivas on 13/6/17.
//  Copyright © 2017 Fernando Moya De Rivas. All rights reserved.
//

import LocalAuthentication
extension LAContext {
    func hasTouchID() -> Bool {
        if #available(iOS 8.0, *) {
            var error: NSError?
            let hasTouchID = LAContext().canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: &error)
            
            if (hasTouchID || (error?.code != LAError.touchIDNotAvailable.rawValue)) {
                return false
            }
        }
        return true
    }
}
