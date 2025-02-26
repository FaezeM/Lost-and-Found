//
//  DB.swift
//  Lost and Found
//
//  Created by Faeze Memari on 15/02/25.
//

import Foundation
import SQLite3

class DB {
    var db: OpaquePointer?
    var path: String = "testDb.sqlite"
    init() {
        self.db = createDB()
        self.createTable()
    }
    
    func createDB() -> OpaquePointer? {
        let filePath = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        var db: OpaquePointer? = nil
        
        if sqlite3_open(filePath.path, &db) != SQLITE_OK {
            print("Could not create DB")
            return nil
        } else {
            print("DB has been created: \(path)")
            return db
        }
    }
    
    func createTable() {
        let query = "CREATE TABLE IF NOT EXISTS object(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT, result TEXT, avg INTEGER, list TEXT);"
        
        var createTable: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(self.db, query, -1, &createTable, nil) == SQLITE_OK {
            if sqlite3_step(createTable) == SQLITE_DONE {
                print("Table has been created")
            }
        } else {
            print("Could not create Table")
            
        }
    }
}
