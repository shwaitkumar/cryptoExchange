//
//  PanCardDetailsViewController.swift
//  CryptoExchange
//
//  Created by Shwait Kumar on 06/01/22.
//

import UIKit

class PanCardDetailsViewController : BaseUIViewController {
    
    @IBOutlet weak var btnUpload: UIButton!
    
    @IBOutlet weak var tblPanCard: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnUpload.layer.cornerRadius = 8
        
        self.tblPanCard.delegate = self
        self.tblPanCard.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func btnUpload(_ sender: UIButton) {
        
        showAlert(Message: "Feature not available yet", Title: "Crypto Exchange")
        
    }
    
}

extension PanCardDetailsViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PanCardTableViewCell", for: indexPath) as! PanCardTableViewCell
        
        return cell
        
    }
    
}

class PanCardTableViewCell : UITableViewCell {
    
    @IBOutlet weak var viewPanCardPic: UIView!
    
    @IBOutlet weak var ivPanCard: UIImageView!
    
    @IBOutlet weak var tfPanCardNumber: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewPanCardPic.layer.cornerRadius = 12
        
        setViewShadow(view: viewPanCardPic, shadowColor: "whitePop")
        
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
