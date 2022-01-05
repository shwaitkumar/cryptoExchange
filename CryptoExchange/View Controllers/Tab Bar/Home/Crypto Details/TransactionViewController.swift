//
//  TransactionViewController.swift
//  CryptoExchange
//
//  Created by Shwait Kumar on 04/01/22.
//

import UIKit

class TransactionViewController : BaseUIViewController {
    
    @IBOutlet weak var tblTransactions: UITableView!
    
    var coinCurrentPrice = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.tblTransactions.delegate = self
        self.tblTransactions.dataSource = self
        
        coinCurrentPrice = Double(BaseUIViewController.getUserDefault(key: "coinPrice"))!
        
    }
    
}

extension TransactionViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionsTableViewCell", for: indexPath) as! TransactionsTableViewCell
        
        let price = String(format: "%.1f", coinCurrentPrice)
        cell.lblCoinPrice.text = "₹\(price)"
        
        return cell
        
    }
    
}

class TransactionsTableViewCell : UITableViewCell {
    
    @IBOutlet weak var lblCoinPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        
    }
    
}
