//
//  ConstantStrings.swift
//  Lazy Kat
//
//  Created by Viral on 07/09/18.
//  Copyright © 2018 Lazy Kat. All rights reserved.
//

import Foundation
import UIKit

//All General

let freeLimit : Int! = 200
let phoneNoLimit : Int! = 10

let memoryMessage = "Your iPhone is running low on storage.So Lazykat can continue to work properly, free up " + "\(String(describing: freeLimit))" + "MB of space."
let memoryTitle = "Storage Almost Full"

let email_Regex = "^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$"

//ALL SERVICE CONSTANSTS

let BASE_URL = "http://lazykat.000webhostapp.com/"

//Internet Error Message

let INTERNET_ERROR_MESSAGE = "No Internet Available"
let SOMETHING_WENT_ERROR_MESSAGE = "Something Went Wrong"

//Inquiry View

let NAME_FIELD = "Name*"
let EMAIL_FIELD = "Email*"
let MOBILE_FIELD = "Mobile*"
let SUBJECT_FIELD = "Subject*"
let MESSAGE_FIELD = "Message*"

let NAME_ERROR_MESSAGE = "Enter your name"
let EMAIL_ERROR_MESSAGE = "Enter your email"
let EMAIL_VALID_ERROR_MESSAGE = "Enter valid email"
let MOBILE_ERROR_MESSAGE = "Enter your mobile no"
let SUBJECT_ERROR_MESSAGE = "Enter your subject"
let MESSAGE_ERROR_MESSAGE = "Enter your message"

