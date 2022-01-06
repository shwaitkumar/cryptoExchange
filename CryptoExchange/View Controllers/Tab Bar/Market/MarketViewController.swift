//
//  MarketViewController.swift
//  CryptoExchange
//
//  Created by Shwait Kumar on 04/01/22.
//

import UIKit

class MarketViewController : BaseUIViewController {
    
    @IBOutlet weak var viewPersonal: UIView!
    @IBOutlet weak var viewUserPic: UIView!
    
    @IBOutlet weak var ivUser: UIImageView!
    
    @IBOutlet weak var tblMarket: UITableView!
    
    @IBOutlet weak var lblWalletBalance: UILabel!
    @IBOutlet weak var lblName: UILabel!
    
    var coinCurrentPrice = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewUserPic.layer.cornerRadius = 28
        ivUser.layer.cornerRadius = 27
        
        setViewShadow(view: viewUserPic, shadowColor: "whitePop")
        
        self.tblMarket.delegate = self
        self.tblMarket.dataSource = self
        
        let tapPersonalView = UITapGestureRecognizer(target: self, action:  #selector(self.viewPersonalTapped))
        viewPersonal.addGestureRecognizer(tapPersonalView)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.navigationBar.isHidden = true
        
        getUserDetails()
        
    }
    
    @IBAction func viewPersonalTapped(sender: UITapGestureRecognizer){

       performSegue(withIdentifier: "toTotalWorth3", sender: nil)

    }
    
    func getUserDetails() {
        
        if BaseUIViewController.getUserDefault(key: "fullName") != "" {
            lblName.text = "Hi" + " " + BaseUIViewController.getUserDefault(key: "fullName") + "!"
        }
        else {
            lblName.text = "Hi!"
        }
        
        lblWalletBalance.text = " ₹\(BaseUIViewController.getUserDefault(key: "walletBalance"))"
        
        if BaseUIViewController.getUserDefault(key: "userPic") != "" {
            let userBase64 = BaseUIViewController.getUserDefault(key: "userPic")
            let dataDecoded : Data = Data(base64Encoded: userBase64, options: .ignoreUnknownCharacters)!
            let decodedimage:UIImage = UIImage(data: dataDecoded as Data)!
            print(decodedimage)
            ivUser.image = decodedimage
        }
        
    }
    
}

extension MarketViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 48
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "MarketControlsTableViewCell", for: indexPath) as! MarketControlsTableViewCell
            
            return cell
            
        }
        else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "MarketCoinDetailsTableViewCell", for: indexPath) as! MarketCoinDetailsTableViewCell
            
            let tapCoinCardCell = UITapGestureRecognizer(target: self, action:  #selector(self.coinCardTapped))
            cell.viewCard.tag = indexPath.row
            cell.viewCard.addGestureRecognizer(tapCoinCardCell)
            
            return cell
            
        }
    }
    
    @IBAction func coinCardTapped(sender: UITapGestureRecognizer) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "CryptoDetailedViewController") as! CryptoDetailedViewController
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

class MarketControlsTableViewCell : UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        
    }
    
}

class MarketCoinDetailsTableViewCell : UITableViewCell {
    
    @IBOutlet weak var viewCard: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        
    }
    
}
