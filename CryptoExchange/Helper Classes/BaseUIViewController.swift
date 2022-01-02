//
//  BaseUIViewController.swift
//  CryptoExchange
//
//  Created by Shwait Kumar on 02/01/22.
//

import UIKit

class BaseUIViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    func dismissDetail() {
        let transition = CATransition()
        transition.duration = 0.25
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        self.view.window!.layer.add(transition, forKey: kCATransition)

        dismiss(animated: false)
    }
    
    func showAlert(Message:String, Title: String){
    
        let alert = UIAlertController (title: Title, message: Message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler:{ (alertOKAction) in }))
        self.present(alert, animated: true, completion: nil)
    
    }
    
    
    func showAlertOk(Message:String,Title: String, type: Int){
    
        let alert = UIAlertController.init(title: Title, message: Message, preferredStyle: .alert)
        
        let yes = UIAlertAction(title: "Ok", style: .default) { (aelrt) in
            
            if type == 1
            {
                self.navigationController?.popViewController(animated: true)
            }
            else
            {
                self.navigationController?.popViewController(animated: true)
            }
        }
        alert.addAction(yes)
        
        self.present(alert, animated: true)
        
    }
    
    func popThisView() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func checkValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func removeLastViewController()
    {
        guard let navigationController = self.navigationController else { return }
        var navigationArray = navigationController.viewControllers // To get all UIViewController stack as Array
        navigationArray.remove(at: navigationArray.count - 2) // To remove previous UIViewController
        self.navigationController?.viewControllers = navigationArray
    }
    
    func setButtonShadow(btn: UIButton, shadowColor: String) {
        
        btn.layer.shadowRadius = 20
        btn.layer.shadowOffset = .zero
        btn.layer.shadowOpacity = 0.3
        btn.layer.shadowColor = UIColor(named: shadowColor)?.cgColor

    }
  
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func setGradientBackground() {
        let colorTop = UIColor(red: 230.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 242.0/255.0, green: 242.0/255.0, blue: 243.0/255.0, alpha: 1.0).cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
                
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
    
}

extension UIImage {
    func fixOrientation() -> UIImage {
        if self.imageOrientation == UIImage.Orientation.up {
            return self
        }
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        self.draw(in: CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height))
        if let normalizedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext() {
            UIGraphicsEndImageContext()
            return normalizedImage
        } else {
            return self
        }
    }
}
