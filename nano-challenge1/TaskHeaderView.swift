//
//  TaskHeaderView.swift
//  nano-challenge1
//
//  Created by Vincensa Regina on 28/04/22.
//

import UIKit

class TaskHeaderView: UITableViewHeaderFooterView {
    let taskName = UILabel()
    let dueDate = UILabel()
    
    override init(reuseIdentifier: String?) {
           super.init(reuseIdentifier: reuseIdentifier)
           configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContents() {
        taskName.translatesAutoresizingMaskIntoConstraints = false
        dueDate.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(taskName)
        contentView.addSubview(dueDate)
        
        taskName.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        taskName.textColor = UIColor.systemOrange
        
        NSLayoutConstraint.activate([
            taskName.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 0),
            taskName.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor, constant: 0),
            dueDate.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 0),
            dueDate.topAnchor.constraint(equalTo: taskName.topAnchor, constant: 25)
        ])
        
    }
}
