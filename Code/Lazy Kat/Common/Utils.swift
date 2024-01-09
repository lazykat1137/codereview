//
//  Utils.swift
//  Lazy Kat
//
//  Created by Viral on 07/09/18.
//  Copyright © 2018 Lazy Kat. All rights reserved.
//

import UIKit

class Utils: NSObject {
        
    static func isValidateEmailAddress(email : String) -> Bool
    {
        let emailRegEx = email_Regex
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }

}
