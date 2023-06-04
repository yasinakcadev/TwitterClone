//
//  Utilities.swift
//  TwitterClone
//
//  Created by YASIN on 4.06.2023.
//

import UIKit

class Utilities {
    static func inputContainerView(withImage image: UIImage?, textField: UITextField) -> UIView {
        let view = UIView()
        let imageView = UIImageView()
        
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(imageView)
        imageView.image = image
        imageView.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, paddingLeft: 8, paddingBottom: 8)
        imageView.setDimensions(width: 24, height: 24)
        
        view.addSubview(textField)
        textField.anchor(left: imageView.rightAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 8, paddingBottom: 8)
        
        let divider = UIView()
        view.addSubview(divider)
        divider.backgroundColor = .white
        divider.anchor(left: view.rightAnchor, bottom: view.bottomAnchor, paddingLeft: 8,paddingBottom: 0, height: 10)
        return view
    }
    
    static func textField(with placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.textColor = .white
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.attributedPlaceholder  = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        return textField 
    }
}
