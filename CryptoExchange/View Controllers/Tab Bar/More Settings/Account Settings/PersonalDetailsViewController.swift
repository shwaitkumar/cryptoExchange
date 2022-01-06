//
//  PersonalDetailsViewController.swift
//  CryptoExchange
//
//  Created by Shwait Kumar on 06/01/22.
//

import UIKit
import Kingfisher

class PersonalDetailsViewController : BaseUIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var btnContinue: UIButton!
    
    @IBOutlet weak var tblPersonalDetails: UITableView!
    
    var fullName = ""
    var dob = ""
    
    var imagePicker:UIImagePickerController?
    private weak var delegate: UIImagePickerControllerDelegate?
    
    var userBase64 = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnContinue.layer.cornerRadius = 8
        
        self.tblPersonalDetails.delegate = self
        self.tblPersonalDetails.dataSource = self
        
        self.imagePicker = UIImagePickerController()
        self.imagePicker?.delegate = self
        
        getUserDetails()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.navigationBar.isHidden = false
        
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
            BaseUIViewController.setUserDefault(value: userBase64, key: "userPic")
            
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
        if BaseUIViewController.getUserDefault(key: "userPic") != "" {
            userBase64 = BaseUIViewController.getUserDefault(key: "userPic")
        }
        
        self.tblPersonalDetails.reloadData()
        
    }
    
    func openCameraGallery()
    {

        let alert = UIAlertController(title: "Crypto Exchange", message: "Select Option", preferredStyle: .actionSheet)
            
        alert.addAction(UIAlertAction(title: "Camera", style: .default , handler:{ (UIAlertAction)in
                self.present(self.imagePicker!, animated: true, completion: {
                    self.imagePicker?.sourceType = .camera
                    //self.imagePicker?.allowsEditing = true
                    self.imagePicker?.delegate = self
                })
            }))
            
        alert.addAction(UIAlertAction(title: "Gallery", style: .default , handler:{ (UIAlertAction)in
                
                self.present(self.imagePicker!, animated: true, completion: {
                    self.imagePicker?.sourceType = .photoLibrary
                    //self.imagePicker?.allowsEditing = true
                    self.imagePicker?.delegate = self
                })
            }))
            
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler:{ (UIAlertAction)in
                print("User click Dismiss button")
            }))
            
            self.present(alert, animated: true, completion: {
                print("completion block")
        })
    }
    
    //MARK: UIImagePickerControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = tblPersonalDetails.cellForRow(at: indexPath)
        
        let ivUser = cell!.viewWithTag(3) as! UIImageView
        
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        {
            ivUser.image = editedImage.fixedOrientation()
        }
        else  if let editedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        {
            ivUser.image = editedImage.fixedOrientation()
        }
        
        //Dismiss the UIImagePicker after selection
        picker.dismiss(animated: true, completion: nil)
        
        getImageBase64()
    }
    
    //MARK: Image picker delegate methods
    func doneButtonDidPress(_ imagePicker: UIImagePickerController, images: [UIImage]) {
        
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = tblPersonalDetails.cellForRow(at: indexPath)
        
        let ivUser = cell!.viewWithTag(3) as! UIImageView
        
        ivUser.image = images[0].fixedOrientation()
        
        getImageBase64()
    }
    
    func cancelButtonDidPress(_ imagePicker: UIImagePickerController) {
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func wrapperDidPress(_ imagePicker: UIImagePickerController, images: [UIImage]) {
        
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = tblPersonalDetails.cellForRow(at: indexPath)
        
        let ivUser = cell!.viewWithTag(3) as! UIImageView
        
        ivUser.image = images[0].fixedOrientation()
        
        getImageBase64()
    }
    
    func getImageBase64()
    {
        
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = tblPersonalDetails.cellForRow(at: indexPath)
        
        let ivUser = cell!.viewWithTag(3) as! UIImageView
        
        if(ivUser.image != nil)
        {
            let imageData:NSData = ivUser.image!.jpegData(compressionQuality:  0.3)! as NSData
            userBase64 = imageData.base64EncodedString(options: .lineLength64Characters)
        }
        
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
        
        if userBase64 != "" {
            let dataDecoded : Data = Data(base64Encoded: userBase64, options: .ignoreUnknownCharacters)!
            let decodedimage:UIImage = UIImage(data: dataDecoded as Data)!
            print(decodedimage)
            cell.ivUser.image = decodedimage
        }
        
        let tapUserPic = UITapGestureRecognizer(target: self, action:  #selector(self.userPicTapped))
        cell.viewOverImage.tag = indexPath.row
        cell.viewOverImage.addGestureRecognizer(tapUserPic)
        
        return cell
        
    }
    
    @IBAction func userPicTapped(sender: UITapGestureRecognizer){
        openCameraGallery()
    }
    
}

class PersonlDetailsTableViewCell : UITableViewCell {
    
    @IBOutlet weak var viewUserPic: UIView!
    @IBOutlet weak var viewOverImage: UIView!
    
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

