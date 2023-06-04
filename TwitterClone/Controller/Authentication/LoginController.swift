//
//  LoginController.swift
//  TwitterClone
//
//  Created by YASIN on 4.06.2023.
//

import UIKit

class LoginController: UIViewController {
    //MARK: - Properties
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "TwitterLogo")
        return imageView
    }()
    
    private lazy var emailContainerView: UIView = {
        let image = UIImage(named: "ic_mail_outline_white_2x-1")
        let view = Utilities.inputContainerView(withImage: image, textField: emailTextField)

        return view
    }()
    
    private lazy var passwordContainerView: UIView = {
        let image = UIImage(named: "ic_lock_outline_white_2x")
        let view = Utilities.inputContainerView(withImage: image, textField: passwordTextField)
        return view
    }()
    
    private var emailTextField: UITextField = {
        let textField = Utilities.textField(with: "Email")
        return textField
    }()
    
    private var passwordTextField: UITextField = {
        let textField = Utilities.textField(with: "Password")
        textField.isSecureTextEntry = true
        return textField
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()    }
    
    //MARK: - Selectors
    
    //MARK: - Helpers
    func configureUI() {
        view.backgroundColor = .twitterBlue
        navigationController?.navigationBar.barStyle = .black
        
        view.addSubview(logoImageView)
        logoImageView.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
        logoImageView.setDimensions(width: 150, height: 150)
        
        let stackView = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView])
        stackView.axis = .vertical
        stackView.spacing = 8
        
        view.addSubview(stackView)
        stackView.anchor(top: logoImageView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 50)
    }
}
