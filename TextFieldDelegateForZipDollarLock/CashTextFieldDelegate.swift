//
//  CashTextFieldDelegate.swift
//  TextFieldDelegateForZipDollarLock
//
//  Created by Mrunal Bhatt on 1/17/18.
//  Copyright © 2018 Sonal. All rights reserved.
//

import Foundation
import UIKit

class CashTextFieldDelegate: NSObject, UITextFieldDelegate
{
    let maxDigits = 12
    var previousValue : String = ""
    
    
    let currencyFormattor = NumberFormatter()
    
    
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        textField.text = "$0.00"
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        
        currencyFormattor.numberStyle = .currency
        currencyFormattor.minimumFractionDigits = 2
        currencyFormattor.maximumFractionDigits = 2
        
        let cleanNumericString : String = getCleanNumberString(textFromTextField: textField.text! as String)
                
        if cleanNumericString.characters.count > maxDigits
        {
            textField.text = previousValue
        }
        else
        {
            let textFieldNumber = Double(cleanNumericString)
            
            if let textFieldNumber = textFieldNumber
            {
                let textFieldNewValue = textFieldNumber/100
                textField.text = setAmount(textFieldNewValue, textFromTextField: textField.text! as String)
            }
            else
            {
                textField.text = previousValue
            }
        }

        return true
    }
    
    func setAmount (_ amount : Double, textFromTextField : String) -> String
    {
        let textFieldStringValue = currencyFormattor.string(from: NSNumber(value: amount))
        
        if let textFieldStringValue = textFieldStringValue
        {
            previousValue = textFieldStringValue
        }
        
        return textFieldStringValue!
    }
    
    
    func getCleanNumberString(textFromTextField : String) -> String
    {
        var cleanNumericString: String = ""
        let textFieldString = textFromTextField
        
        
        //Remove $ sign
        var toArray = textFieldString.components(separatedBy: "$")
        cleanNumericString = toArray.joined(separator: "")
            
        //Remove periods, commas
        toArray = cleanNumericString.components(separatedBy: CharacterSet.punctuationCharacters)
        cleanNumericString = toArray.joined(separator: "")
        
        
        return cleanNumericString
    }
    
}
