//
//  RegisterViewController.swift
//  Catstagram
//
//  Created by DalHyun Nam on 2023/05/18.
//

import UIKit

class RegisterViewController: UIViewController {
    // MARK: - Properties
    
    var isValidEmail = false {
        didSet{
            self.validateUserInfo()
            print(#function)
        }
    }
    var isValidName = false {
        didSet{
            self.validateUserInfo()
            print(#function)
        }
    }
    var isValidNickname = false {
        didSet{
            self.validateUserInfo()
            print(#function)
        }
    }
    var isValidPassword = false {
        didSet{
            self.validateUserInfo()
            print(#function)
        }
    }
    
    @IBOutlet weak var signupButton: UIButton!
    
    @IBOutlet weak var popToLoginButton: UIButton!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var nicknameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    var textFields: [UITextField] {
        [emailTextField, nameTextField, nicknameTextField, passwordTextField]
    }
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTextField()
        setupAttribute()
        
    }
    // MARK: - Actions
    @objc func textFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        
        switch sender {
        case emailTextField:
            self.isValidEmail = text.isValidEmail()
            
        case nameTextField:
            self.isValidName = text.count > 2
            
        case nicknameTextField:
            self.isValidNickname = text.count > 2
        case passwordTextField:
            self.isValidPassword = text.isValidPassword()
        default:
            fatalError("Missing TextField...")
        }
        
    }
    
    
    
    // MARK: - Helpers
    
    func setupTextField() {
        textFields.forEach { tf in
            tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
            
        }
        
    }
    
    // 사용자가 입력한 회원정보를 확인하고 -> UI 구성을 확인
    private func validateUserInfo() {
        
        if isValidEmail
            && isValidName
            && isValidNickname
            && isValidPassword {
            
            self.signupButton.isEnabled = true
            UIView.animate(withDuration: 0.33) {
                self.signupButton.backgroundColor = UIColor.facebookColor
            }
        } else {
            self.signupButton.isEnabled = false
            UIView.animate(withDuration: 0.33) {
                self.signupButton.backgroundColor = .disabledButtonColor
            }
           
        }
    }
    private func setupAttribute() {
        //registerButton
        
        let text1 = "계정이 있으신가요?"
        let text2 = "로그인"
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.boldSystemFont(ofSize: 13)
        
        let color1 = UIColor.darkGray
        let color2 = UIColor.facebookColor
        
        let attributes = generateButtonAttribute(self.popToLoginButton, texts: text1,text2, fonts: font1,font2, colors: color1,color2)
        
        self.popToLoginButton.setAttributedTitle(attributes, for: .normal)
    }
}

// 정규 표현식

extension String {
    // 대문자, 소문자, 특수문자, 숫자 8자 이상일때 -> true
    func isValidPassword() -> Bool {
        let regularExpression = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
        
        return passwordValidation.evaluate(with: self)
    }
    
    //
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}
