//
//  ViewController.swift
//  SQLite(21 Aug)
//
//  Created by Student016 on 21/08/18.
//  Copyright © 2018 ra. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var taskTableView: UITableView!
    
    
    var idArray:[String]?=nil
    var nameArray:[String]?=nil
    @IBAction func AddButton(_ sender: Any) {
        
        let next = self.storyboard?.instantiateViewController(withIdentifier: "NextViewController") as! NextViewController
        self.navigationController?.pushViewController(next, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        idArray?.removeAll()
        nameArray?.removeAll()
        //idArray=[String]()
        //nameArray=[String]()
        let result = DBWrapper.sharedObject.getAllTask(query: "select taskId,taskName from taskTable")
        idArray = result.taskId
        nameArray=result.taskNames
        print("all task Ids:\(idArray!) and all taskNames are\(String(describing: nameArray))")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return idArray!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "cell")
        cell.textLabel?.text = idArray?[indexPath.row]
        cell.detailTextLabel?.text = nameArray?[indexPath.row]
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        let edit = self.storyboard?.instantiateViewController(withIdentifier: "EditViewController") as! EditViewController
       
        edit.TaskId = cell?.textLabel?.text
        edit.TaskName = cell?.detailTextLabel?.text
         self.navigationController?.pushViewController(edit, animated: true)
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        idArray?.removeAll()
        nameArray?.removeAll()
        print("all task Ids:\(idArray!) and all taskNames are\(String(describing: nameArray))")

        let result = DBWrapper.sharedObject.getAllTask(query: "select taskId,taskName from taskTable")
        idArray = result.taskId
        nameArray=result.taskNames
        print("all task Ids:\(idArray!) and all taskNames are\(String(describing: nameArray))")
        
        taskTableView.reloadData()
        
        
        
    }

}

