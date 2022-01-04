//
//  PinViewController.swift
//  CryptoExchange
//
//  Created by Shwait Kumar on 02/01/22.
//

import UIKit

class PinViewController : BaseUIViewController {
    
    @IBOutlet weak var tfPin1: UITextField!
    @IBOutlet weak var tfPin2: UITextField!
    @IBOutlet weak var tfPin3: UITextField!
    @IBOutlet weak var tfPin4: UITextField!
    
    @IBOutlet weak var btnForgotPin: UIButton!
    @IBOutlet weak var btnContinue: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tfPin1.keyboardType = .numberPad
        tfPin2.keyboardType = .numberPad
        tfPin3.keyboardType = .numberPad
        tfPin4.keyboardType = .numberPad
        
        tfPin1.delegate = self
        tfPin2.delegate = self
        tfPin3.delegate = self
        tfPin4.delegate = self
        
        btnContinue.isEnabled = false
        btnContinue.backgroundColor = UIColor(named: "redPop")
        
        setButtonShadow(btn: btnContinue, shadowColor: "whitePop")
        setButtonShadow(btn: btnForgotPin, shadowColor: "whitePop")
        
        btnContinue.layer.cornerRadius = 8
        
    }
    
    @IBAction func btnForgotPin(_ sender: UIButton) {
    }
    
    @IBAction func btnContinue(_ sender: UIButton) {
        
        if(tfPin1.text == "" || tfPin2.text == "" || tfPin3.text == "" || tfPin4.text == "")
        {
            showAlert(Message: "Enter Valid Pin", Title: "Crypto Exchange")
        }
        else
        {
            let num1 = tfPin1?.text ?? ""
            let num2 = tfPin2?.text ?? ""
            let num3 = tfPin3?.text ?? ""
            let num4 = tfPin4?.text ?? ""
            let fullPin = num1 + num2 + num3 + num4
            
            if tfPin1.text == "0" && tfPin2.text == "0" && tfPin3.text == "0" && tfPin4.text == "0" {
                
                appDelegate.pushToHomeViewController()
                
            }
            else {
                showAlert(Message: "Invalid Pin", Title: "Crypto Exchange")
                tfPin1.text = ""
                tfPin2.text = ""
                tfPin3.text = ""
                tfPin4.text = ""
                tfPin1.becomeFirstResponder()
                btnContinue.isEnabled = false
                btnContinue.backgroundColor = UIColor(named: "redPop")
            }
            
        }
        
    }
    
}

extension PinViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if ((textField.text?.count)! < 1 ) && (string.count > 0) {
            if textField == tfPin1 {
                tfPin2.becomeFirstResponder()
                btnContinue.isEnabled = false
                btnContinue.backgroundColor = UIColor(named: "redPop")
            }
            if textField == tfPin2 {
                tfPin3.becomeFirstResponder()
                btnContinue.isEnabled = false
                btnContinue.backgroundColor = UIColor(named: "redPop")
            }
            if textField == tfPin3 {
                tfPin4.becomeFirstResponder()
                btnContinue.isEnabled = false
                btnContinue.backgroundColor = UIColor(named: "redPop")
            }
            if textField == tfPin4 {
                tfPin4.becomeFirstResponder()
                btnContinue.isEnabled = true
                btnContinue.backgroundColor = UIColor(named: "greenPop")
            }
            textField.text = string
            return false
            
        } else if ((textField.text?.count)! >= 1) && (string.count == 0) {
            if textField == tfPin1 {
                tfPin1.becomeFirstResponder()
                btnContinue.isEnabled = false
                btnContinue.backgroundColor = UIColor(named: "redPop")
            }
            if textField == tfPin2{
                tfPin1.becomeFirstResponder()
                btnContinue.isEnabled = false
                btnContinue.backgroundColor = UIColor(named: "redPop")
            }
            if textField == tfPin3{
                tfPin2.becomeFirstResponder()
                btnContinue.isEnabled = false
                btnContinue.backgroundColor = UIColor(named: "redPop")
            }
            if textField == tfPin4 {
                tfPin3.becomeFirstResponder()
                btnContinue.isEnabled = false
                btnContinue.backgroundColor = UIColor(named: "redPop")
            }
            textField.text = ""
            return false
        } else if (textField.text?.count)! >= 1 {
            textField.text = string
            return false
        }
        return true
    }
    
}
