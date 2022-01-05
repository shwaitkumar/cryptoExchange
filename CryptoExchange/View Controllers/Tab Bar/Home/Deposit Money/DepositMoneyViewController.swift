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
    
    var walletBalance = ""
    var tfAmount = 0.0
    var btntag = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnDeposit.layer.cornerRadius = 8
        
        setButtonShadow(btn: btnDeposit, shadowColor: "whitePop")
        
        self.tblDepositMoney.delegate = self
        self.tblDepositMoney.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
        btntag = 0
        walletBalance = BaseUIViewController.getUserDefault(key: "walletBalance")
        tblDepositMoney.reloadData()
    }
    
    @IBAction func btnDeposit(_ sender: UIButton) {
        
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = tblDepositMoney.cellForRow(at: indexPath)
        
        let amount = cell!.viewWithTag(1) as! UITextField
        
        debugPrint("amount - ",amount.text!)
        
        let amountInString = amount.text!
        
        var amountInDouble = Double(amountInString)
        
        if amountInString == "" {
            amountInDouble = 0.0
        }
        
        if amountInDouble! >= 100 {
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "DepositMethodsViewController") as! DepositMethodsViewController
            vc.amount = amount.text!
            navigationController?.pushViewController(vc, animated: true)
            
        }
        else {
            showAlert(Message: "Amount cannot be empty or less than ₹100", Title: "Crypto Exchange")
        }
        
    }
    
}

extension DepositMoneyViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DepositMoneyTableViewCell", for: indexPath) as! DepositMoneyTableViewCell
        
        cell.lblWalletBalance.text = " ₹\(BaseUIViewController.getUserDefault(key: "walletBalance"))"
        
        if btntag == 1 {
            setDefault()
            cell.btn100.backgroundColor = UIColor(named: "bluePop")
            cell.tfDeposit.text = String(format: "%.1f", tfAmount)
        }
        else if btntag == 2 {
            setDefault()
            cell.btn500.backgroundColor = UIColor(named: "bluePop")
            cell.tfDeposit.text = String(format: "%.1f", tfAmount)
        }
        else if btntag == 3 {
            setDefault()
            cell.btn2000.backgroundColor = UIColor(named: "bluePop")
            cell.tfDeposit.text = String(format: "%.1f", tfAmount)
        }
        else if btntag == 4 {
            setDefault()
            cell.btn10000.backgroundColor = UIColor(named: "bluePop")
            cell.tfDeposit.text = String(format: "%.1f", tfAmount)
        }
        else if btntag == 5 {
            setDefault()
            cell.btn50000.backgroundColor = UIColor(named: "bluePop")
            cell.tfDeposit.text = String(format: "%.1f", tfAmount)
        }
        else {
            setDefault()
            cell.tfDeposit.text = ""
        }
        
        func setDefault() {
            
            cell.btn100.backgroundColor = UIColor(named: "tealPop")
            cell.btn500.backgroundColor = UIColor(named: "tealPop")
            cell.btn2000.backgroundColor = UIColor(named: "tealPop")
            cell.btn10000.backgroundColor = UIColor(named: "tealPop")
            cell.btn50000.backgroundColor = UIColor(named: "tealPop")
            
        }
        
        cell.btn100.tag = indexPath.row
        cell.btn100.addTarget(self, action: #selector(btnPlus100Tapped(_:)), for: .touchUpInside)
        
        cell.btn500.tag = indexPath.row
        cell.btn500.addTarget(self, action: #selector(btnPlus500Tapped(_:)), for: .touchUpInside)
        
        cell.btn2000.tag = indexPath.row
        cell.btn2000.addTarget(self, action: #selector(btnPlus2000Tapped(_:)), for: .touchUpInside)
        
        cell.btn10000.tag = indexPath.row
        cell.btn10000.addTarget(self, action: #selector(btnPlus10000Tapped(_:)), for: .touchUpInside)
        
        cell.btn50000.tag = indexPath.row
        cell.btn50000.addTarget(self, action: #selector(btnPlus50000Tapped(_:)), for: .touchUpInside)
        
        return cell
        
    }
    
    @objc func btnPlus100Tapped(_ sender: UIButton){
        btntag = 1
        tfAmount = 100
        tblDepositMoney.reloadData()
    }
    
    @objc func btnPlus500Tapped(_ sender: UIButton){
        btntag = 2
        tfAmount = 500
        tblDepositMoney.reloadData()
    }
    
    @objc func btnPlus2000Tapped(_ sender: UIButton){
        btntag = 3
        tfAmount = 2000
        tblDepositMoney.reloadData()
    }
    
    @objc func btnPlus10000Tapped(_ sender: UIButton){
        btntag = 4
        tfAmount = 10000
        tblDepositMoney.reloadData()
    }
    
    @objc func btnPlus50000Tapped(_ sender: UIButton){
        btntag = 5
        tfAmount = 50000
        tblDepositMoney.reloadData()
    }
    
}

class DepositMoneyTableViewCell : UITableViewCell {
    
    @IBOutlet weak var btn100: UIButton!
    @IBOutlet weak var btn500: UIButton!
    @IBOutlet weak var btn2000: UIButton!
    @IBOutlet weak var btn10000: UIButton!
    @IBOutlet weak var btn50000: UIButton!
    
    @IBOutlet weak var tfDeposit: UITextField!
    
    @IBOutlet weak var lblWalletBalance: UILabel!
    
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
        
        [tfDeposit].forEach({ $0.addTarget(self, action: #selector(clearTf), for: .editingChanged)})
        
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

extension DepositMoneyTableViewCell : UITextFieldDelegate {
    
    @objc func clearTf(sender: UITextField) {

        guard
            let tfAmountTextValue = tfDeposit.text, !tfAmountTextValue.isEmpty
        else {
            setDefault()
            return

        }
        setDefault()

    }
    
    func setDefault() {
        btn100.backgroundColor = UIColor(named: "tealPop")
        btn500.backgroundColor = UIColor(named: "tealPop")
        btn2000.backgroundColor = UIColor(named: "tealPop")
        btn10000.backgroundColor = UIColor(named: "tealPop")
        btn50000.backgroundColor = UIColor(named: "tealPop")
    }
    
}
