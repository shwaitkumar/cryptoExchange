//
//  TotalWorthViewController.swift
//  CryptoExchange
//
//  Created by Shwait Kumar on 03/01/22.
//

import UIKit

class TotalWorthViewController : BaseUIViewController {
    
    @IBOutlet weak var viewUserPic: UIView!
    
    @IBOutlet weak var ivUser: UIImageView!
    
    @IBOutlet weak var lblWalletBalance: UILabel!
    @IBOutlet weak var lblName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViewShadow(view: viewUserPic, shadowColor: "whitePop")
        
        viewUserPic.layer.cornerRadius = 50
        ivUser.layer.cornerRadius = 49
        
        getUserDetails()
        
    }
    
    func getUserDetails() {
        
        if BaseUIViewController.getUserDefault(key: "fullName") != "" {
            lblName.text = BaseUIViewController.getUserDefault(key: "fullName")
        }
        else {
            lblName.text = "Hi!"
        }
        
        lblWalletBalance.text = " ₹\(BaseUIViewController.getUserDefault(key: "walletBalance"))"
        
        if BaseUIViewController.getUserDefault(key: "userPic") != "" {
            let userBase64 = BaseUIViewController.getUserDefault(key: "userPic")
            let dataDecoded : Data = Data(base64Encoded: userBase64, options: .ignoreUnknownCharacters)!
            let decodedimage:UIImage = UIImage(data: dataDecoded as Data)!
            print(decodedimage)
            ivUser.image = decodedimage
        }
        
    }
    
}
