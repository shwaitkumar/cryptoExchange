//
//  LoginWithEmailViewController.swift
//  CryptoExchange
//
//  Created by Shwait Kumar on 02/01/22.
//

import UIKit

class LoginWithEmailViewController: BaseUIViewController {

    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnEye: UIButton!
    @IBOutlet weak var btnForgotPassword: UIButton!
    
    @IBOutlet weak var viewEmail: UIView!
    
    @IBOutlet weak var viewPassword: UIView!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    @IBOutlet weak var ivCheckMark: UIImageView!
    
    var showPassword = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setButtonShadow(btn: btnLogin, shadowColor: "whitePop")
        setButtonShadow(btn: btnForgotPassword, shadowColor: "whitePop")
        
        disabledButton()
        [tfEmail, tfPassword].forEach({ $0.addTarget(self, action: #selector(textFieldEditingDidChange), for: .editingChanged)})
        
        ivCheckMark.isHidden = true
        [tfEmail].forEach({ $0.addTarget(self, action: #selector(showCheckMark), for: .editingChanged)})
        
        btnLogin.layer.cornerRadius = 4
        btnForgotPassword.layer.cornerRadius = 4
        
    }
    
    @IBAction func btnLogin(_ sender: UIButton) {
        
        if tfEmail.text == "abc@xyz.com" && tfPassword.text == "123456"
        {
            appDelegate.pushToPinViewController()
        }
        else {
            showAlert(Message: "Check if your Email or Password are correct", Title: "Crypto Exchange")
        }
        
    }
    
    //MARK: Login Button wrt Textfield
    @objc func textFieldEditingDidChange(sender: UITextField) {
        
        guard
            let tfEmailTextValue = tfEmail.text, !tfEmailTextValue.isEmpty && checkValidEmail(tfEmail.text!),
            let tfPasswordTextValue = tfPassword.text, !tfPasswordTextValue.isEmpty
        else {
            disabledButton()
            return
            
        }
        enableButton()
    }
    
    func disabledButton(){
        btnLogin.backgroundColor = UIColor(named: "redPop")
        btnLogin.isEnabled = false
    }

    func enableButton(){
        btnLogin.backgroundColor = UIColor(named: "greenPop")
        btnLogin.isEnabled = true
    }
    
    @objc func showCheckMark(sender: UITextField) {
        
        guard
            let tfEmailTextValue = tfEmail.text, !tfEmailTextValue.isEmpty && checkValidEmail(tfEmail.text!)
        else {
            ivCheckMark.isHidden = true
            return
        }
        ivCheckMark.isHidden = false
    }
    
    @IBAction func btnEye(_ sender: UIButton) {
        
        if showPassword
        {
            showPassword = false
            btnEye.setImage(UIImage(systemName: "eye.fill"), for: .normal)
            btnEye.tintColor = UIColor(named: "redPop")
            tfPassword.isSecureTextEntry = !tfPassword.isSecureTextEntry
        }
        else
        {
            showPassword = true
            btnEye.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
            btnEye.tintColor = UIColor(named: "bluePop")
            tfPassword.isSecureTextEntry = !tfPassword.isSecureTextEntry
        }
        
    }
    
    @IBAction func btnforgotPassword(_ sender: UIButton) {
    }
    
}
