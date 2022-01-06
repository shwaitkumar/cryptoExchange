//
//  PersonalDetailsViewController.swift
//  CryptoExchange
//
//  Created by Shwait Kumar on 06/01/22.
//

import UIKit

class PersonalDetailsViewController : BaseUIViewController {
    
    @IBOutlet weak var btnContinue: UIButton!
    
    @IBOutlet weak var tblPersonalDetails: UITableView!
    
    var fullName = ""
    var dob = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnContinue.layer.cornerRadius = 8
        
        self.tblPersonalDetails.delegate = self
        self.tblPersonalDetails.dataSource = self
        
        getUserDetails()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.navigationBar.isHidden = false
        
    }
    
    @IBAction func btnCalender(_ sender: UIButton) {
        
        
        
    }
    
    @IBAction func btnContinue(_ sender: UIButton) {
        
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = tblPersonalDetails.cellForRow(at: indexPath)
        
        let nameTf = cell!.viewWithTag(1) as! UITextField
        let dobTf = cell!.viewWithTag(2) as! UITextField
        
        let nameInString = nameTf.text!
        let dobInString = dobTf.text!
        
        if nameInString == "" {
            showAlert(Message: "Enter your Full Name", Title: "Crypto Exchange")
        }
        else if dobInString == "" {
            showAlert(Message: "Enter your Date of Birth", Title: "Crypto Exchange")
        }
        else {
            
            BaseUIViewController.setUserDefault(value: nameInString, key: "fullName")
            BaseUIViewController.setUserDefault(value: dobInString, key: "dateOfBirth")
            
            showAlert(Message: "Personal Details updated successfully", Title: "Crypto Exchange")
            getUserDetails()
            self.tblPersonalDetails.reloadData()
            
        }
        
    }
    
    func getUserDetails() {
        
        if BaseUIViewController.getUserDefault(key: "fullName") != "" {
            fullName = BaseUIViewController.getUserDefault(key: "fullName")
        }

        if BaseUIViewController.getUserDefault(key: "dateOfBirth") != "" {
            dob = BaseUIViewController.getUserDefault(key: "dateOfBirth")
        }
        
        self.tblPersonalDetails.reloadData()
        
    }
    
}

extension PersonalDetailsViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonlDetailsTableViewCell", for: indexPath) as! PersonlDetailsTableViewCell
        
        cell.tfName.text = fullName
        cell.tfDob.text = dob
        
        return cell
        
    }
    
}

class PersonlDetailsTableViewCell : UITableViewCell {
    
    @IBOutlet weak var viewUserPic: UIView!
    
    @IBOutlet weak var ivUser: UIImageView!
    
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfDob: UITextField!
    
    @IBOutlet weak var btnCalender: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewUserPic.layer.cornerRadius = 70
        ivUser.layer.cornerRadius = 69
        
        setViewShadow(view: viewUserPic, shadowColor: "whitePop")
        
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
