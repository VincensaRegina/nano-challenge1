//
//  TasksViewController.swift
//  nano-challenge1
//
//  Created by Vincensa Regina on 28/04/22.
//

import UIKit

class TasksViewController: UIViewController {

    @IBOutlet weak var btnAddTask: UIButton!
    @IBOutlet weak var btnAddFriend: UIButton!
    @IBOutlet weak var btnAddSubtask: UIButton!
    @IBOutlet weak var tbTasks: UITableView!
    

    @IBAction func goToAddTask(_ sender: Any) {
        performSegue(withIdentifier: "AddTaskModal", sender: self)
    }
    
    @IBAction func goToAddSubtask(_ sender: Any) {
        performSegue(withIdentifier: "AddSubtaskModal", sender: self)
    }
    
    @IBAction func unwind( _ seg: UIStoryboardSegue) {
        tbTasks.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Table View Setting
        tbTasks.delegate = self
        tbTasks.dataSource = self
        self.registerTableView()
        
        // Search Controller
        searchSetting();
        
        // Adjust font size button to fit width
        adjustButtonWidth()
        
    }

    
    private func searchSetting() {
        let searchController = UISearchController(searchResultsController: nil)
        //searchController.searchResultsUpdater = self
        searchController.searchBar.autocapitalizationType = .none
        searchController.obscuresBackgroundDuringPresentation = false // The default is true.
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false // Make the search bar always visible.
    }
    
    private func adjustButtonWidth() {
        btnAddTask.titleLabel?.adjustsFontSizeToFitWidth = true
        btnAddFriend.titleLabel?.adjustsFontSizeToFitWidth = true
        btnAddSubtask.titleLabel?.adjustsFontSizeToFitWidth = true
    }
    
    private func registerTableView() {
        // Table View Cells
        let textFieldCell = UINib(nibName: "TaskTableViewCell", bundle: nil)
        self.tbTasks.register(textFieldCell, forCellReuseIdentifier: "TaskCustomCell")
        
        // Table Header
        tbTasks.register(TaskHeaderView.self,
               forHeaderFooterViewReuseIdentifier: "taskHeader")
        
        // Section Header Height
        self.tbTasks.sectionHeaderHeight = 60
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

//        guard let destinationVC = segue.destination as? AddTaskViewController
//        else {
//            print("elseeeee")
//            return
//
//        }

        if segue.identifier ?? "empty" == "AddTaskModal" {
             if let destinationVC = segue.destination as? AddTaskViewController {
                 destinationVC.test = "halo"
                 print("masuk")
             }

        } else if (segue.identifier == "AddSubtaskModal") {
            if segue.destination is AddSubtaskViewController {
                print("masuk subtask")
            }
        }
    
    }
    

}

extension TasksViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasksSeed[section].subtasks?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCustomCell", for: indexPath) as? TaskTableViewCell {
        
            cell.lblSubtaskName.text = tasksSeed[indexPath.section].subtasks?[indexPath.row].name
            cell.lblDueDate.text = tasksSeed[indexPath.section].subtasks?[indexPath.row].due.formatted(date: .abbreviated, time: .omitted)
            cell.lblStatus.text = tasksSeed[indexPath.section].subtasks?[indexPath.row].status
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tbTasks.dequeueReusableHeaderFooterView(withIdentifier:
                      "taskHeader") as! TaskHeaderView
        view.taskName.text = tasksSeed[section].name
        view.dueDate.text = "Due \(tasksSeed[section].due.formatted(date: .abbreviated, time: .omitted))"
          
        return view
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tasksSeed.count
    }
}
