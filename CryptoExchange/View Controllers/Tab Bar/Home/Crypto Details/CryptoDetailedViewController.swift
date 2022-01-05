//
//  CryptoDetailedViewController.swift
//  CryptoExchange
//
//  Created by Shwait Kumar on 03/01/22.
//

import UIKit

class CryptoDetailedViewController : BaseUIViewController {
    
    @IBOutlet weak var tblCryptoDetail: UITableView!
    
    @IBOutlet weak var btnBuy: UIButton!
    @IBOutlet weak var btnSell: UIButton!
    
    var aboutState = false
    var reasoningState = false
    
    var buttonTag = 0
    
    var coinCurrentPrice = 0.0
    var coinAmount = 0.0
    
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnBuy.layer.cornerRadius = 8
        btnSell.layer.cornerRadius = 8
        
        setButtonShadow(btn: btnBuy, shadowColor: "whitePop")
        setButtonShadow(btn: btnSell, shadowColor: "whitePop")
        
        btnBuy.addTarget(self, action: #selector(btnBuyTapped(_:)), for: .touchUpInside)
        btnSell.addTarget(self, action: #selector(btnSellTapped(_:)), for: .touchUpInside)
        
        self.tblCryptoDetail.delegate = self
        self.tblCryptoDetail.dataSource = self
        
        coinCurrentPrice = Double(BaseUIViewController.getUserDefault(key: "coinPrice"))!
        coinAmount = Double(BaseUIViewController.getUserDefault(key: "amount"))!
        
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tblCryptoDetail.addSubview(refreshControl)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.navigationBar.isHidden = false
        
    }
    
    @objc func refresh(_ sender: AnyObject) {
        
       // Code to refresh table view
        coinCurrentPrice = Double(BaseUIViewController.getUserDefault(key: "coinPrice"))!
        coinAmount = Double(BaseUIViewController.getUserDefault(key: "amount"))!
        
        refreshControl.endRefreshing()
        tblCryptoDetail.reloadData()
    }
    
    @objc func btnBuyTapped(_ sender: UIButton){
        
        buttonTag = 0
        self.performSegue(withIdentifier: "toBuyOrSellCoin", sender: nil)
        
    }
    
    @objc func btnSellTapped(_ sender: UIButton){
        
        buttonTag = 1
        self.performSegue(withIdentifier: "toBuyOrSellCoin", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toBuyOrSellCoin" {
        
            let destinationVC = segue.destination as! BuyOrSellCoinViewController
            destinationVC.buttonTag = self.buttonTag
            
        }
    }
    
}

extension CryptoDetailedViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptDetailsTableViewCell", for: indexPath) as! CryptDetailsTableViewCell
        
        let price = String(format: "%.1f", coinCurrentPrice)
        cell.lblCoinPrice.text = "₹\(price)"
        
        let amount = String(format: "%.5f", coinAmount)
        cell.lblCoinAmount.text = amount
        
        if aboutState == false {
            cell.viewExpandableAbout.isHidden = true
            cell.btnAbout.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        }
        else {
            cell.viewExpandableAbout.isHidden = false
            cell.btnAbout.setImage(UIImage(systemName: "chevron.up"), for: .normal)
        }
        
        if reasoningState == false {
            cell.viewExpandableReason.isHidden = true
            cell.btnReason.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        }
        else {
            cell.viewExpandableReason.isHidden = false
            cell.btnReason.setImage(UIImage(systemName: "chevron.up"), for: .normal)
        }
        
        cell.btnAbout.tag = indexPath.row
        cell.btnAbout.addTarget(self, action: #selector(btnAboutExpandTapped(_:)), for: .touchUpInside)
        
        cell.btnReason.tag = indexPath.row
        cell.btnReason.addTarget(self, action: #selector(btnReasoningExpandTapped(_:)), for: .touchUpInside)
        
        let tapAbout = UITapGestureRecognizer(target: self, action:  #selector(self.viewAboutTapped))
        cell.viewAbout.tag = indexPath.row
        cell.viewAbout.addGestureRecognizer(tapAbout)
        
        let tapReason = UITapGestureRecognizer(target: self, action:  #selector(self.viewReasonTapped))
        cell.viewReason.tag = indexPath.row
        cell.viewReason.addGestureRecognizer(tapReason)
        
        cell.btnTransactions.tag = indexPath.row
        cell.btnTransactions.addTarget(self, action: #selector(btnTransactionsTapped(_:)), for: .touchUpInside)
        
        return cell
        
    }
      
    @objc func btnAboutExpandTapped(_ sender: UIButton){
        expandAbout()
    }
    
    @objc func btnReasoningExpandTapped(_ sender: UIButton){
        expandReason()
    }
    
    @IBAction func viewAboutTapped(sender: UITapGestureRecognizer){
        expandAbout()
    }
    
    @IBAction func viewReasonTapped(sender: UITapGestureRecognizer){
        expandReason()
    }
    
    @objc func btnTransactionsTapped(_ sender: UIButton){
        
        performSegue(withIdentifier: "toTransactions", sender: nil)
        
    }
    
    func expandAbout() {
        aboutState = !aboutState
        tblCryptoDetail.reloadData()
    }
    
    func expandReason() {
        reasoningState = !reasoningState
        tblCryptoDetail.reloadData()
    }
    
}

class CryptDetailsTableViewCell : UITableViewCell {
    
    @IBOutlet weak var viewHighestAndLowest: UIView!
    
    @IBOutlet weak var viewAbout: UIVisualEffectView!
    @IBOutlet weak var viewExpandableAbout: UIVisualEffectView!
    @IBOutlet weak var viewReason: UIVisualEffectView!
    @IBOutlet weak var viewExpandableReason: UIVisualEffectView!
    
    @IBOutlet weak var btnTransactions: UIButton!
    @IBOutlet weak var btnAbout: UIButton!
    @IBOutlet weak var btnReason: UIButton!
    
    @IBOutlet weak var lblCoinPrice: UILabel!
    @IBOutlet weak var lblCoinAmount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewHighestAndLowest.layer.cornerRadius = 8
        
        btnTransactions.layer.cornerRadius = 8
        
        setButtonShadow(btn: btnTransactions, shadowColor: "whitePop")
        
        setViewShadow(view: viewHighestAndLowest, shadowColor: "whitePop")
        
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
    
    func setViewShadow(view: UIView, shadowColor: String) {
        
        view.layer.shadowRadius = 8
        view.layer.shadowOffset = .zero
        view.layer.shadowOpacity = 0.20
        view.layer.shadowColor = UIColor(named: shadowColor)?.cgColor

    }
    
}
