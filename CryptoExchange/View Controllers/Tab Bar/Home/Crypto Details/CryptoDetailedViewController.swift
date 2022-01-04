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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tblCryptoDetail.delegate = self
        self.tblCryptoDetail.dataSource = self
        
        btnBuy.layer.cornerRadius = 8
        btnSell.layer.cornerRadius = 8
        
        setButtonShadow(btn: btnBuy, shadowColor: "whitePop")
        setButtonShadow(btn: btnSell, shadowColor: "whitePop")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
}

extension CryptoDetailedViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptDetailsTableViewCell", for: indexPath) as! CryptDetailsTableViewCell
        
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
    @IBOutlet weak var viewAbout: UIView!
    @IBOutlet weak var viewExpandableAbout: UIView!
    @IBOutlet weak var viewReason: UIView!
    @IBOutlet weak var viewExpandableReason: UIView!
    
    @IBOutlet weak var btnTransactions: UIButton!
    @IBOutlet weak var btnAbout: UIButton!
    @IBOutlet weak var btnReason: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewHighestAndLowest.layer.cornerRadius = 8
        
        btnTransactions.layer.cornerRadius = 8
        
        setButtonShadow(btn: btnTransactions, shadowColor: "whitePop")
        
        setViewShadow(view: viewHighestAndLowest, shadowColor: "whitePop")
        setViewShadow(view: viewAbout, shadowColor: "whitePop")
        setViewShadow(view: viewExpandableAbout, shadowColor: "whitePop")
        setViewShadow(view: viewReason, shadowColor: "whitePop")
        setViewShadow(view: viewExpandableReason, shadowColor: "whitePop")
        
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
