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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViewShadow(view: viewUserPic, shadowColor: "whitePop")
        
        viewUserPic.layer.cornerRadius = 70
        ivUser.layer.cornerRadius = 69
        
    }
    
}
