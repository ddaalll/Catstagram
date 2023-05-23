//
//  LoginViewController.swift
//  Catstagram
//
//  Created by DalHyun Nam on 2023/05/17.
//

import UIKit

class LoginViewController: UIViewController {

    
    var email = String()
    var password = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

   
    }
    

    @IBAction func emailTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.email = text
        
    }
    
    @IBAction func passwordTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.password = text
    }
    
    @IBAction func loginButtonDidTap(_ sender: UIButton) {
    }
    
    
    @IBAction func registerButtonDidTap(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let registerViewController = storyboard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterViewController
        self.navigationController?.pushViewController(registerViewController, animated: true)
        
    }
        
  
    
}
