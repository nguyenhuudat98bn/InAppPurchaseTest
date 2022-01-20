//
//  ViewController.swift
//  InAppPurchaseDN
//
//  Created by Dat Nguyen on 20/01/2022.
//

import UIKit
import StoreKit

class ViewController: UIViewController {
    
    var productsArray: [SKProduct] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        PKIAPHandler.shared.setProductIds(ids: ["", ""])
        PKIAPHandler.shared.fetchAvailableProducts { [weak self](products) in
           guard let sSelf = self else {return}
           sSelf.productsArray = products
//           sSelf.tableView.reloadData() //reload you table or collection view
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func point1Touch(){
        PKIAPHandler.shared.purchase(product: self.productsArray[0]) { (alert, product, transaction) in
           if let tran = transaction, let prod = product {
               print("tran\(tran)prod\(prod)")
             //use transaction details and purchased product as you want
           }
           }
    }
    
    @IBAction func point2Touch(){
        PKIAPHandler.shared.purchase(product: self.productsArray[1]) { (alert, product, transaction) in
           if let tran = transaction, let prod = product {
               print("tran\(tran)prod\(prod)")
             //use transaction details and purchased product as you want
           }
           }
    }
}

