//
//  AddToDoViewController.swift
//  ToDo List
//
//  Created by Fiona Oh on 5/13/21.
//

import UIKit

class AddToDoViewController: UIViewController {

    var previousVC = ToDoTableViewController()
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func addTapped(_ sender: UIButton) {
        /*
        let toDo = ToDo()
        
        if let titleText = titleTextField.text {
            toDo.name = titleText
            toDo.important = importantSwitch.isOn
        }
        
        previousVC.toDos.append(toDo)
        previousVC.tableView.reloadData()
        navigationController?.popViewController(animated: true)
         */
        
        //grab view context to work with Core Data
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            //make new ToDoCD object
            let toDo = ToDoCD(entity: ToDoCD.entity(), insertInto: context)
            //if titleTextField has text, call it titleText
            if let titleText = titleTextField.text {
                toDo.name = titleText
                toDo.important = importantSwitch.isOn
            }
            
            //save context
            try? context.save()
            
            //pop view controller to get back to table view
            navigationController?.popViewController(animated: true)
        }
    }
    
}
