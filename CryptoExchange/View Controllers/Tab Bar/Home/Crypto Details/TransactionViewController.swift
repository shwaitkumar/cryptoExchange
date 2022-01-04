//
//  TransactionViewController.swift
//  CryptoExchange
//
//  Created by Shwait Kumar on 04/01/22.
//

import UIKit

class TransactionViewController : BaseUIViewController {
    
    @IBOutlet weak var tblTransactions: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tblTransactions.delegate = self
        self.tblTransactions.dataSource = self
        
    }
    
}

extension TransactionViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionsTableViewCell", for: indexPath) as! TransactionsTableViewCell
        
        return cell
        
    }
    
}

class TransactionsTableViewCell : UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        
    }
    
}
