//
//  DBWrapper.swift
//  SQLite(21 Aug)
//
//  Created by Student016 on 21/08/18.
//  Copyright © 2018 ra. All rights reserved.
//

import UIKit
import SQLite3
class DBWrapper: NSObject {
    var taskIdArray=[String]()
    var taskNameArray=[String]()
   static let sharedObject = DBWrapper()
    var db:OpaquePointer? = nil
    var stmt:OpaquePointer? = nil
    func getDatabasePath()->String{
        let dir:[String] = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        var path:String = dir.first!
        path.append("/myDatabase.db")
        return path
    }
    func executeQuery(query:String)-> Bool{
        var success:Bool = false
        let dbPath:String = getDatabasePath()
        if (sqlite3_open(dbPath,&db)==SQLITE_OK)
        {
            if(sqlite3_prepare_v2(db, query, -1, &stmt, nil) == SQLITE_OK){
                if(sqlite3_step(stmt)==SQLITE_DONE){
                    success=true
                    sqlite3_finalize(stmt)
                    sqlite3_close(db)
                }
            }
            else{
                print("Error in executing query \(sqlite3_errmsg(db))")
            }
        }
        else{
           print("Error in opening DataBase\(sqlite3_errmsg(db))")
        }
        return success
    }
    func getAllTask(query:String)->(taskId:[String],taskNames:[String]){
        taskIdArray.removeAll()
        taskNameArray.removeAll()
        let dbPath:String = getDatabasePath()
        if (sqlite3_open(dbPath,&db)==SQLITE_OK)
        {
            if(sqlite3_prepare_v2(db, query, -1, &stmt, nil) == SQLITE_OK){
                while
                    (sqlite3_step(stmt)==SQLITE_ROW){
                        let taskId = String(cString:sqlite3_column_text(stmt, 0))
                        let taskName = String(cString:sqlite3_column_text(stmt, 1))
                        taskIdArray.append(taskId)
                        taskNameArray.append(taskName)
                        
                }
            }
            else{
                print("Error in prepare stmt \(sqlite3_errmsg(db))")
            }
        }
        else{
            print("Error in opening DataBase\(sqlite3_errmsg(db))")
        }
        sqlite3_finalize(stmt)
        sqlite3_close(db)
return (taskIdArray,taskNameArray)
    }
    
    
    
    
    
    
    
    
    
    func createTable(){
        let createQuery = "create table if not exists taskTable(taskId text,taskName text)"
        let isSuccess = executeQuery(query: createQuery)
        if(isSuccess){
            print("Table Creation:Success")
        }
        else{
            print("Table creation:Failed")
        }
    }
}
