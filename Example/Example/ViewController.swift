//
//  ViewController.swift
//  Example
//
//  Created by Abood Mufti on 2018-07-27.
//  Copyright © 2018 abood mufti. All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

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

