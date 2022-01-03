//
//  WithdrawMoneyViewController.swift
//  CryptoExchange
//
//  Created by Shwait Kumar on 03/01/22.
//

import UIKit

class WithdrawMoneyViewController : BaseUIViewController {
    
    @IBOutlet weak var tblWithdrawMoney: UITableView!
    
    @IBOutlet weak var btnWithdraw: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnWithdraw.layer.cornerRadius = 4
        
        self.tblWithdrawMoney.delegate = self
        self.tblWithdrawMoney.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
}

extension WithdrawMoneyViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WithdrawMoneyTableViewCell", for: indexPath) as! WithdrawMoneyTableViewCell
        
        return cell
    }

}

class WithdrawMoneyTableViewCell : UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        
    }
    
}
