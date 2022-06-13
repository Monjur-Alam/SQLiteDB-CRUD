//
//  SQLiteBDManager.swift
//  SQLiteDB CRUD
//
//  Created by MacBook Pro on 9/6/22.
//

import Foundation
import  UIKit

var shareInstance = SQLiteDBManager()

class SQLiteDBManager {
    var database : FMDatabase? = nil
    static func getInstance() -> SQLiteDBManager{
        if shareInstance.database == nil{
            shareInstance.database = FMDatabase(path: Util.share.getPath(dbName: "SQLiteDBCRUD.db"))
        }
        return shareInstance
    }
    
    //MARK: - Saving data
    func SaveData(contactModel : ContactModel) -> Bool{
        shareInstance.database?.open()
        let isSave = shareInstance.database?.executeUpdate("INSERT INTO contact (name, phone) VALUES(?,?)", withArgumentsIn: [contactModel.name, contactModel.phone])
        shareInstance.database?.close()
        return isSave!
    }
    
    //MARK: - Get All Contacts data
    func getAllContacts() -> [ContactModel]{
        shareInstance.database?.open()
        //FMResultSet  :  Used to hold result of SQL query on FMDatabase object.
        let resultSet : FMResultSet! = try! shareInstance.database?.executeQuery("SELECT * FROM contact", values: nil)
        var allContacts = [ContactModel]()
        
        if resultSet != nil{
            while resultSet.next() {
                let studentModel = ContactModel(id: resultSet.string(forColumn: "id")!, name: resultSet.string(forColumn: "name")!, phone: resultSet.string(forColumn: "phone")!)
                allContacts.append(studentModel)
            }
        }
        shareInstance.database?.close()
        return allContacts
    }
    
    //MARK: - Update Contacts data
    func updateContact(contactModel: ContactModel) -> Bool{
        shareInstance.database?.open()
        let isUpdated = shareInstance.database?.executeUpdate("UPDATE contact SET name=?, phone=? WHERE id=? ", withArgumentsIn: [contactModel.name,contactModel.phone, contactModel.id])
        shareInstance.database?.close()
        return isUpdated!
    }
    
    //MARK: - Deleting Contacts data
    func deleteContact(contactModel: ContactModel) -> Bool{
        shareInstance.database?.open()
        let isDeleted = (shareInstance.database?.executeUpdate("DELETE FROM contact WHERE phone=?", withArgumentsIn: [contactModel.phone]))
        shareInstance.database?.close()
        return isDeleted!
    }
}
