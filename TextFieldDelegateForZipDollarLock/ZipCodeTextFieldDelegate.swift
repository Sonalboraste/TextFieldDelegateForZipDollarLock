//
//  ZipCodeTextFieldDelegate.swift
//  TextFieldDelegateForZipDollarLock
//
//  Created by Mrunal Bhatt on 1/13/18.
//  Copyright © 2018 Sonal. All rights reserved.
//

import Foundation
import UIKit

class ZipCodeTextFieldDelegate: NSObject,UITextFieldDelegate
{
    let MAXTEXTFIELDLENGTH = 5
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {       
        
        //get the text from text field
        var textFieldText = textField.text! as NSString
        textFieldText = textFieldText.replacingCharacters(in: range, with: string) as NSString
        
        var isDigit = false
        
        if textFieldText.length <= MAXTEXTFIELDLENGTH
        {
            let allowedCharachters = CharacterSet.decimalDigits
            let characterSet = CharacterSet(charactersIn: textFieldText as String)
            isDigit = allowedCharachters.isSuperset(of: characterSet)
        }
        
        
        return isDigit
    }
    
}
