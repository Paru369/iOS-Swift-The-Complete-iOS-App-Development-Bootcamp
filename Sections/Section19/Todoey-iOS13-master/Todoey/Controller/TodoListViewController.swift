//
//  TodoListViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreData

class TodoListViewController: UITableViewController {

    var itemArray = [Item]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
//        let newItem = Item()
//        newItem.title = "Find my key"
//        itemArray.append(newItem)
//        
//        let newItem2 = Item()
//        newItem2.title = "Teste new Item"
//        itemArray.append(newItem2)
       // loadItems()
        
//        if let items =  defaults.array(forKey: "TodoListArray") as? [Item] {
//            itemArray = items
//        }
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new ToDoEy item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            
            
            if textField.text != "" {
                let newItem = Item(context: self.context)
                newItem.title = textField.text!
                newItem.done = false
                self.itemArray.append(newItem)
                
                self.saveItems()
            }
           
            
            print(self.itemArray)
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Insert item name"
           textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    //MARK: - Model Manipulation Methods
//    func loadItems() {
//
//
//
//
//        if let data = try? Data(contentsOf: dataFilePath!){
//
//            let decoder = PropertyListDecoder()
//            do {
//                itemArray = try decoder.decode([Item].self, from: data )
//            } catch {
//                print("Error decoding: \(error)")
//            }
//            self.tableView.reloadData()
//        }
//    }
       
    func saveItems() {
        let encoder = PropertyListEncoder()
        
        do {
            try context.save()
            } catch {
            print("Errorsaving context, \(error)")
                
        }
            self.tableView.reloadData()
    }
        

  
    
    //MARK: - Tableview DataSource Methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        let item = itemArray[indexPath.row]

        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    //MARK: - Tableview Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let item = itemArray[indexPath.row]
        
        item.done = !item.done
        
        saveItems()
        
      
            
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
   
}




