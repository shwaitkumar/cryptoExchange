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
        
        btnWithdraw.layer.cornerRadius = 8
        
        setButtonShadow(btn: btnWithdraw, shadowColor: "whitePop")
        
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
    
    @IBOutlet weak var btn25: UIButton!
    @IBOutlet weak var btn50: UIButton!
    @IBOutlet weak var btn75: UIButton!
    @IBOutlet weak var btn100: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        btn25.layer.cornerRadius = 4
        btn50.layer.cornerRadius = 4
        btn75.layer.cornerRadius = 4
        btn100.layer.cornerRadius = 4
        
        setButtonShadow(btn: btn25, shadowColor: "whitePop")
        setButtonShadow(btn: btn50, shadowColor: "whitePop")
        setButtonShadow(btn: btn75, shadowColor: "whitePop")
        setButtonShadow(btn: btn100, shadowColor: "whitePop")
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        
    }
    
    func setButtonShadow(btn: UIButton, shadowColor: String) {
        
        btn.layer.shadowRadius = 8
        btn.layer.shadowOffset = .zero
        btn.layer.shadowOpacity = 0.20
        btn.layer.shadowColor = UIColor(named: shadowColor)?.cgColor

    }
    
}
