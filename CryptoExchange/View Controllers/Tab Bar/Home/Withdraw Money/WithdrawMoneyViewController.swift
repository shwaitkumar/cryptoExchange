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
    
    var wallerBalance = 25626.0
    var btntag = 0
    var amountCalculated = 0.0
    
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
    
    @IBAction func btnWithdraw(_ sender: UIButton) {
        
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = tblWithdrawMoney.cellForRow(at: indexPath)
        
        let amount = cell!.viewWithTag(1) as! UITextField
        
        debugPrint("amount - ",amount.text!)
        
        let amountInString = amount.text!
        
        var amountInDouble = Double(amountInString)
        
        if amountInString == "" {
            amountInDouble = 0.0
        }
        
        if amountInDouble! < wallerBalance && amountInDouble! != 0.0 && amountInDouble! >= 100 {
            showAlert(Message: "Amount will be transfered to your account within 4-5 working days", Title: "Crypto Exchange")
        }
        else if amountInDouble! == 0.0 || amountInDouble! < 100 {
            showAlert(Message: "Amount to be withdrawn cannot be empty or less than ₹100", Title: "Crypto Exchange")
        }
        else {
            showAlert(Message: "Amount to be withdrawn cannot be greater than your wallet balance", Title: "Crypto Exchange")
        }
        
    }
    
}

extension WithdrawMoneyViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WithdrawMoneyTableViewCell", for: indexPath) as! WithdrawMoneyTableViewCell
        
        if btntag == 1 {
            setDefault()
            cell.btn25.backgroundColor = UIColor(named: "bluePop")
            cell.tfWithdraw.text = String(format: "%.1f", amountCalculated)
        }
        else if btntag == 2 {
            setDefault()
            cell.btn50.backgroundColor = UIColor(named: "bluePop")
            cell.tfWithdraw.text = String(format: "%.1f", amountCalculated)
        }
        else if btntag == 3 {
            setDefault()
            cell.btn75.backgroundColor = UIColor(named: "bluePop")
            cell.tfWithdraw.text = String(format: "%.1f", amountCalculated)
        }
        else if btntag == 4 {
            setDefault()
            cell.btn100.backgroundColor = UIColor(named: "bluePop")
            cell.tfWithdraw.text = String(format: "%.1f", amountCalculated)
        }
        else {
            setDefault()
            cell.tfWithdraw.text = ""
        }
        
        func setDefault() {
            
            cell.btn25.backgroundColor = UIColor(named: "tealPop")
            cell.btn50.backgroundColor = UIColor(named: "tealPop")
            cell.btn75.backgroundColor = UIColor(named: "tealPop")
            cell.btn100.backgroundColor = UIColor(named: "tealPop")
            
        }
        
        cell.btn25.tag = indexPath.row
        cell.btn25.addTarget(self, action: #selector(btn25Tapped(_:)), for: .touchUpInside)
        
        cell.btn50.tag = indexPath.row
        cell.btn50.addTarget(self, action: #selector(btn50Tapped(_:)), for: .touchUpInside)
        
        cell.btn75.tag = indexPath.row
        cell.btn75.addTarget(self, action: #selector(btn75Tapped(_:)), for: .touchUpInside)
        
        cell.btn100.tag = indexPath.row
        cell.btn100.addTarget(self, action: #selector(btn100Tapped(_:)), for: .touchUpInside)
        
        return cell
    }
    
    @objc func btn25Tapped(_ sender: UIButton){
        btntag = 1
        amountCalculated = (0.25) * wallerBalance
        tblWithdrawMoney.reloadData()
    }
    
    @objc func btn50Tapped(_ sender: UIButton){
        btntag = 2
        amountCalculated = (0.50) * wallerBalance
        tblWithdrawMoney.reloadData()
    }
    
    @objc func btn75Tapped(_ sender: UIButton){
        btntag = 3
        amountCalculated = (0.75) * wallerBalance
        tblWithdrawMoney.reloadData()
    }
    
    @objc func btn100Tapped(_ sender: UIButton){
        btntag = 4
        amountCalculated = wallerBalance
        tblWithdrawMoney.reloadData()
    }

}

class WithdrawMoneyTableViewCell : UITableViewCell {
    
    @IBOutlet weak var btn25: UIButton!
    @IBOutlet weak var btn50: UIButton!
    @IBOutlet weak var btn75: UIButton!
    @IBOutlet weak var btn100: UIButton!
    
    @IBOutlet weak var tfWithdraw: UITextField!
    
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
        
        [tfWithdraw].forEach({ $0.addTarget(self, action: #selector(clearTf), for: .editingChanged)})
        
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

extension WithdrawMoneyTableViewCell : UITextFieldDelegate {
    
    @objc func clearTf(sender: UITextField) {

        guard
            let tfAmountTextValue = tfWithdraw.text, !tfAmountTextValue.isEmpty
        else {
            setDefault()
            return

        }
        setDefault()

    }
    
    func setDefault() {
        btn25.backgroundColor = UIColor(named: "tealPop")
        btn50.backgroundColor = UIColor(named: "tealPop")
        btn75.backgroundColor = UIColor(named: "tealPop")
        btn100.backgroundColor = UIColor(named: "tealPop")
    }
    
}
