//
//  PersonalDetailsViewController.swift
//  CryptoExchange
//
//  Created by Shwait Kumar on 06/01/22.
//

import UIKit

class PersonalDetailsViewController : BaseUIViewController {
    
    @IBOutlet weak var viewUserPic: UIView!
    
    @IBOutlet weak var ivUser: UIImageView!
    
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfDob: UITextField!
    
    @IBOutlet weak var btnCalender: UIButton!
    @IBOutlet weak var btnContinue: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnContinue.layer.cornerRadius = 8
        viewUserPic.layer.cornerRadius = 70
        ivUser.layer.cornerRadius = 69
        
        setViewShadow(view: viewUserPic, shadowColor: "whitePop")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.navigationBar.isHidden = false
        
        getUserDetails()
        
    }
    
    @IBAction func btnCalender(_ sender: UIButton) {
        
        
        
    }
    
    @IBAction func btnContinue(_ sender: UIButton) {
        
        if tfName.text == "" {
            showAlert(Message: "Enter your Full Name", Title: "Crypto Exchange")
        }
        else if tfDob.text == "" {
            showAlert(Message: "Enter your Date of Birth", Title: "Crypto Exchange")
        }
        else {
            
            BaseUIViewController.setUserDefault(value: tfName.text!, key: "fullName")
            BaseUIViewController.setUserDefault(value: tfDob.text!, key: "dateOfBirth")
            
            showAlert(Message: "Personal Details updated successfully", Title: "Crypto Exchange")
            
        }

        
    }
    
    func getUserDetails() {
        
        if BaseUIViewController.getUserDefault(key: "fullName") != "" {
            tfName.text = BaseUIViewController.getUserDefault(key: "fullName")
        }
        else {
            tfName.text = ""
        }
        
        if BaseUIViewController.getUserDefault(key: "dateOfBirth") != "" {
            tfDob.text = BaseUIViewController.getUserDefault(key: "dateOfBirth")
        }
        else {
            tfDob.text = ""
        }
        
    }
    
}
