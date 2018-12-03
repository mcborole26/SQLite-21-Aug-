//
//  EditViewController.swift
//  SQLite(21 Aug)
//
//  Created by Student016 on 23/08/18.
//  Copyright © 2018 ra. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {
    
    @IBOutlet weak var taskId: UITextField!
    
    @IBAction func deleteAction(_ sender: UIButton) {
        
let deleteQuery="DELETE FROM taskTable"
        let isSuccess:Bool=DBWrapper.sharedObject.executeQuery(query: deleteQuery)
        if(isSuccess){
            let alert = UIAlertController(title: "Alert", message: "Record DeletedSuccessfully !!", preferredStyle: UIAlertControllerStyle.alert)
            let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (ok) in
                self.navigationController?.popToRootViewController(animated: true)
            }
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        }
        else{
            print("Not deleted")
        }
        
        
    }
    
    @IBAction func updateAction(_ sender: UIButton) {
        let updateQuery:String = "update taskTable  set taskId ='\(taskId.text!)',taskName='\(taskname.text!)'"
        let isSuccess:Bool = DBWrapper.sharedObject.executeQuery(query: updateQuery)
        if(isSuccess){
        let alert = UIAlertController(title: "Alert", message: "Record Updated Successfully !!", preferredStyle: UIAlertControllerStyle.alert)
            let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (ok) in
                self.navigationController?.popToRootViewController(animated: true)
            }
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        }
        else{
            print("update failed")
        }
        
        
        
    }
    
    
    @IBOutlet weak var textid: UITextField!
    
    @IBOutlet weak var taskname: UITextField!
    
    
    
    
     var TaskId:String? = nil
     var TaskName:String? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Selected id taskId=\(TaskId!) and taskName=\(TaskName!)")
        taskId.text=TaskId
        taskname.text=TaskName
        taskId.isEnabled = false
        // Do any additional setup after loading the view.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
