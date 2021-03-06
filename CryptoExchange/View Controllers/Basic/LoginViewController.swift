//
//  LoginViewController.swift
//  CryptoExchange
//
//  Created by Shwait Kumar on 02/01/22.
//

import UIKit

class LoginViewController : BaseUIViewController {
    
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var btnTnC: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setButtonShadow(btn: btnLogin, shadowColor: "whitePop")
        setButtonShadow(btn: btnSignUp, shadowColor: "whitePop")
        setButtonShadow(btn: btnTnC, shadowColor: "whitePop")
        
        btnLogin.layer.cornerRadius = 8
        btnSignUp.layer.cornerRadius = 8
        
    }
    
    @IBAction func btnLogin(_ sender: UIButton) {
        performSegue(withIdentifier: "toLoginWithEmail", sender: nil)
    }
    
    @IBAction func btnSignUp(_ sender: UIButton) {
        performSegue(withIdentifier: "toRegister", sender: nil)
    }
    
    @IBAction func btnTnC(_ sender: UIButton) {
    }
    
}
