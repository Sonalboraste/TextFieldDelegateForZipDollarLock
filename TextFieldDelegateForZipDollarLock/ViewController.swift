//
//  ViewController.swift
//  TextFieldDelegateForZipDollarLock
//
//  Created by Mrunal Bhatt on 1/13/18.
//  Copyright © 2018 Sonal. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    //MARK: Textfield Delegate objects
    
    let zipCodeDelegate = ZipCodeTextFieldDelegate()
    let cashTextFieldDelegate = CashTextFieldDelegate()
    
    //MARK:Outlets
    
    @IBOutlet weak var textFieldZipCode: UITextField!
    
    @IBOutlet weak var textFieldCash: UITextField!
    
    @IBOutlet weak var textFieldLockable: UITextField!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //MARK: assign delegate to view
        
        textFieldZipCode.delegate = zipCodeDelegate
        textFieldZipCode.keyboardType = .numberPad
        
        textFieldCash.delegate = cashTextFieldDelegate
        textFieldCash.keyboardType = .decimalPad
        
    }
    
    @IBAction func onSwitchValueChanged(_ sender: Any)
    {
        if textFieldLockable.isEditing
        {
            textFieldLockable.isEnabled = false
        }
        else
        {
            textFieldLockable.isEnabled = true
        }
    }
    

}

