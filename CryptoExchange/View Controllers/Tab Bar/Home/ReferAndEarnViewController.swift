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
    
    @IBOutlet weak var btnShare: UIButton!
    @IBOutlet weak var btnInviteViaWhatsapp: UIButton!
    @IBOutlet weak var btnInviteViaContacts: UIButton!
    @IBOutlet weak var btnCopy: UIButton!
    
    @IBOutlet weak var lblReferralCode: UILabel!
    
    var referralCode = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViewShadow(view: viewUserPic, shadowColor: "whitePop")
        
        setButtonShadow(btn: btnInviteViaWhatsapp, shadowColor: "whitePop")
        setButtonShadow(btn: btnInviteViaContacts, shadowColor: "whitePop")
        
        btnInviteViaWhatsapp.layer.cornerRadius = 8
        btnInviteViaContacts.layer.cornerRadius = 8
        
        viewUserPic.layer.cornerRadius = 70
        ivUser.layer.cornerRadius = 69
        
        referralCode = lblReferralCode.text!
        
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
    
}
