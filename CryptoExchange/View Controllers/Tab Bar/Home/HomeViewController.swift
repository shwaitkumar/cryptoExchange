//
//  HomeViewController.swift
//  CryptoExchange
//
//  Created by Shwait Kumar on 02/01/22.
//

import UIKit

class HomeViewController : BaseUIViewController {
    
    @IBOutlet weak var viewUserPicBorder: UIView!
    @IBOutlet weak var viewSendCrypto: UIView!
    @IBOutlet weak var viewReceiveCrypto: UIView!
    @IBOutlet weak var viewConvertCrypto: UIView!
    @IBOutlet weak var viewDepositMoney: UIView!
    @IBOutlet weak var viewWithdrawMoney: UIView!
    @IBOutlet weak var viewReferAndEarn: UIView!
    @IBOutlet weak var viewPersonal: UIView!
    
    @IBOutlet weak var cvWatchlist: UICollectionView!
    @IBOutlet weak var cvPopularCoins: UICollectionView!
    
    @IBOutlet weak var ivUserPic: UIImageView!
    @IBOutlet weak var ivGift: UIImageView!
    
    @IBOutlet weak var lblWalletBalance: UILabel!
    
    var coinCurrentPrice = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewUserPicBorder.layer.cornerRadius = 28
        viewSendCrypto.layer.cornerRadius = 8
        viewReceiveCrypto.layer.cornerRadius = 8
        viewConvertCrypto.layer.cornerRadius = 8
        ivUserPic.layer.cornerRadius = 27
        
        setViewShadow(view: viewUserPicBorder, shadowColor: "whitePop")
        setViewShadow(view: viewDepositMoney, shadowColor: "whitePop")
        setViewShadow(view: viewWithdrawMoney, shadowColor: "whitePop")
        setViewShadow(view: viewReferAndEarn, shadowColor: "whitePop")
        
        self.cvWatchlist.delegate = self
        self.cvPopularCoins.delegate = self
        self.cvWatchlist.dataSource = self
        self.cvPopularCoins.dataSource = self
        
        viewReferAndEarn.layer.cornerRadius = 12
        viewDepositMoney.layer.cornerRadius = 8
        viewWithdrawMoney.layer.cornerRadius = 8
        
        let tapPersonalView = UITapGestureRecognizer(target: self, action:  #selector(self.viewPersonalTapped))
        viewPersonal.addGestureRecognizer(tapPersonalView)
        
        let tapDeposit = UITapGestureRecognizer(target: self, action:  #selector(self.depositButtonTapped))
        viewDepositMoney.addGestureRecognizer(tapDeposit)
        
        let tapWithdraw = UITapGestureRecognizer(target: self, action:  #selector(self.withdrawButtonTapped))
        viewWithdrawMoney.addGestureRecognizer(tapWithdraw)
        
        let tapReferAndEarn = UITapGestureRecognizer(target: self, action:  #selector(self.viewReferAndEarnTapped))
        viewReferAndEarn.addGestureRecognizer(tapReferAndEarn)
        
        let randomGeneratedNumber = Int.random(in: 1..<6)
        setGiftImage(randomNumber: randomGeneratedNumber)
        
        getUserDetails()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.navigationBar.isHidden = true
        
        getUserDetails()
        
    }
    
    @IBAction func viewPersonalTapped(sender: UITapGestureRecognizer){

       performSegue(withIdentifier: "toTotalWorth", sender: nil)

    }
    
    @IBAction func depositButtonTapped(sender: UITapGestureRecognizer){

        let vc = storyboard?.instantiateViewController(withIdentifier: "DepositMoneyViewController") as! DepositMoneyViewController
        navigationController?.pushViewController(vc, animated: true)

    }
    
    @IBAction func withdrawButtonTapped(sender: UITapGestureRecognizer){

        let vc = storyboard?.instantiateViewController(withIdentifier: "WithdrawMoneyViewController") as! WithdrawMoneyViewController
        navigationController?.pushViewController(vc, animated: true)

    }
    
    @IBAction func viewReferAndEarnTapped(sender: UITapGestureRecognizer){

       performSegue(withIdentifier: "toReferAndEarn", sender: nil)

    }
    
    func setGiftImage(randomNumber : Int) {
        
        ivGift.image = UIImage(named: "gift\(randomNumber)")
        
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
            cvWatchlist.reloadData()
            cvPopularCoins.reloadData()
        }
        else {
            lblWalletBalance.text = " ₹\(BaseUIViewController.getUserDefault(key: "walletBalance"))"
            coinCurrentPrice = Double(BaseUIViewController.getUserDefault(key: "coinPrice"))!
            cvWatchlist.reloadData()
            cvPopularCoins.reloadData()
        }
        
    }
    
}

class WatchListCollectionViewCell : UICollectionViewCell {
    
    @IBOutlet weak var lblCoinPrice: UILabel!
    
    @IBOutlet weak var viewCardWatchlist: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewCardWatchlist.layer.cornerRadius = 12
        
    }
    
}

class PopularCoinsCollectionViewCell : UICollectionViewCell {
    
    @IBOutlet weak var lblCoinPrice: UILabel!
    
    @IBOutlet weak var viewCardPopularCoins: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewCardPopularCoins.layer.cornerRadius = 12
        
    }
    
}

extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == cvWatchlist {
            
            return 13
            
        }
        else {
            
            return 4
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == cvWatchlist {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WatchListCollectionViewCell", for: indexPath) as! WatchListCollectionViewCell
            
            let price = String(format: "%.1f", coinCurrentPrice)
            cell.lblCoinPrice.text = "₹\(price)"
            
            let tapCoinCardCell = UITapGestureRecognizer(target: self, action:  #selector(self.coinCardTapped))
            cell.viewCardWatchlist.tag = indexPath.row
            cell.viewCardWatchlist.addGestureRecognizer(tapCoinCardCell)
            
            return cell
            
        }
        else {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularCoinsCollectionViewCell", for: indexPath) as! PopularCoinsCollectionViewCell
            
            let price = String(format: "%.1f", coinCurrentPrice)
            cell.lblCoinPrice.text = "₹\(price)"
            
            let tapCoinCardCell = UITapGestureRecognizer(target: self, action:  #selector(self.coinCardTapped))
            cell.viewCardPopularCoins.tag = indexPath.row
            cell.viewCardPopularCoins.addGestureRecognizer(tapCoinCardCell)
            
            return cell
            
        }
        
    }
    
    @IBAction func coinCardTapped(sender: UITapGestureRecognizer) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "CryptoDetailedViewController") as! CryptoDetailedViewController
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
