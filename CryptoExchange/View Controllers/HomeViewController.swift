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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewUserPicBorder.layer.cornerRadius = 28
        viewSendCrypto.layer.cornerRadius = 28
        viewReceiveCrypto.layer.cornerRadius = 28
        viewConvertCrypto.layer.cornerRadius = 28
        ivUserPic.layer.cornerRadius = 27
        
        setViewShadow(view: viewUserPicBorder, shadowColor: "whitePop")
        setViewShadow(view: viewSendCrypto, shadowColor: "whitePop")
        setViewShadow(view: viewReceiveCrypto, shadowColor: "whitePop")
        setViewShadow(view: viewConvertCrypto, shadowColor: "whitePop")
        
        self.cvWatchlist.delegate = self
        self.cvPopularCoins.delegate = self
        self.cvWatchlist.dataSource = self
        self.cvPopularCoins.dataSource = self
        
        viewPersonal.layer.cornerRadius = 4
        viewReferAndEarn.layer.cornerRadius = 4
        viewDepositMoney.layer.cornerRadius = 4
        viewWithdrawMoney.layer.cornerRadius = 4
        
        let tapPersonalView = UITapGestureRecognizer(target: self, action:  #selector(self.viewPersonalTapped))
        viewPersonal.addGestureRecognizer(tapPersonalView)
        
        let tapDeposit = UITapGestureRecognizer(target: self, action:  #selector(self.depositButtonTapped))
        viewDepositMoney.addGestureRecognizer(tapDeposit)
        
        let tapWithdraw = UITapGestureRecognizer(target: self, action:  #selector(self.withdrawButtonTapped))
        viewWithdrawMoney.addGestureRecognizer(tapWithdraw)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.navigationBar.isHidden = true
        
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
    
}

class WatchListCollectionViewCell : UICollectionViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}

class PopularCoinsCollectionViewCell : UICollectionViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
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
            
            return cell
            
        }
        else {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularCoinsCollectionViewCell", for: indexPath) as! PopularCoinsCollectionViewCell
            
            return cell
            
        }
        
    }
    
}
