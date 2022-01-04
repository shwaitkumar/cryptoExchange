//
//  PortfolioViewController.swift
//  CryptoExchange
//
//  Created by Shwait Kumar on 03/01/22.
//

import UIKit

class PortfolioViewController : BaseUIViewController {
    
    @IBOutlet weak var viewPersonal: UIView!
    @IBOutlet weak var viewUserPic: UIView!
    
    @IBOutlet weak var ivUser: UIImageView!
    
    @IBOutlet weak var tblPortfolio: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewUserPic.layer.cornerRadius = 28
        ivUser.layer.cornerRadius = 27
        
        setViewShadow(view: viewUserPic, shadowColor: "whitePop")
        
        self.tblPortfolio.delegate = self
        self.tblPortfolio.dataSource = self
        
        let tapPersonalView = UITapGestureRecognizer(target: self, action:  #selector(self.viewPersonalTapped))
        viewPersonal.addGestureRecognizer(tapPersonalView)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.navigationBar.isHidden = true
        
    }
    
    @IBAction func viewPersonalTapped(sender: UITapGestureRecognizer){

       performSegue(withIdentifier: "toTotalWorth2", sender: nil)

    }
    
}

extension PortfolioViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 24
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "PortfolioFixedDetailsTableViewCell", for: indexPath) as! PortfolioFixedDetailsTableViewCell
            
            return cell
            
        }
        else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "PortfolioTableViewCell", for: indexPath) as! PortfolioTableViewCell
            
            return cell
            
        }
        
    }
    
}

class PortfolioFixedDetailsTableViewCell : UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        
    }
    
}

class PortfolioTableViewCell : UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        
    }
    
}
