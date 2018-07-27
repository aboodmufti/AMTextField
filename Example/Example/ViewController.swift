//
//  ViewController.swift
//  Example
//
//  Created by Abood Mufti on 2018-07-27.
//  Copyright © 2018 abood mufti. All rights reserved.
//

import UIKit
import AMTextField

class ViewController: UIViewController {

    public lazy var textField: AMTextField = {
        let textField = AMTextField()
        textField.placeholder = "Email"
        textField.keyboardType = .emailAddress

        textField.backgroundColor = .clear
        textField.placeholderColor = .lightGray
        textField.bottomBorderColor = .black
        textField.textColor = .black
        textField.bottomBorderWidth = 1
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.bottomBorderPadding = (left: 10, right: 10)
        textField.horizontalPadding = (left: 20, right: 20)
        textField.autocapitalizationType = .none

        self.view.addSubview(textField)

        textField.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        textField.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
        textField.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor).isActive = true

        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        _ = textField
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

}

