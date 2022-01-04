//
//  MoreViewController.swift
//  CryptoExchange
//
//  Created by Shwait Kumar on 04/01/22.
//

import UIKit

class MoreViewController : BaseUIViewController {
    
    @IBOutlet weak var viewPersonal: UIView!
    @IBOutlet weak var viewUserPic: UIView!
    
    @IBOutlet weak var ivUser: UIImageView!
    
    @IBOutlet weak var tblMore: UITableView!
    
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
        
    }
    
    @IBAction func viewPersonalTapped(sender: UITapGestureRecognizer){

       performSegue(withIdentifier: "toTotalWorth4", sender: nil)

    }
    
}

extension MoreViewController : UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoreTableViewCell", for: indexPath) as! MoreTableViewCell
        
        if indexPath.row == 0 {
            cell.ivIcon.image = UIImage(systemName: "person.fill")
            cell.lblTitle.text = "Account Settings"
        }
        else if indexPath.row == 1 {
            cell.ivIcon.image = UIImage(systemName: "lock.fill")
            cell.lblTitle.text = "Security"
        }
        else if indexPath.row == 2 {
            cell.ivIcon.image = UIImage(systemName: "clock.fill")
            cell.lblTitle.text = "History"
        }
        else if indexPath.row == 3 {
            cell.ivIcon.image = UIImage(systemName: "questionmark.circle.fill")
            cell.lblTitle.text = "Help & Support"
        }
        else if indexPath.row == 4 {
            cell.ivIcon.image = UIImage(systemName: "info.circle.fill")
            cell.lblTitle.text = "About"
        }
        else {
            cell.ivIcon.image = UIImage(systemName: "rectangle.portrait.and.arrow.right.fill")
            cell.lblTitle.text = "Logout"
        }
        
        return cell
        
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
