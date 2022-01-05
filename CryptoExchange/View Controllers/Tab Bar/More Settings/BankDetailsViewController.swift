//
//  BankDetailsViewController.swift
//  CryptoExchange
//
//  Created by Shwait Kumar on 05/01/22.
//

import UIKit

class BankDetailsViewController : BaseUIViewController {
    
    @IBOutlet weak var btnSubmit: UIButton!
    
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfBankName: UITextField!
    @IBOutlet weak var tfAccountNumber: UITextField!
    @IBOutlet weak var tfIFSCCode: UITextField!
    
    @IBOutlet weak var viewSavings: UIView!
    @IBOutlet weak var viewCurrent: UIView!
    
    @IBOutlet weak var lblSavings: UILabel!
    @IBOutlet weak var lblCurrent: UILabel!
    
    var buttonSelectedState = false
    var buttonTag = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewSavings.layer.cornerRadius = 8
        viewCurrent.layer.cornerRadius = 8
        btnSubmit.layer.cornerRadius = 8
        
        getBankDetails()
        
        let tapSavings = UITapGestureRecognizer(target: self, action:  #selector(self.savingsTapped))
        viewSavings.addGestureRecognizer(tapSavings)
        
        let tapCurrent = UITapGestureRecognizer(target: self, action:  #selector(self.currentTapped))
        viewCurrent.addGestureRecognizer(tapCurrent)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func btnSubmit(_ sender: UIButton) {
        
        if tfName.text == "" {
            showAlert(Message: "Enter Account Name", Title: "Crypto Exchange")
        }
        else if tfBankName.text == "" {
            showAlert(Message: "Enter Bank Name", Title: "Crypto Exchange")
        }
        else if tfAccountNumber.text == "" {
            showAlert(Message: "Enter Account Number", Title: "Crypto Exchange")
        }
        else if tfIFSCCode.text == "" {
            showAlert(Message: "Enter IFSC Code", Title: "Crypto Exchange")
        }
        else if buttonSelectedState == false {
            showAlert(Message: "Select Account Type", Title: "Crypto Exchange")
        }
        else {
            
            BankDetailsViewController.setUserDefault(value: tfName.text!, key: "userAccountName")
            BankDetailsViewController.setUserDefault(value: tfBankName.text!, key: "userBankName")
            BankDetailsViewController.setUserDefault(value: tfAccountNumber.text!, key: "userAccountNumber")
            BankDetailsViewController.setUserDefault(value: tfIFSCCode.text!, key: "userIFSCCode")
            if buttonTag == 1 {
                BaseUIViewController.setUserDefault(value: "Savings", key: "userAccountType")
            }
            else {
                BaseUIViewController.setUserDefault(value: "Current", key: "userAccountType")
            }
            
            getBankDetails()
            showAlert(Message: "Bank details updated successfully", Title: "Crypto Exchange")
            
        }
        
    }
    
    @IBAction func savingsTapped(sender: UITapGestureRecognizer) {
        
        setDefault()
        buttonSelectedState = true
        buttonTag = 1
        viewSavings.backgroundColor = UIColor(named: "greenPop")
        lblSavings.textColor = UIColor(named: "backgroundPop")
        
    }
    
    @IBAction func currentTapped(sender: UITapGestureRecognizer) {
        
        setDefault()
        buttonSelectedState = true
        buttonTag = 0
        viewCurrent.backgroundColor = UIColor(named: "greenPop")
        lblCurrent.textColor = UIColor(named: "backgroundPop")
        
    }
    
    func getBankDetails() {
        
        if BaseUIViewController.getUserDefault(key: "userAccountName") != "" {
            tfName.text = BaseUIViewController.getUserDefault(key: "userAccountName")
        }
        else {
            tfName.text = ""
        }
        
        if BaseUIViewController.getUserDefault(key: "userBankName") != "" {
            tfBankName.text = BaseUIViewController.getUserDefault(key: "userBankName")
        }
        else {
            tfBankName.text = ""
        }
        
        if BaseUIViewController.getUserDefault(key: "userAccountNumber") != "" {
            tfAccountNumber.text = BaseUIViewController.getUserDefault(key: "userAccountNumber")
        }
        else {
            tfAccountNumber.text = ""
        }
        
        if BaseUIViewController.getUserDefault(key: "userIFSCCode") != "" {
            tfIFSCCode.text = BaseUIViewController.getUserDefault(key: "userIFSCCode")
        }
        else {
            tfIFSCCode.text = ""
        }
        
        if BaseUIViewController.getUserDefault(key: "userAccountType") != "" {
            if BaseUIViewController.getUserDefault(key: "userAccountType") == "Savings" {
                setDefault()
                buttonSelectedState = true
                buttonTag = 1
                viewSavings.backgroundColor = UIColor(named: "greenPop")
                lblSavings.textColor = UIColor(named: "backgroundPop")
            }
            else {
                setDefault()
                buttonSelectedState = true
                buttonTag = 0
                viewCurrent.backgroundColor = UIColor(named: "greenPop")
                lblCurrent.textColor = UIColor(named: "backgroundPop")
            }
        }
        else {
            setDefault()
        }
        
    }
    
    func setDefault() {
        
        viewSavings.backgroundColor = UIColor.darkGray
        viewCurrent.backgroundColor = UIColor.darkGray
        
        lblSavings.textColor = UIColor(named: "whitePop")
        lblCurrent.textColor = UIColor(named: "whitePop")
        
        buttonSelectedState = false
        
    }
    
}
