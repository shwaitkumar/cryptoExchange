//
//  LoginWithEmailViewController.swift
//  CryptoExchange
//
//  Created by Shwait Kumar on 02/01/22.
//

import UIKit

class LoginWithEmailViewController: BaseUIViewController {
    
    @IBOutlet weak var btnClose: UIButton!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnClose(_ sender: UIButton) {
        
        popThisView()
        
    }
    
}
