//
//  BuyOrSellCoinViewController.swift
//  CryptoExchange
//
//  Created by Shwait Kumar on 04/01/22.
//

import UIKit

class BuyOrSellCoinViewController : BaseUIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblWalletOrCoinAmountTitle: UILabel!
    @IBOutlet weak var lblWalletBalanceOrCoinAmount: UILabel!
    @IBOutlet weak var lblCurrentPrice: UILabel!
    
    @IBOutlet weak var viewCoinPic: UIView!
    @IBOutlet weak var viewAmount: UIView!
    @IBOutlet weak var viewCoinAmount: UIView!
    
    @IBOutlet weak var ivCoin: UIImageView!
    
    @IBOutlet weak var tfAmount: UITextField!
    @IBOutlet weak var tfCoinAmount: UITextField!
    
    @IBOutlet weak var btn25: UIButton!
    @IBOutlet weak var btn50: UIButton!
    @IBOutlet weak var btn75: UIButton!
    @IBOutlet weak var btn100: UIButton!
    @IBOutlet weak var btnBuyOrSell: UIButton!
    
    var buttonTag = 0
    var walletBalance = 0.0
    var coinAmount = 0.0
    var coinCurrentPrice = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btn25.layer.cornerRadius = 4
        btn50.layer.cornerRadius = 4
        btn75.layer.cornerRadius = 4
        btn100.layer.cornerRadius = 4
        btnBuyOrSell.layer.cornerRadius = 8
        
        viewCoinPic.layer.cornerRadius = 28
        ivCoin.layer.cornerRadius = 27
        
        walletBalance = Double(BaseUIViewController.getUserDefault(key: "walletBalance"))!
        coinAmount = Double(BaseUIViewController.getUserDefault(key: "amount"))!
        coinCurrentPrice = Double(BaseUIViewController.getUserDefault(key: "coinPrice"))!
        
        setCoinDetails()
        
        tfAmount.placeholder = "₹"
        tfCoinAmount.placeholder = "BTC"
        
        tfAmount.delegate = self
        tfCoinAmount.delegate = self
        
        [tfAmount, tfCoinAmount].forEach({ $0.addTarget(self, action: #selector(clearTf), for: .editingChanged)})
        
    }
    
    func setCoinDetails() {
        
        if buttonTag == 1 {
            
            lblTitle.text = "Sell Bitcoin"
            lblTitle.textColor = UIColor(named: "redPop")
            lblWalletOrCoinAmountTitle.text = "Amount : "
            
            let amount = String(format: "%.5f", coinAmount)
            lblWalletBalanceOrCoinAmount.text = amount
            
            btnBuyOrSell.setTitle("Sell", for: .normal)
            btnBuyOrSell.backgroundColor = UIColor(named: "redPop")
            
            tfAmount.isEnabled = false
            tfCoinAmount.isEnabled = true
            
            viewAmount.backgroundColor = UIColor.darkGray
            viewCoinAmount.backgroundColor = UIColor(named: "yellowPop")
            
        }
        else {
            
            lblTitle.text = "Buy Bitcoin"
            lblTitle.textColor = UIColor(named: "greenPop")
            lblWalletOrCoinAmountTitle.text = "Wallet Balance : "
            
            let balance = String(format: "%.1f", walletBalance)
            lblWalletBalanceOrCoinAmount.text = "₹ \(balance)"
            
            btnBuyOrSell.setTitle("Buy", for: .normal)
            btnBuyOrSell.backgroundColor = UIColor(named: "greenPop")
            
            tfAmount.isEnabled = true
            tfCoinAmount.isEnabled = false
            
            viewAmount.backgroundColor = UIColor(named: "yellowPop")
            viewCoinAmount.backgroundColor = UIColor.darkGray
            
        }
        
        let price = String(format: "%.1f", coinCurrentPrice)
        lblCurrentPrice.text = "₹ \(price)"
        
    }
    
    @IBAction func btnBuyOrSell(_ sender: UIButton) {
        
        if buttonTag == 1 {
            
            let coinAmountInString = tfCoinAmount.text
            let amountInString = tfAmount.text
            
            var coinAmountInDouble = Double(coinAmountInString!)
            var amountInDouble = Double(amountInString!)
            
            if coinAmountInString == "" {
                coinAmountInDouble = 0.0
            }
            
            if coinAmountInDouble! > coinAmount {
                
                showAlert(Message: "Amount cannot be greater than the amount you own", Title: "Crypto Exchange")
                
            }
            else {
                
                let newCoinAmount = coinAmount - coinAmountInDouble!
                let newCoinAmountString = String(format: "%.5f", newCoinAmount)
                let newWalletBalance = walletBalance + amountInDouble!
                let newWalletBalanceString = String(format: "%.1f", newWalletBalance)
                BaseUIViewController.setUserDefault(value: newCoinAmountString, key: "amount")
                BaseUIViewController.setUserDefault(value: newWalletBalanceString, key: "walletBalance")
                coinAmount = Double(BaseUIViewController.getUserDefault(key: "amount"))!
                walletBalance = Double(BaseUIViewController.getUserDefault(key: "walletBalance"))!
                setCoinDetails()
        
                showAlert(Message: "Sold \(tfCoinAmount.text!) BTC successfully for ₹\(tfAmount.text!)", Title: "Crypto Exchange")
                
                tfAmount.text = ""
                tfCoinAmount.text = ""
                
            }
            
        }
        else {
            
            let amountInString = tfAmount.text
            let coinAmountInString = tfCoinAmount.text
            
            var amountInDouble = Double(amountInString!)
            var coinAmountInDouble = Double(coinAmountInString!)
            
            if amountInString == "" {
                amountInDouble = 0.0
            }
            
            if amountInDouble! < 100 {
                
                showAlert(Message: "Amount cannot be less than ₹100", Title: "Crypto Exchange")
                
            }
            else if amountInDouble! > walletBalance {
                
                showAlert(Message: "Amount cannot be greater than your wallet balance", Title: "Crypto Exchange")
                
            }
            else {
                
                let newWalletBalance = walletBalance - amountInDouble!
                let newWalletBalanceString = String(format: "%.1f", newWalletBalance)
                let newCoinAmount = coinAmount + coinAmountInDouble!
                let newCoinAmountString = String(format: "%.5f", newCoinAmount)
                BaseUIViewController.setUserDefault(value: newWalletBalanceString, key: "walletBalance")
                BaseUIViewController.setUserDefault(value: newCoinAmountString, key: "amount")
                walletBalance = Double(BaseUIViewController.getUserDefault(key: "walletBalance"))!
                coinAmount = Double(BaseUIViewController.getUserDefault(key: "amount"))!
                setCoinDetails()
                
                showAlert(Message: "Bought \(tfCoinAmount.text!) BTC successfully for ₹\(tfAmount.text!)", Title: "Crypto Exchange")
                
                tfAmount.text = ""
                tfCoinAmount.text = ""
                
            }
            
        }
        
    }
    
    @IBAction func btn25(_ sender: UIButton) {
        
        setDefault()
        btn25.backgroundColor = UIColor(named: "bluePop")
        
        if buttonTag == 1 {
            
            let amount = (0.25) * coinAmount
            tfCoinAmount.text = String(format: "%.5f", amount)
            
            let price = (amount)*(coinCurrentPrice)
            tfAmount.text = String(format: "%.1f", price)
            
        }
        else {
            
            let price = (0.25) * walletBalance
            tfAmount.text = String(format: "%.1f", price)
            
            let amount = (price)/(coinCurrentPrice)
            tfCoinAmount.text = String(format: "%.5f", amount)
            
        }
        
    }
    
    @IBAction func btn50(_ sender: UIButton) {
        
        setDefault()
        btn50.backgroundColor = UIColor(named: "bluePop")
        
        if buttonTag == 1 {
            
            let amount = (0.50) * coinAmount
            tfCoinAmount.text = String(format: "%.5f", amount)
            
            let price = (amount)*(coinCurrentPrice)
            tfAmount.text = String(format: "%.1f", price)
            
        }
        else {
            
            let price = (0.50) * walletBalance
            tfAmount.text = String(format: "%.1f", price)
            
            let amount = (price)/(coinCurrentPrice)
            tfCoinAmount.text = String(format: "%.5f", amount)
            
        }
        
    }
    
    @IBAction func btn75(_ sender: UIButton) {
        
        setDefault()
        btn75.backgroundColor = UIColor(named: "bluePop")
        
        if buttonTag == 1 {
            
            let amount = (0.75) * coinAmount
            tfCoinAmount.text = String(format: "%.5f", amount)
            
            let price = (amount)*(coinCurrentPrice)
            tfAmount.text = String(format: "%.1f", price)
            
        }
        else {
            
            let price = (0.75) * walletBalance
            tfAmount.text = String(format: "%.1f", price)
            
            let amount = (price)/(coinCurrentPrice)
            tfCoinAmount.text = String(format: "%.5f", amount)
            
        }
        
    }
    
    @IBAction func btn100(_ sender: UIButton) {
        
        setDefault()
        btn100.backgroundColor = UIColor(named: "bluePop")
        
        if buttonTag == 1 {
            
            let amount = coinAmount
            tfCoinAmount.text = String(format: "%.5f", amount)
            
            let price = (amount)*(coinCurrentPrice)
            tfAmount.text = String(format: "%.1f", price)
            
        }
        else {
            
            let price = walletBalance
            tfAmount.text = String(format: "%.1f", price)
            
            let amount = (price)/(coinCurrentPrice)
            tfCoinAmount.text = String(format: "%.5f", amount)
            
        }
        
    }
    
    func setDefault() {
        
        btn25.backgroundColor = UIColor(named: "tealPop")
        btn50.backgroundColor = UIColor(named: "tealPop")
        btn75.backgroundColor = UIColor(named: "tealPop")
        btn100.backgroundColor = UIColor(named: "tealPop")
        
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        if tfAmount == nil{
            tfAmount.placeholder = "₹"
            tfCoinAmount.placeholder = "BTC"
        }
        else {
            
            if buttonTag == 1 {
                
                let amount = Double(tfCoinAmount.text ?? "0") ?? 0
                tfAmount.text = String(format: "%.1f", (coinCurrentPrice * amount))
                if tfAmount.text == String(format: "%.1f", 0.0) {
                    tfAmount.text = ""
                
            }
            }
            else {
                
                let price = Double(tfAmount.text ?? "0") ?? 0
                tfCoinAmount.text = String(format: "%.6f", ((price)/coinCurrentPrice))
                if tfCoinAmount.text == String(format: "%.6f", 0.000000) {
                    tfCoinAmount.text = ""
                }
                
            }
            
        }
        
    }
    
    @objc func clearTf(sender: UITextField) {

        guard
            let tfAmountTextValue = tfAmount.text, !tfAmountTextValue.isEmpty,
            let tfCoinAmountTextValue = tfCoinAmount.text, !tfCoinAmountTextValue.isEmpty
        else {
            setDefault()
            return

        }
        setDefault()

    }
    
}
