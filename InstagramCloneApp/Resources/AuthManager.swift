//
//  AuthManager.swift
//  InstagramCloneApp
//
//  Created by MuhammadQodir on 23.11.2022.
//


import FirebaseAuth


public class AuthManager {
    static let shared = AuthManager()
    
    
    public func registerNewUser(username: String, email: String, password: String, completion: @escaping (Bool) -> Void) {
        
        DatabaseManager.shared.canCreateUser(with: email, username: username, password: password) { canCreate in
            if canCreate  {
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    guard error ==  nil, result != nil else {
                        completion(false)
                         return
                    }
                    // insert into database
                    DatabaseManager.shared.insertNewuser(with: email, username: username) { inserted in
                        if inserted {
                            // succeded
                            completion(true)
                            return
                        }
                        else {
                            // failed
                            completion(false)
                            return
                        }
                    }
                }
            }
            else {
                completion(false)
            }
        }
    }
    
    public func loginUser(username: String?, email: String?, password: String, completion: @escaping (Bool)-> Void) {
        if let email = email {
            // success
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                guard authResult != nil, error == nil else {
                    completion(false)
                    return
                }
                completion(true)
            }
        }
        else if let username = username {
            // user log in
            print(username)
        }
        
    }
    
    // attempt to log out firebase user
    public func logOut(completion: (Bool) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(true)
            return
        }
        catch {
            print(error)
            completion(false)
            return
        }
        
    }
}
