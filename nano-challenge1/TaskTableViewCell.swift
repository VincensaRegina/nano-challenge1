//
//  TaskTableViewCell.swift
//  nano-challenge1
//
//  Created by Vincensa Regina on 28/04/22.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    @IBOutlet weak var lblSubtaskName: UILabel!
    @IBOutlet weak var lblDueDate: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
