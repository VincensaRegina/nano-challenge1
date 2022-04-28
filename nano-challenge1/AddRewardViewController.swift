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
        let vc = AddTaskViewController()
        vc.setNavBar()
        // Do any additional setup after loading the view.
    }
    

}
