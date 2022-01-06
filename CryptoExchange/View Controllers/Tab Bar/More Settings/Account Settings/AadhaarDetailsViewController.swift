//
//  AadhaarDetailsViewController.swift
//  CryptoExchange
//
//  Created by Shwait Kumar on 06/01/22.
//

import UIKit

class AadhaarDetailsViewController : BaseUIViewController {
    
    @IBOutlet weak var btnUpload: UIButton!
    
    @IBOutlet weak var tblAadhaarDetails: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnUpload.layer.cornerRadius = 8
        
        self.tblAadhaarDetails.delegate = self
        self.tblAadhaarDetails.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func btnUpload(_ sender: Any) {
        
        showAlert(Message: "Feature not available yet", Title: "Crypto Exchange")
        
    }
    
}

extension AadhaarDetailsViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AadhaarDetailsTableViewCell", for: indexPath) as! AadhaarDetailsTableViewCell
        
        return cell
        
    }
    
}

class AadhaarDetailsTableViewCell : UITableViewCell {
    
    @IBOutlet weak var viewAadhaarCardFrontPic: UIView!
    
    @IBOutlet weak var viewAadhaarCardBackPic: UIView!
    
    @IBOutlet weak var ivAadhaarCardFront: UIImageView!
    @IBOutlet weak var ivAadhaarCardBack: UIImageView!
    
    @IBOutlet weak var tfAadhaarCardNumber: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewAadhaarCardFrontPic.layer.cornerRadius = 12
        viewAadhaarCardBackPic.layer.cornerRadius = 12
        
        setViewShadow(view: viewAadhaarCardFrontPic, shadowColor: "whitePop")
        setViewShadow(view: viewAadhaarCardBackPic, shadowColor: "whitePop")
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        
    }
    
    func setViewShadow(view: UIView, shadowColor: String) {
        
        view.layer.shadowRadius = 8
        view.layer.shadowOffset = .zero
        view.layer.shadowOpacity = 0.20
        view.layer.shadowColor = UIColor(named: shadowColor)?.cgColor

    }
    
}
