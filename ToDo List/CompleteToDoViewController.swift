//
//  CompleteToDoViewController.swift
//  ToDo List
//
//  Created by Fiona Oh on 5/13/21.
//

import UIKit

class CompleteToDoViewController: UIViewController {
    
    var previousVC = ToDoTableViewController()
    var selectedToDo : ToDoCD?
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var importantLabel: UILabel!
    

    @IBOutlet weak var saveEditButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        titleTextField.text = selectedToDo?.name
        if selectedToDo?.important == true {
            importantSwitch.isOn = true
        } else {
            importantSwitch.isOn = false
        }
    }
    
    
    @IBAction func saveEdits(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let theToDo = selectedToDo {
                theToDo.name = titleTextField.text
                
                if importantSwitch.isOn {
                    theToDo.important = true
                } else {
                    theToDo.important = false
                }
            }
            
            try? context.save()
            
            navigationController?.popViewController(animated: true)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
