//
//  AddSubtaskViewController.swift
//  nano-challenge1
//
//  Created by Vincensa Regina on 28/04/22.
//

import UIKit

class AddSubtaskViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtTask: UITextField!
    @IBOutlet weak var txtDueDate: UITextField!
    @IBOutlet weak var txtCoins: UITextField!
    
    let datePicker = UIDatePicker()
    let pvTask = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
        createDatePicker()
        createTaskPickerView()
        

        // Do any additional setup after loading the view.
    }
    
    func createToolbar(type: String) -> UIToolbar {
        let toolbar = UIToolbar()
        var btnDone = UIBarButtonItem()
        toolbar.sizeToFit()
        
        // Done button
        if type == "datePicker" {
            btnDone = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneDatePressed))
        } else {
            btnDone = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneTaskPressed))
        }
        toolbar.setItems([btnDone], animated: true)
        
        return toolbar
    }
    
    func setNavBar() {
        let btnSave = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(savePressed))
        let btnCancel = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelPressed))
        self.navigationItem.rightBarButtonItem = btnSave
        self.navigationItem.leftBarButtonItem = btnCancel
    }
    
    func createDatePicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        txtDueDate.inputView = datePicker
        txtDueDate.inputAccessoryView = createToolbar(type: "datePicker")
    }
    
    func createTaskPickerView() {
        pvTask.dataSource = self
        pvTask.delegate = self
        txtTask.inputView = pvTask
        txtTask.inputAccessoryView = createToolbar(type: "taskPicker")
    }
    
    @objc func doneDatePressed() {
        // Date Formatter
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        // Done pressed
        txtDueDate.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @objc func doneTaskPressed() {
        txtTask.text = tasksSeed[pvTask.selectedRow(inComponent: 0)].name
        self.view.endEditing(true)
    }
    
    @objc func savePressed(_ sender: UIBarButtonItem!) {
        // Date Formatter
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        var savedCoins = 0

        // Save pressed
        if let coins = Int(txtCoins.text ?? "0") {
            savedCoins = coins
        }
        
        //New data
        let newData = Subtask.init(name: txtName.text ?? "empty", due: datePicker.date, task: tasksSeed[pvTask.selectedRow(inComponent: 0)], coins: savedCoins, status: "Not Started")
        
        subtasksSeed.append(newData)
        tasksSeed[pvTask.selectedRow(inComponent: 0)].subtasks?.append(newData)
        
        //Go back to Tasks page and later reload table data
        performSegue(withIdentifier: "unwindSubtask", sender: self)
    }
    
    @objc func cancelPressed () {
        dismiss(animated: true, completion: nil)
    }

}

// Task Picker View Data Source and Delegate
extension AddSubtaskViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tasksSeed.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return tasksSeed[row].name
    }
}
