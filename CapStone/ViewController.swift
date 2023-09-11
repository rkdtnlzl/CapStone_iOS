//
//  ViewController.swift
//  CapStone
//
//  Created by 강석호 on 2023/09/11.
//

import UIKit
import Foundation
import SnapKit

class ViewController: UIViewController {

    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        label.text = "Welcome!"
        label.numberOfLines = 1
        return label
    }()
    
    private let emailtextField: InsetTextField = {
        let textField = InsetTextField()
        textField.insetX = 16
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Email Address"
        textField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        textField.backgroundColor = .white
        textField.isSecureTextEntry = false
        textField.layer.cornerRadius = 15
        textField.clipsToBounds = true
        textField.layer.borderColor = UIColor(r: 125, g: 91, b: 81).cgColor
        textField.layer.borderWidth = 1
        textField.textColor = UIColor(r: 93, g: 36, b: 36)
        textField.setPlaceholder(color: UIColor(r: 181, g: 181, b: 181))
        return textField
    }()
    
    private let passwordtextField: InsetTextField = {
        let textField = InsetTextField()
        textField.insetX = 16
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Password"
        textField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        textField.backgroundColor = .white
        textField.isSecureTextEntry = true
        textField.layer.cornerRadius = 15
        textField.clipsToBounds = true
        textField.layer.borderColor = UIColor(r: 125, g: 91, b: 81).cgColor
        textField.layer.borderWidth = 1
        textField.textColor = UIColor(r: 93, g: 36, b: 36)
        textField.isSecureTextEntry = true
        textField.setPlaceholder(color: UIColor(r: 181, g: 181, b: 181))
        return textField
    }()
    
    private let forgotLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = UIColor(r: 0, g: 111, b: 253)
        label.textAlignment = .center
        label.text = "Forgot Password?"
        label.numberOfLines = 1
        return label
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor(r: 0, g: 111, b: 253)
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        return button
    }()
    
    private let anotherLoginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = .gray
        label.textAlignment = .center
        label.text = "Or Continue with"
        label.numberOfLines = 1
        return label
    }()
    
    private let googleButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.layer.cornerRadius = 25
        button.clipsToBounds = true
        let buttonImage = UIImage(named: "google")
        button.imageView?.contentMode = .scaleAspectFit
        button.setImage(buttonImage, for: .normal)
        return button
    }()
    
    private let facebookButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(r: 0, g: 111, b: 253)
        button.layer.cornerRadius = 25
        button.clipsToBounds = true
        let buttonImage = UIImage(named: "facebook")
        button.imageView?.contentMode = .scaleAspectFit
        button.setImage(buttonImage, for: .normal)
        return button
    }()
    
    private let appleButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        button.layer.cornerRadius = 25
        button.clipsToBounds = true
        let buttonImage = UIImage(named: "apple")
        button.imageView?.contentMode = .scaleAspectFit
        button.setImage(buttonImage, for: .normal)
        return button
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barStyle = .black
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // 다른 부분을 탭할 때 키보드 숨기기
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        
        view.addSubview(welcomeLabel)
        view.addSubview(emailtextField)
        view.addSubview(passwordtextField)
        view.addSubview(forgotLabel)
        view.addSubview(loginButton)
        view.addSubview(anotherLoginLabel)
        view.addSubview(googleButton)
        view.addSubview(appleButton)
        view.addSubview(facebookButton)
        
        self.welcomeLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).inset(24)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(111)
        }
        self.emailtextField.snp.makeConstraints { make in
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).inset(24)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).inset(24)
            make.top.equalTo(self.welcomeLabel.snp.bottom).offset(30)
            make.height.equalTo(48)
        }
        self.passwordtextField.snp.makeConstraints { make in
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).inset(24)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).inset(24)
            make.top.equalTo(self.emailtextField.snp.bottom).offset(16)
            make.height.equalTo(48)
        }
        self.forgotLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).inset(25)
            make.top.equalTo(self.passwordtextField.snp.bottom).offset(16)
        }
        
        self.loginButton.snp.makeConstraints { make in
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).inset(24)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).inset(24)
            make.top.equalTo(self.forgotLabel.snp.bottom).offset(24)
            make.height.equalTo(48)
        }
        
        self.anotherLoginLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.loginButton.snp.bottom).offset(30)
        }
        
        self.appleButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.anotherLoginLabel.snp.bottom).offset(30)
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
        self.googleButton.snp.makeConstraints { make in
            make.top.equalTo(self.anotherLoginLabel.snp.bottom).offset(30)
            make.trailing.equalTo(self.appleButton.snp.leading).offset(-16)
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
        self.facebookButton.snp.makeConstraints { make in
            make.top.equalTo(self.anotherLoginLabel.snp.bottom).offset(30)
            make.leading.equalTo(self.appleButton.snp.trailing).inset(-16)
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
        
        // 로그인하기 버튼 클릭시 다음화면으로 이동
        self.loginButton.addTarget(self, action: #selector(onPressLoginButton), for: .touchUpInside)
        
    }
    @objc func onPressLoginButton(sender: UIButton) {
        let mainView = MainViewController()
        self.navigationController?.pushViewController(mainView, animated: true)
    }
    // 다른 부분을 탭할 때 키보드 숨기기
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}


