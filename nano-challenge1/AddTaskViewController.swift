//
//  AddTaskViewController.swift
//  nano-challenge1
//
//  Created by Vincensa Regina on 28/04/22.
//

import UIKit

class AddTaskViewController: UIViewController {

    @IBOutlet weak var txtTaskName: UITextField!
    @IBOutlet weak var txtDueDate: UITextField!
    
    var test: String?
    
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
        createDatePicker()
        print(test ?? "empty")
    
    }
    
    func createToolbar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        // Done button
        let btnDone = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
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
        txtDueDate.inputAccessoryView = createToolbar()
    }
    
    @objc func donePressed() {
        // Date Formatter
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        // Done pressed
        txtDueDate.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @objc func savePressed(_ sender: UIBarButtonItem!) {
        // Date Formatter
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none

        // Save pressed
        tasksSeed.append(Task.init(name: txtTaskName.text ?? "empty", due: datePicker.date, subtasks: []))
        
        performSegue(withIdentifier: "unwindTask", sender: self)
    }
    
    @objc func cancelPressed () {
        dismiss(animated: true, completion: nil)
    }

}
