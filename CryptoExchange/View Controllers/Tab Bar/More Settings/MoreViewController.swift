//
//  MoreViewController.swift
//  CryptoExchange
//
//  Created by Shwait Kumar on 04/01/22.
//

import UIKit

class MoreViewController : UIViewController {
    
    @IBOutlet weak var viewPersonal: UIView!
    @IBOutlet weak var viewUserPic: UIView!
    
    @IBOutlet weak var ivUser: UIImageView!
    
    @IBOutlet weak var tblMore: UITableView!
    
    @IBOutlet weak var lblWalletBalance: UILabel!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var coinCurrentPrice = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewUserPic.layer.cornerRadius = 28
        ivUser.layer.cornerRadius = 27
        
        setViewShadow(view: viewUserPic, shadowColor: "whitePop")
        
        self.tblMore.delegate = self
        self.tblMore.dataSource = self
        
        let tapPersonalView = UITapGestureRecognizer(target: self, action:  #selector(self.viewPersonalTapped))
        viewPersonal.addGestureRecognizer(tapPersonalView)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.navigationBar.isHidden = true
        
       getUserDetails()
        
    }
    
    @IBAction func viewPersonalTapped(sender: UITapGestureRecognizer){

       performSegue(withIdentifier: "toTotalWorth4", sender: nil)

    }
    
    func setViewShadow(view: UIView, shadowColor: String) {
        
        view.layer.shadowRadius = 8
        view.layer.shadowOffset = .zero
        view.layer.shadowOpacity = 0.20
        view.layer.shadowColor = UIColor(named: shadowColor)?.cgColor

    }
    
    func getUserDetails() {
        
        if BaseUIViewController.getUserDefault(key: "amount") == "" {
            BaseUIViewController.setUserDefault(value: "100", key: "amount")
        }
        else if BaseUIViewController.getUserDefault(key: "walletBalance") == "" {
            BaseUIViewController.setUserDefault(value: "999999", key: "walletBalance")
            lblWalletBalance.text = " ₹\(BaseUIViewController.getUserDefault(key: "walletBalance"))"
        }
        else if BaseUIViewController.getUserDefault(key: "coinPrice") == "" {
            BaseUIViewController.setUserDefault(value: "4365671.79", key: "coinPrice")
            coinCurrentPrice = 4365671.79
        }
        else {
            lblWalletBalance.text = " ₹\(BaseUIViewController.getUserDefault(key: "walletBalance"))"
            coinCurrentPrice = Double(BaseUIViewController.getUserDefault(key: "coinPrice"))!
        }
        
    }

    
}

extension MoreViewController : UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoreTableViewCell", for: indexPath) as! MoreTableViewCell
        
        if indexPath.row == 0 {
            cell.ivIcon.image = UIImage(systemName: "person.fill")
            cell.lblTitle.text = "Account Settings"
        }
        else if indexPath.row == 1 {
            cell.ivIcon.image = UIImage(systemName: "building.columns.fill")
            cell.lblTitle.text = "Bank Details"
        }
        else if indexPath.row == 2 {
            cell.ivIcon.image = UIImage(systemName: "lock.fill")
            cell.lblTitle.text = "Password & Security"
        }
        else if indexPath.row == 3 {
            cell.ivIcon.image = UIImage(systemName: "clock.fill")
            cell.lblTitle.text = "History"
        }
        else if indexPath.row == 4 {
            cell.ivIcon.image = UIImage(systemName: "questionmark.circle.fill")
            cell.lblTitle.text = "Help & Support"
        }
        else if indexPath.row == 5 {
            cell.ivIcon.image = UIImage(systemName: "info.circle.fill")
            cell.lblTitle.text = "About"
        }
        else {
            cell.ivIcon.image = UIImage(systemName: "rectangle.portrait.and.arrow.right.fill")
            cell.lblTitle.text = "Logout"
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 0 {
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "AccountSettingsViewController") as! AccountSettingsViewController
            navigationController?.pushViewController(vc, animated: true)
            
        }
        else if indexPath.row == 1 {
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "BankDetailsViewController") as! BankDetailsViewController
            navigationController?.pushViewController(vc, animated: true)
            
        }
        else if indexPath.row == 2 {
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "SecurityViewController") as! SecurityViewController
            navigationController?.pushViewController(vc, animated: true)
            
        }
        else if indexPath.row == 3 {
            
            showAlert(Message: "Feature not available yet", Title: "Crypto Exchange")
            
        }
        else if indexPath.row == 4 {
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "HelpAndSupportViewController") as! HelpAndSupportViewController
            navigationController?.pushViewController(vc, animated: true)
            
        }
        else if indexPath.row == 5 {
            
            showAlert(Message: "Feature not available yet", Title: "Crypto Exchange")
            
        }
        else {
            
            let domain = Bundle.main.bundleIdentifier!
            UserDefaults.standard.removePersistentDomain(forName: domain)
            UserDefaults.standard.synchronize()
            print(Array(UserDefaults.standard.dictionaryRepresentation().keys).count)
            
            appDelegate.pushToLoginViewController()
            
        }
        
    }
    
    func showAlert(Message:String, Title: String){
    
        let alert = UIAlertController (title: Title, message: Message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler:{ (alertOKAction) in }))
        self.present(alert, animated: true, completion: nil)
    
    }

}

class MoreTableViewCell : UITableViewCell {
    
    @IBOutlet weak var ivIcon: UIImageView!
    
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        
    }
    
}
