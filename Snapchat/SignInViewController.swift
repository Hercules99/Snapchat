//
//  SignInViewController.swift
//  Snapchat
//
//  Created by Fredrik on 26.12.2017.
//  Copyright © 2017 Hercules. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignInViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func SignInTapped(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            print("We tried to sign in")
            if error != nil {
                print("We had an error:\(error)")
                
                Auth.auth().createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: { (user, error) in
                    print("We tried to create a user")
                    if error != nil {
                        print("We had an error:\(error)")
                    } else {
                        print("Created user succesfully!")
                        self.performSegue(withIdentifier: "signinsegue", sender: nil)
                    }
                    })
            } else {
                print("Signed in succesfully")
                self.performSegue(withIdentifier: "signinsegue", sender: nil)
            }
        }
    }
    
}

