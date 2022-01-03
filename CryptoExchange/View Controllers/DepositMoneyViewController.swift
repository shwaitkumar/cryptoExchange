//
//  DepositMoneyViewController.swift
//  CryptoExchange
//
//  Created by Shwait Kumar on 03/01/22.
//

import UIKit

class DepositMoneyViewController : BaseUIViewController {
    
    @IBOutlet weak var btnDeposit: UIButton!
    
    @IBOutlet weak var tblDepositMoney: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnDeposit.layer.cornerRadius = 4
        
        self.tblDepositMoney.delegate = self
        self.tblDepositMoney.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func btnDeposit(_ sender: UIButton) {
    }
    
}

extension DepositMoneyViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DepositMoneyTableViewCell", for: indexPath) as! DepositMoneyTableViewCell
        
        return cell
        
    }
    
}

class DepositMoneyTableViewCell : UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        
    }
    
}
