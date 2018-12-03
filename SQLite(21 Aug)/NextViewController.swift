//
//  NextViewController.swift
//  SQLite(21 Aug)
//
//  Created by Student016 on 21/08/18.
//  Copyright © 2018 ra. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet weak var taskName: UITextField!
    
    @IBAction func InsertButton(_ sender: UIButton) {
        
     let insertQuery="insert into taskTable(taskId,taskName) values('\(taskId.text!)','\(taskName.text!)')"
        let isSuccess:Bool = DBWrapper.sharedObject.executeQuery(query: insertQuery)
        if(isSuccess){
            let alert = UIAlertController(title: "Alert", message: "Record Inserted Successfully !!", preferredStyle: UIAlertControllerStyle.alert)
            let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (ok) in
                self.navigationController?.popToRootViewController(animated: true)
            }
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
           // navigationController?.popViewController(animated: true)
        }
        else{
            print("Insertion:Failed")
        }
    }
    
    @IBOutlet weak var taskId: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

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
