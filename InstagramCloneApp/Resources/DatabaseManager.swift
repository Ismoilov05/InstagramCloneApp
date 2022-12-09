//
//  DatabaseManager.swift
//  InstagramCloneApp
//
//  Created by MuhammadQodir on 23.11.2022.
//

import FirebaseDatabase


public class DatabaseManager {
    static let shared = DatabaseManager()
    private let database = Database.database().reference()
    
    public func canCreateUser(with email: String, username: String, password: String, completion:  (Bool) -> Void) {
        completion(true)
        
    }
    
    public func insertNewuser(with email: String, username: String, completion: @escaping (Bool) -> Void) {
        
        let key = email.safeDatabaseKey()
        print(key)
              
        database.child(key).setValue(["username": username], withCompletionBlock: { error, _ in
            if error == nil {
                // succeded
                completion(true)
                return
            }
            else {
                //failed
                completion(false)
                return
                
            }
        })
    }
    
    
}
