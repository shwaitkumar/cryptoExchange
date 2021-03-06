//
//  ReferAndEarnViewController.swift
//  CryptoExchange
//
//  Created by Shwait Kumar on 03/01/22.
//

import UIKit

class ReferAndEarnViewController : BaseUIViewController {
    
    @IBOutlet weak var viewUserPic: UIView!
    
    @IBOutlet weak var ivUser: UIImageView!
    @IBOutlet weak var ivGift: UIImageView!
    
    @IBOutlet weak var btnShare: UIButton!
    @IBOutlet weak var btnInviteViaWhatsapp: UIButton!
    @IBOutlet weak var btnInviteViaContacts: UIButton!
    @IBOutlet weak var btnCopy: UIButton!
    
    @IBOutlet weak var lblReferralCode: UILabel!
    @IBOutlet weak var lblWalletBalance: UILabel!
    @IBOutlet weak var lblName: UILabel!
    
    var referralCode = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViewShadow(view: viewUserPic, shadowColor: "whitePop")
        
        setButtonShadow(btn: btnInviteViaWhatsapp, shadowColor: "whitePop")
        setButtonShadow(btn: btnInviteViaContacts, shadowColor: "whitePop")
        
        btnInviteViaWhatsapp.layer.cornerRadius = 8
        btnInviteViaContacts.layer.cornerRadius = 8
        
        viewUserPic.layer.cornerRadius = 50
        ivUser.layer.cornerRadius = 49
        
        referralCode = BaseUIViewController.getUserDefault(key: "referralCode")
        
        lblReferralCode.text = referralCode
        
        let randomGeneratedNumber = Int.random(in: 1..<6)
        setGiftImage(randomNumber: randomGeneratedNumber)
        
        getUserDetails()
        
    }
    
    @IBAction func btnShare(_ sender: UIButton) {
        
        // set up activity view controller
        let textToShare = [ referralCode ]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
        
        // present the view controller
        self.present(activityViewController, animated: true, completion: nil)
        
    }
    
    @IBAction func btnInviteViaWhatsapp(_ sender: Any) {
        
        let escapedString = referralCode.addingPercentEncoding(withAllowedCharacters:CharacterSet.urlQueryAllowed)

        let url  = URL(string: "whatsapp://send?text=\(escapedString!)")

        if UIApplication.shared.canOpenURL(url! as URL)
        {
            UIApplication.shared.open(url! as URL, options: [:], completionHandler: nil)
        }
        
    }
    
    @IBAction func btnInviteViaContacts(_ sender: UIButton) {
        
        // set up activity view controller
        let textToShare = [ referralCode ]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
        
        // present the view controller
        self.present(activityViewController, animated: true, completion: nil)
        
    }
    
    @IBAction func btnCopy(_ sender: UIButton) {
        
        UIPasteboard.general.string = lblReferralCode.text
        showAlert(Message: "Referral code copied successfully", Title: "Crypto Exchange")
        
    }
    
    func setGiftImage(randomNumber : Int) {
        
        ivGift.image = UIImage(named: "gift\(randomNumber)")
        
    }
    
    func getUserDetails() {
        
        if BaseUIViewController.getUserDefault(key: "fullName") != "" {
            lblName.text = BaseUIViewController.getUserDefault(key: "fullName")
        }
        else {
            lblName.text = "Hi!"
        }
        
        lblWalletBalance.text = " ???\(BaseUIViewController.getUserDefault(key: "walletBalance"))"
        
        if BaseUIViewController.getUserDefault(key: "userPic") != "" {
            let userBase64 = BaseUIViewController.getUserDefault(key: "userPic")
            let dataDecoded : Data = Data(base64Encoded: userBase64, options: .ignoreUnknownCharacters)!
            let decodedimage:UIImage = UIImage(data: dataDecoded as Data)!
            print(decodedimage)
            ivUser.image = decodedimage
        }
        
    }
    
}
