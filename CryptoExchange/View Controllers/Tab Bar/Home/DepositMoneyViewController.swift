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
        
        btnDeposit.layer.cornerRadius = 8
        
        setButtonShadow(btn: btnDeposit, shadowColor: "whitePop")
        
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
    
    @IBOutlet weak var btn100: UIButton!
    @IBOutlet weak var btn500: UIButton!
    @IBOutlet weak var btn2000: UIButton!
    @IBOutlet weak var btn10000: UIButton!
    @IBOutlet weak var btn50000: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        btn100.layer.cornerRadius = 4
        btn500.layer.cornerRadius = 4
        btn2000.layer.cornerRadius = 4
        btn10000.layer.cornerRadius = 4
        btn50000.layer.cornerRadius = 4
        
        btn100.setTitle("+100", for: .normal)
        btn500.setTitle("+500", for: .normal)
        btn2000.setTitle("+2000", for: .normal)
        btn10000.setTitle("+10000", for: .normal)
        btn50000.setTitle("+50000", for: .normal)
        
        setButtonShadow(btn: btn100, shadowColor: "whitePop")
        setButtonShadow(btn: btn500, shadowColor: "whitePop")
        setButtonShadow(btn: btn2000, shadowColor: "whitePop")
        setButtonShadow(btn: btn10000, shadowColor: "whitePop")
        setButtonShadow(btn: btn50000, shadowColor: "whitePop")
        
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
