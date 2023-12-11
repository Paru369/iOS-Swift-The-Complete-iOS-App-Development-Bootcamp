//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Paulo Pinheiro on 12/10/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {
    
    
    var categoryArray = [Categori]()
    
  
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCategories()
    }
    
    //MARK: - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        cell.textLabel?.text = categoryArray[indexPath.row].name
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new category item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Category", style: .default) { (action) in
            
            if textField.text != "" {
                let newCategory = Categori(context: self.context)
                newCategory.name = textField.text!
                self.categoryArray.append(newCategory)
                
                self.saveCategories()
            }
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Insert category name"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    //MARK: - Model Manipulation Methods
    
    func loadCategories(with request: NSFetchRequest<Categori> = Categori.fetchRequest() ) {
        
        
        do {
            categoryArray = try context.fetch(request)
        } catch {
            print("Error loading categories: \(error)")
        }
    }
    
    func saveCategories() {
        let encoder = PropertyListEncoder()
        
        do {
            try context.save()
        } catch {
            print("Error saving context, \(error)")
            
        }
        self.tableView.reloadData()
    }
    
    //MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "goToItems", sender: self)
//        context.delete(categoryArray[indexPath.row])
//        categoryArray.remove(at: indexPath.row)
//
//        saveCategories()
//
//        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categoryArray[indexPath.row]
        }
    }
 
}
