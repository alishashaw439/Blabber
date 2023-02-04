//
//  DatabaseManager.swift
//  Blabber
//
//  Created by Alisha Shaw on 04/02/23.
//

import Foundation
import FirebaseDatabase

final class DatabaseManager{
    static let shared = DatabaseManager()
    private let database = Database.database().reference()
}

extension DatabaseManager{
    public func userExists(with email:String,completion:@escaping ((Bool)-> Void)){
        var safeEmail = email.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        database.child(safeEmail).observeSingleEvent(of: .value, with: {dataSnapshot in
            if dataSnapshot.exists(){
                completion(true)
            }else{
                completion(false)
            }
        })
    }
    public func insertUser(with user:ChatUser){
        database.child(user.safeEmail).setValue([
            "first_name":user.firstName,
            "last_name":user.lastName
        ])
    }
}

struct ChatUser{
    let firstName:String
    let lastName:String
    let emailAddress:String
    var safeEmail:String {
        var safeEmail = emailAddress.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        return safeEmail
    }
}
