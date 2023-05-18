//
//  RegisterViewController.swift
//  Catstagram
//
//  Created by DalHyun Nam on 2023/05/18.
//

import UIKit

class RegisterViewController: UIViewController {
    // MARK: - Properties
    
    var isValidEmail = false
    var isValidName = false
    var isValidNickname = false
    var isValidPassword = false
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var nicknameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    var textField: [UITextField] {
        [emailTextField, nameTextField, nicknameTextField, passwordTextField]
    }
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTextField()
        
    }
    // MARK: - Actions
    @objc func textFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        
        switch sender {
        case emailTextField:
            print("email")
        case nameTextField:
            print("name")
        case nicknameTextField:
            print("nickname")
        case passwordTextField:
            print("password")
        default:
            fatalError("Missing TextField...")
        }
    }
    
    
    // MARK: - Helpers

    func setupTextField() {
        textField.forEach { tf in
            tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
            
        }
        
    }

}
