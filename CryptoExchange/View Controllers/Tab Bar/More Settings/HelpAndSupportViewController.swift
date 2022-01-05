//
//  HelpAndSupportViewController.swift
//  CryptoExchange
//
//  Created by Shwait Kumar on 05/01/22.
//

import UIKit

class HelpAndSupportViewController : UIViewController {
    
    @IBOutlet weak var tblHelpAndSupport: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tblHelpAndSupport.delegate = self
        self.tblHelpAndSupport.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
}

extension HelpAndSupportViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HelpAndSupportTableViewCell", for: indexPath) as! HelpAndSupportTableViewCell
        
        if indexPath.row == 0 {
            cell.lblTitle.text = "Terms & Condition"
        }
        else if indexPath.row == 1 {
            cell.lblTitle.text = "Privacy Policy"
        }
        else if indexPath.row == 2 {
            cell.lblTitle.text = "Cancellation & Refund Policy"
        }
        else if indexPath.row == 3 {
            cell.lblTitle.text = "FAQs"
        }
        else if indexPath.row == 4 {
            cell.lblTitle.text = "Contact Us"
        }
        else {
            cell.lblTitle.text = "Request a Call"
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 0 {
            
            showAlert(Message: "Feature not available yet", Title: "Crypto Exchange")
            
        }
        else if indexPath.row == 1 {
            
            showAlert(Message: "Feature not available yet", Title: "Crypto Exchange")
            
        }
        else if indexPath.row == 2 {
            
            showAlert(Message: "Feature not available yet", Title: "Crypto Exchange")
            
        }
        else if indexPath.row == 3 {
            
            showAlert(Message: "Feature not available yet", Title: "Crypto Exchange")
            
        }
        else if indexPath.row == 4 {
            
            showAlert(Message: "Feature not available yet", Title: "Crypto Exchange")
            
        }
        else {
            
            showAlert(Message: "Feature not available yet", Title: "Crypto Exchange")
            
        }
        
    }
    
    func showAlert(Message:String, Title: String){
    
        let alert = UIAlertController (title: Title, message: Message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler:{ (alertOKAction) in }))
        self.present(alert, animated: true, completion: nil)
    
    }
    
}

class HelpAndSupportTableViewCell : UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        
    }
    
}
