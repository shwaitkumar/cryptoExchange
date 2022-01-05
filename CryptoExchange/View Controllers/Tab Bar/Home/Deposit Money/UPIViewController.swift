//
//  UPIViewController.swift
//  CryptoExchange
//
//  Created by Shwait Kumar on 04/01/22.
//

import UIKit

class UPIViewController : BaseUIViewController {
    
    @IBOutlet weak var tblUPI: UITableView!
    
    @IBOutlet weak var btnSubmit: UIButton!
    
    var upiAddress = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnSubmit.layer.cornerRadius = 8
        
        self.tblUPI.delegate = self
        self.tblUPI.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
}

extension UPIViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UPITableViewCell", for: indexPath) as! UPITableViewCell
        
        upiAddress = cell.lblUPIAddress.text!
        
        cell.btnCopy.tag = indexPath.row
        cell.btnCopy.addTarget(self, action: #selector(btnCopyTapped(_:)), for: .touchUpInside)
        
        return cell
        
    }
    
    @objc func btnCopyTapped(_ sender: UIButton){
        UIPasteboard.general.string = upiAddress
        if upiAddress != "" {
            showAlert(Message: "UPI Address copied successfully", Title: "Crypto Exchange")
        }
        else {
            tblUPI.reloadData()
            UIPasteboard.general.string = upiAddress
        }
    }
    
}

class UPITableViewCell : UITableViewCell {
   
    @IBOutlet weak var lblUPIAddress: UILabel!
    
    @IBOutlet weak var btnCopy: UIButton!
    
    @IBOutlet weak var ivQRCode: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setViewShadow(imageView: ivQRCode)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        
    }
    
    func setViewShadow(imageView: UIImageView) {
        
        imageView.layer.shadowRadius = 10
        imageView.layer.shadowOffset = .zero
        imageView.layer.shadowOpacity = 0.75
        imageView.layer.shadowColor = UIColor(named: "yellowPop")?.cgColor

    }
    
}
