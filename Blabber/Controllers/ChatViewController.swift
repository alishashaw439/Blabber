//
//  ViewController.swift
//  Blabber
//
//  Created by Alisha Shaw on 18/01/23.
//

import UIKit

class ChatViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let isLoggedIn = UserDefaults.standard.bool(forKey: "logged_in")
       
        if !isLoggedIn {
            let loginVC = LoginViewController()
            let navigationVC = UINavigationController(rootViewController: loginVC)
            navigationVC.modalPresentationStyle = .fullScreen
            present(navigationVC, animated: false)
        }
    }


}

