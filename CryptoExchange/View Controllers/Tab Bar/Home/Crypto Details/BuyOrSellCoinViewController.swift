//
//  BuyOrSellCoinViewController.swift
//  CryptoExchange
//
//  Created by Shwait Kumar on 04/01/22.
//

import UIKit

class BuyOrSellCoinViewController : BaseUIViewController {
    
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var viewCoinPic: UIView!
    
    @IBOutlet weak var ivCoin: UIImageView!
    
    @IBOutlet weak var btn25: UIButton!
    @IBOutlet weak var btn50: UIButton!
    @IBOutlet weak var btn75: UIButton!
    @IBOutlet weak var btn100: UIButton!
    @IBOutlet weak var btnBuyOrSell: UIButton!
    
    var buttonTag = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btn25.layer.cornerRadius = 4
        btn50.layer.cornerRadius = 4
        btn75.layer.cornerRadius = 4
        btn100.layer.cornerRadius = 4
        btnBuyOrSell.layer.cornerRadius = 8
        
        viewCoinPic.layer.cornerRadius = 28
        ivCoin.layer.cornerRadius = 27
        
        if buttonTag == 1 {
            
            lblTitle.text = "Sell Bitcoin"
            lblTitle.textColor = UIColor(named: "redPop")
            
            btnBuyOrSell.setTitle("Sell", for: .normal)
            btnBuyOrSell.backgroundColor = UIColor(named: "redPop")
            
        }
        else {
            
            lblTitle.text = "Buy Bitcoin"
            lblTitle.textColor = UIColor(named: "greenPop")
            
            btnBuyOrSell.setTitle("Buy", for: .normal)
            btnBuyOrSell.backgroundColor = UIColor(named: "greenPop")
            
        }
        
    }
    
}
