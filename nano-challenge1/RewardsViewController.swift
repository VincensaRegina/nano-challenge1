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
    
    @IBAction func unwind( _ seg: UIStoryboardSegue) {
        tbReward.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblCoins.text = String(userCoin)
        tbReward.delegate = self
        tbReward.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.destination is AddTaskViewController else {return}
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Warning", message: "Would you like to trade \(rewardsSeed[indexPath.row].coin) coins for '\(rewardsSeed[indexPath.row].name)'", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Trade", style: .destructive) {
            UIAlertAction in userCoin -= rewardsSeed[indexPath.row].coin
            self.lblCoins.text = String(userCoin)
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) {
            UIAlertAction in print("ttest")
        }
        
        alert.addAction(cancelAction)
        
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            rewardsSeed.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
    
    
}
