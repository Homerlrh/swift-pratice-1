//
//  ViewController.swift
//  to-do
//
//  Created by ruihao li on 2020-05-26.
//  Copyright © 2020 Homer li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var todos = [
        Todo(title: "app 1"),
        Todo(title: "app 2"),
        Todo(title: "app 3")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var mainTable: UITableView!

    
    
    @IBAction func addTask(_ sender: Any) {
        mainTable.isEditing = !mainTable.isEditing
    }
    
    @IBSegueAction func todoViewController(_ coder: NSCoder) -> TodoViewController? {
        let vc = TodoViewController(coder: coder)
        
        if let indexpath = mainTable.indexPathForSelectedRow {
            let todo = todos[indexpath.row]
            vc?.todo = todo
        }
        
        vc?.delegate = self
        
        vc?.presentationController?.delegate = self
        
        return vc

      
    }
    
    
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal, title: "Complete"){
            action, view, complete in
            
            let todo = self.todos[indexPath.row].completeTask()
            self.todos[indexPath.row] = todo
            let cell = tableView.cellForRow(at: indexPath) as! checkTable_view_cell
            cell.set(checked: todo.isComplete)
            
            complete(true)
            todo.isComplete ?  print("complete"):print("uncomplete")
        }
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
}


extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //only one element at a time
        //[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: "checked cell", for: indexPath) as! checkTable_view_cell
        
        cell.delegate = self
        
        let todo = todos[indexPath.row]

        cell.set(title: todo.title, checked: todo.isComplete)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            todos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let todo = todos.remove(at: sourceIndexPath.row)
        todos.insert(todo, at: destinationIndexPath.row)
    }
}

extension ViewController: checkTableViewCellDelegate{
    func checkTableViewCell(_ cell: checkTable_view_cell, didChangeCheckedState checked: Bool){
        guard let indexPath = mainTable.indexPath(for: cell)else{
            return
        }
        let todo = todos[indexPath.row]
        let newtodo = Todo(title: todo.title,isComplete: checked)
        
        todos[indexPath.row] = newtodo
    }
}

extension ViewController: todoViewControlDelegate {
    func todoViewController(_ vc: TodoViewController, didSaveTodo todo: Todo) {
        
        dismiss(animated: true){
            if let indexPath = self.mainTable.indexPathForSelectedRow{
                self.todos[indexPath.row] = todo
                
                self.mainTable.reloadRows(at: [indexPath], with: .none)
            }else{
                self.todos.append(todo)
                self.mainTable.insertRows(at: [IndexPath(row: self.todos.count-1, section: 0)], with: .automatic)
            }
        }

    }
}

extension ViewController: UIAdaptivePresentationControllerDelegate{
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        if let indexPath = mainTable.indexPathForSelectedRow{
            mainTable.deselectRow(at: indexPath, animated: true)
        }
    }
}
