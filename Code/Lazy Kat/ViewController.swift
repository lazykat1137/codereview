//
//  ViewController.swift
//  Lazy Kat
//
//  Created by Viral on 07/09/18.
//  Copyright © 2018 Lazy Kat. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet var namefield: SkyFloatingLabelTextField!
    @IBOutlet var emailField: SkyFloatingLabelTextField!
    @IBOutlet var mobileField: SkyFloatingLabelTextField!
    @IBOutlet var subjectField: SkyFloatingLabelTextField!
    @IBOutlet var messgageField: TLFloatLabelTextView!
    
    @IBOutlet var submitButton: TransitionButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //SET UP NAVIGATION BAR
        self.navigationController?.navigationBar.barTintColor = THEME_COLOR
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.white,
             NSAttributedString.Key.font: UIFont(name: FONT_MEDIUM_NAME, size: UIDevice.current.userInterfaceIdiom == .pad ? 22 : 18)!]
        
        //SET UP ALL UI
        self.setupUI()
    }
    
    func setupUI()
    {
        self.namefield.placeholder = NAME_FIELD
        self.emailField.placeholder = EMAIL_FIELD
        self.mobileField.placeholder = MOBILE_FIELD
        self.subjectField.placeholder = SUBJECT_FIELD
        self.messgageField.hint = MESSAGE_FIELD
        
        // Text View Setup
        
        self.messgageField.titleFont = UIDevice.current.userInterfaceIdiom == .pad ? UIFont.init(name: FONT_NAME, size: 14)! : UIFont.init(name: FONT_NAME, size: 12)!
        self.messgageField.font =  UIDevice.current.userInterfaceIdiom == .pad ? UIFont.init(name: FONT_NAME, size: 18)! : UIFont.init(name: FONT_NAME, size: 14)!
        self.messgageField.titleTextColour =  UIColor.gray
        self.messgageField.titleActiveTextColour =  ACCENT_COLOR
        
        //All Textfield Setup
        
        self.namefield.titleFont = UIDevice.current.userInterfaceIdiom == .pad ? UIFont.init(name: FONT_NAME, size: 14)! : UIFont.init(name: FONT_NAME, size: 12)!
        self.namefield.font = UIDevice.current.userInterfaceIdiom == .pad ? UIFont.init(name: FONT_NAME, size: 18)! : UIFont.init(name: FONT_NAME, size: 14)!
        self.namefield.titleColor = UIColor.gray
        self.namefield.lineColor = UIColor.gray
        self.namefield.selectedTitleColor = ACCENT_COLOR
        self.namefield.selectedLineColor = ACCENT_COLOR
        
        self.emailField.titleFont = UIDevice.current.userInterfaceIdiom == .pad ? UIFont.init(name: FONT_NAME, size: 14)! : UIFont.init(name: FONT_NAME, size: 12)!
        self.emailField.font = UIDevice.current.userInterfaceIdiom == .pad ? UIFont.init(name: FONT_NAME, size: 18)! : UIFont.init(name: FONT_NAME, size: 14)!
        self.emailField.titleColor = UIColor.gray
        self.emailField.lineColor = UIColor.gray
        self.emailField.selectedTitleColor = ACCENT_COLOR
        self.emailField.selectedLineColor = ACCENT_COLOR
        
        self.mobileField.titleFont = UIDevice.current.userInterfaceIdiom == .pad ? UIFont.init(name: FONT_NAME, size: 14)! : UIFont.init(name: FONT_NAME, size: 12)!
        self.mobileField.font = UIDevice.current.userInterfaceIdiom == .pad ? UIFont.init(name: FONT_NAME, size: 18)! : UIFont.init(name: FONT_NAME, size: 14)!
        self.mobileField.titleColor = UIColor.gray
        self.mobileField.lineColor = UIColor.gray
        self.mobileField.selectedTitleColor = ACCENT_COLOR
        self.mobileField.selectedLineColor = ACCENT_COLOR
        
        self.subjectField.titleFont = UIDevice.current.userInterfaceIdiom == .pad ? UIFont.init(name: FONT_NAME, size: 14)! : UIFont.init(name: FONT_NAME, size: 12)!
        self.subjectField.font = UIDevice.current.userInterfaceIdiom == .pad ? UIFont.init(name: FONT_NAME, size: 18)! : UIFont.init(name: FONT_NAME, size: 14)!
        self.subjectField.titleColor = UIColor.gray
        self.subjectField.lineColor = UIColor.gray
        self.subjectField.selectedTitleColor = ACCENT_COLOR
        self.subjectField.selectedLineColor = ACCENT_COLOR
        
        self.mobileField.delegate = self
        
        //Button Set Up
        
        self.submitButton.cornerRadius = UIDevice.current.userInterfaceIdiom == .pad ? 37.5 : 25
        self.submitButton.clipsToBounds = true
        self.submitButton.titleLabel?.font = UIDevice.current.userInterfaceIdiom == .pad ? UIFont.init(name: FONT_MEDIUM_NAME, size: 19)! : UIFont.init(name: FONT_MEDIUM_NAME, size: 15)!
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func enablesDisableComponents(isEnabled : Bool)
    {
        self.namefield.isEnabled = isEnabled
        self.emailField.isEnabled = isEnabled
        self.mobileField.isEnabled = isEnabled
        self.subjectField.isEnabled = isEnabled
        self.messgageField.isUserInteractionEnabled = isEnabled
    }
    
    func clearField()
    {
        self.namefield.text = ""
        self.emailField.text = ""
        self.mobileField.text = ""
        self.subjectField.text = ""
        self.messgageField.text = ""
    }
    
    // MARK: - Button Actions will be here

    @IBAction func submitButtonPress(_ sender: Any)
    {
        if (self.namefield.text?.isEmpty)!
        {
            // Name Field is empty
            self.showMessage(NAME_ERROR_MESSAGE, type: .warning)
        }
        else if (self.emailField.text?.isEmpty)!
        {
            // Email Field is empty
            self.showMessage(EMAIL_ERROR_MESSAGE, type: .warning)
        }
        else if !(Utils.isValidateEmailAddress(email: self.emailField.text!))
        {
            // Email Field is validate
            self.showMessage(EMAIL_VALID_ERROR_MESSAGE, type: .warning)
        }
        else if (self.mobileField.text?.isEmpty)!
        {
            // Mobile No Field is empty
            self.showMessage(MOBILE_ERROR_MESSAGE, type: .warning)
        }
        else if (self.subjectField.text?.isEmpty)!
        {
            // Subject Field is empty
            self.showMessage(SUBJECT_ERROR_MESSAGE, type: .warning)
        }
        else if (self.messgageField.text?.isEmpty)!
        {
            // Message Field is empty
            self.showMessage(MESSAGE_ERROR_MESSAGE, type: .warning)
        }
        else
        {
            //Check Internet Connection
            
            self.view.endEditing(true)
            self.enablesDisableComponents(isEnabled: false)
            self.submitButton.startAnimation()
            
            if Reachability.isConnectedToNetwork()
            {
                //Make Service Call Here...
                
                let parameters = [
                    "name": self.namefield.text!,
                    "email":self.emailField.text!,
                    "mobile":self.mobileField.text!,
                    "subject":self.subjectField.text!,
                    "remarks":self.messgageField.text!,
                    ]
                
                WebServiceGeneral.requestPOSTURLEncoding(.inquiry, params: parameters, success: { response in
                    print(response["status"].intValue)
                    print(response["msg"].stringValue)
                    
                    if response["status"].intValue == 1
                    {
                        self.enablesDisableComponents(isEnabled: true)
                        self.submitButton.stopAnimation()
                        self.clearField()
                        self.showMessage(response["msg"].stringValue, type: .success)
                    }
                    else
                    {
                        self.enablesDisableComponents(isEnabled: true)
                        self.submitButton.stopAnimation()
                        self.showMessage(response["msg"].stringValue, type: .error)
                    }
                   
                }, failure: {error in
                    
                    print(error)
                    self.enablesDisableComponents(isEnabled: true)
                    self.submitButton.stopAnimation()
                    self.showMessage(SOMETHING_WENT_ERROR_MESSAGE, type: .error)
                })
            }
            else
            {
                // No Internet Alert
                self.enablesDisableComponents(isEnabled: true)
                self.showMessage(INTERNET_ERROR_MESSAGE, type: .error)
            }
         }
    }
    
    // MARK: - TextField Delegates Methods
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        let currentString: NSString = textField.text! as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet) && newString.length <= phoneNoLimit
    }
    
}

