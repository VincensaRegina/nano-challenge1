//
//  AddRewardViewController.swift
//  nano-challenge1
//
//  Created by Vincensa Regina on 29/04/22.
//

import UIKit

class AddRewardViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtCoin: UITextField!
    @IBOutlet weak var lblCoin: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
        // Do any additional setup after loading the view.
    }
    
    func setNavBar() {
        let btnSave = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(savePressed))
        let btnCancel = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelPressed))
        self.navigationItem.rightBarButtonItem = btnSave
        self.navigationItem.leftBarButtonItem = btnCancel
    }
    
    @objc func savePressed(_ sender: UIBarButtonItem!) {
        // Date Formatter
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        var savedCoins = 0
        var savedPrice: Float = 0.0

        // Save pressed
        
        if let price = Float(txtCoin.text ?? "0") {
            savedPrice = price
            savedCoins = Int(savedPrice/1000.0)
        }
        
        lblCoin.text = String(savedCoins)
        
        //New data
        let newData = Reward.init(name: txtName.text ?? "empty", price: savedPrice, coin: savedCoins)
        
        rewardsSeed.append(newData)
        
        //Go back to Tasks page and later reload table data
        performSegue(withIdentifier: "unwindReward", sender: self)
    }
    
    @objc func cancelPressed () {
        dismiss(animated: true, completion: nil)
    }

    

}
