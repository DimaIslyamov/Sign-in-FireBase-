//
//  TasksViewController.swift
//  Project with Scetch ( SIGN IN MENU )
//
//  Created by Moobat on 4/17/21.
//

import UIKit
import Firebase

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        content.text = "this is cell number \(indexPath.row)"
        
        cell.contentConfiguration = content
        return cell
    }
    
    @IBAction func addTasks(_ sender: UIBarButtonItem) {
        
    }
    
    @IBAction func signOutTapped(_ sender: UIBarButtonItem) {
        do {
        try Auth.auth().signOut()
        } catch {
            print(error.localizedDescription)
        }
        dismiss(animated: true, completion: nil)
    }
    
}
