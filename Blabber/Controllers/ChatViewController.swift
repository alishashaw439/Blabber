//
//  ViewController.swift
//  Blabber
//
//  Created by Alisha Shaw on 18/01/23.
//

import UIKit
import FirebaseAuth
class ChatViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        do {
            try FirebaseAuth.Auth.auth().signOut()
        } catch {
            print("could not sign out")
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        validateUser()
    }
    
    func validateUser(){
        if  FirebaseAuth.Auth.auth().currentUser == nil{
            let loginVC = LoginViewController()
            let navigationVC = UINavigationController(rootViewController: loginVC)
            navigationVC.modalPresentationStyle = .fullScreen
            present(navigationVC, animated: false)
        }
    }


}

