//
//  RewardsViewController.swift
//  nano-challenge1
//
//  Created by Vincensa Regina on 29/04/22.
//

import UIKit

class RewardsViewController: UIViewController {

    @IBOutlet weak var tbReward: UITableView!
    @IBOutlet weak var btnAddReward: UIBarButtonItem!
    @IBOutlet weak var lblCoins: UILabel!
    
    @IBAction func goToAddReward(_ sender: Any) {
        performSegue(withIdentifier: "AddRewardModal", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblCoins.text = String(userCoin)
        tbReward.delegate = self
        tbReward.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? AddTaskViewController else {return}
    }
}

extension RewardsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rewardsSeed.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "RewardCell", for: indexPath) as? RewardTableViewCell {
            cell.lblName.text = rewardsSeed[indexPath.row].name
            cell.lblCoins.text = String(rewardsSeed[indexPath.row].coin)
            
            return cell
        }
    
        return UITableViewCell()
    }
    
    
}
