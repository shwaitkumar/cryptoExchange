//
//  DepositMethodsViewController.swift
//  CryptoExchange
//
//  Created by Shwait Kumar on 04/01/22.
//

import UIKit

class DepositMethodsViewController : UIViewController {
    
    @IBOutlet weak var tblDepositMethods: UITableView!
    
    var amount = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tblDepositMethods.dataSource = self
        self.tblDepositMethods.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
}

extension DepositMethodsViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DepositMethodsTableViewCell", for: indexPath) as! DepositMethodsTableViewCell
        
        if indexPath.row == 0 {
            cell.ivIcon.image = UIImage(systemName: "rectangle.portrait.and.arrow.right.fill")
            cell.lblTitle.text = "Pay via UPI"
        }
        else if indexPath.row == 1 {
            cell.ivIcon.image = UIImage(systemName: "building.columns.fill")
            cell.lblTitle.text = "Pay via Bank Transfer"
        }
        else {
            cell.ivIcon.image = UIImage(systemName: "creditcard.fill")
            cell.lblTitle.text = "Pay via Card or Wallet"
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 0 {
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "UPIViewController") as! UPIViewController
            navigationController?.pushViewController(vc, animated: true)
            
        }
        else if indexPath.row == 1 {
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "PayViaBankTransferViewController") as! PayViaBankTransferViewController
            navigationController?.pushViewController(vc, animated: true)
            
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

class DepositMethodsTableViewCell : UITableViewCell {
    
    @IBOutlet weak var ivIcon: UIImageView!
    
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        
    }
    
}
