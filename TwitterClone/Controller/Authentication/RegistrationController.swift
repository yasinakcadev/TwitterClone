//
//  RegistrationController.swift
//  TwitterClone
//
//  Created by YASIN on 4.06.2023.
//

import UIKit

class RegistrationController: UIViewController {
    //MARK: - Properties
    private let imagePicker = UIImagePickerController()
    
    private let uploadPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "plus_photo"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(uploadPhoto), for: .touchUpInside)
        return button
    }()
    
    private let emailTextField: UITextField = {
        let textField = Utilities.textField(with: "Email")
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = Utilities.textField(with: "Password")
        return textField
    }()
    
    private let fullNameTextField: UITextField = {
        let textField = Utilities.textField(with: "Full Name")
        return textField
    }()
    
    private let usernameTextField: UITextField = {
        let textField = Utilities.textField(with: "Username")
        return textField
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
    
    private lazy var fullNameContainerView: UIView = {
        let image = UIImage(named: "ic_person_outline_white_2x")
        let view = Utilities.inputContainerView(withImage: image, textField: fullNameTextField)
        return view
    }()
    
    private lazy var usernameContainerView: UIView = {
        let image = UIImage(named: "ic_person_outline_white_2x")
        let view = Utilities.inputContainerView(withImage: image, textField: usernameTextField)
        return view
    }()
    
    private let alreadyHaveAccountButton: UIButton = {
        let button = Utilities.attributedButton("Already have an account?", " Login")
        button.addTarget(self, action: #selector(goToLogin), for: .touchUpInside)
        return button
    }()
    
    private let registerButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Register", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.twitterBlue, for: .normal)
        button.heightAnchor.constraint(lessThanOrEqualToConstant: 50).isActive = true
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Selectors
    @objc func goToLogin() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func handleRegister() {
        print("Register")
    }
    
    @objc func uploadPhoto() {
        present(imagePicker, animated: true)
    }
    
    //MARK: - Helpers
    func configureUI() {
        view.backgroundColor = .twitterBlue
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        view.addSubview(uploadPhotoButton)
        uploadPhotoButton.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor, paddingTop: 30)
        uploadPhotoButton.setDimensions(width: 130, height: 130)
        
        
        let stackView = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView, fullNameContainerView, usernameContainerView, registerButton])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        
        stackView.anchor(top: uploadPhotoButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 50, paddingLeft: 16, paddingRight: 16)
        
        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 40, paddingRight: 40)
    }
}

extension RegistrationController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let profileImage = info[.editedImage] as? UIImage else {return}
        self.uploadPhotoButton.setImage(profileImage.withRenderingMode(.alwaysOriginal), for: .normal)
        uploadPhotoButton.layer.cornerRadius = 130 / 2
        uploadPhotoButton.layer.masksToBounds = true
        uploadPhotoButton.imageView?.contentMode = .scaleAspectFill
        uploadPhotoButton.imageView?.clipsToBounds = true
        uploadPhotoButton.layer.borderColor = UIColor.white.cgColor
        uploadPhotoButton.layer.borderWidth = 3
        dismiss(animated: true)
    }
}
