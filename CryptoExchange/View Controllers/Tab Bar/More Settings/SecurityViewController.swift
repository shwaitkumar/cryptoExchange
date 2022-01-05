//
//  SecurityViewController.swift
//  CryptoExchange
//
//  Created by Shwait Kumar on 05/01/22.
//

import UIKit

class SecurityViewController : UIViewController {
    
    @IBOutlet weak var tblSecurity: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tblSecurity.delegate = self
        self.tblSecurity.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
}

extension SecurityViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SecurityTableViewCell", for: indexPath) as! SecurityTableViewCell
        
        if indexPath.row == 0 {
            cell.lblTitle.text = "Change Password"
        }
        else {
            cell.lblTitle.text = "Change Pin"
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 0 {
            
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

class SecurityTableViewCell : UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        
    }
    
}
