//
//  AccountSettingsViewController.swift
//  CryptoExchange
//
//  Created by Shwait Kumar on 05/01/22.
//

import UIKit

class AccountSettingsViewController : UIViewController {
    
    @IBOutlet weak var tblAccountSettings: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tblAccountSettings.delegate = self
        self.tblAccountSettings.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
}

extension AccountSettingsViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AccountSettingsTableViewCell", for: indexPath) as! AccountSettingsTableViewCell
        
        if indexPath.row == 0 {
            cell.lblTitle.text = "Personal Details"
        }
        else if indexPath.row == 1 {
            cell.lblTitle.text = "Pancard Details"
        }
        else {
            cell.lblTitle.text = "Aadhaar Details"
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 0 {
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "PersonalDetailsViewController") as! PersonalDetailsViewController
            navigationController?.pushViewController(vc, animated: true)
            
        }
        else if indexPath.row == 1 {
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "PanCardDetailsViewController") as! PanCardDetailsViewController
            navigationController?.pushViewController(vc, animated: true)
            
        }
        else {
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "AadhaarDetailsViewController") as! AadhaarDetailsViewController
            navigationController?.pushViewController(vc, animated: true)
            
        }
        
    }
    
}

class AccountSettingsTableViewCell : UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        
    }
    
}

