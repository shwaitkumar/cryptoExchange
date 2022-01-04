//
//  DepositMethodsViewController.swift
//  CryptoExchange
//
//  Created by Shwait Kumar on 04/01/22.
//

import UIKit

class DepositMethodsViewController : BaseUIViewController {
    
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
