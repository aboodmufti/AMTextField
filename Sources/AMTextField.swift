//
//  AMTextField.swift
//  AMTextField
//
//  Created by Abood Mufti on 2018-07-25.
//  Copyright © 2018 Abood Mufti.
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

public typealias HorizontalPadding = (left: CGFloat, right: CGFloat)

public class AMTextField: UIView {

    // MARK: Components

    internal lazy var placeholderLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false

        label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(placeholderLabelTapped)))

        insertSubview(label, aboveSubview: internalTextField)

        placeholderTopConstraint = label.topAnchor.constraint(equalTo: self.topAnchor, constant: textFieldVerticalMargin)
        placeholderTopConstraint?.isActive = true

        placeholderXConstraint = label.centerXAnchor.constraint(equalTo: self.centerXAnchor)

        placeholderLeftConstraint = label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: horizontalPadding.left)
        placeholderLeftConstraint?.isActive = true

        return label
    }()

    // The actual textField under the hood.
    public lazy var internalTextField: UITextField = {
        var textField = UITextField()
        textField.textAlignment = .left
        textField.addTarget(self, action: #selector(textFieldEditingDidBegin), for: .editingDidBegin)
        textField.addTarget(self, action: #selector(textFieldEditingDidEnd), for: .editingDidEnd)
        textField.translatesAutoresizingMaskIntoConstraints = false

        addSubview(textField)

        textFieldTopConstraint = textField.topAnchor.constraint(equalTo: self.topAnchor, constant: textFieldVerticalMargin)
        textFieldTopConstraint?.isActive = true

        textFieldLeftConstraint = textField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: horizontalPadding.left)
        textFieldLeftConstraint?.isActive = true

        textAlignmentObserver = textField.observe(\.textAlignment, changeHandler: { (textField, alignmenet) in
            self.textAlignmentHasChanged()
        })

        return textField
    }()

    internal lazy var secureEntryButton: UIButton = {
        var button = UIButton(type: .custom)
        button.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false
        addSubview(button)

        button.topAnchor.constraint(equalTo: internalTextField.topAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: internalTextField.bottomAnchor).isActive = true

        secureEntryButtonWidthConstraint = button.widthAnchor.constraint(equalToConstant: 1)
        secureEntryButtonWidthConstraint?.isActive = true

        internalTextField.rightAnchor.constraint(equalTo: button.leftAnchor, constant: -5).isActive = true

        textFieldRightConstraint = button.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -horizontalPadding.right)
        textFieldRightConstraint?.isActive = true

        return button
    }()

    internal lazy var infoIcon: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .center
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)

        imageView.leftAnchor.constraint(equalTo: bottomBorder.leftAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: infoLabel.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: infoLabel.bottomAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: infoLabel.heightAnchor).isActive = true

        infoLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor).isActive = true

        return imageView
    }()

    internal lazy var infoLabel: UILabel = {
        var label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = font.withSize(font.pointSize * placeholderSmallScale)

        addSubview(label)

        label.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true

        infoHeightConstraint = label.heightAnchor.constraint(equalToConstant: textFieldVerticalMargin)
        infoHeightConstraint?.isActive = true

        internalTextField.bottomAnchor.constraint(equalTo: label.topAnchor).isActive = true

        return label
    }()

    internal lazy var bottomBorder: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false

        addSubview(view)

        bottomBorderWidthConstraint = view.heightAnchor.constraint(equalToConstant: bottomBorderWidth)
        bottomBorderWidthConstraint?.isActive = true

        bottomBorderLeftConstraint = view.leftAnchor.constraint(equalTo: self.leftAnchor, constant: bottomBorderPadding.left)
        bottomBorderLeftConstraint?.isActive = true

        bottomBorderRightConstraint = view.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -bottomBorderPadding.right)
        bottomBorderRightConstraint?.isActive = true

        view.topAnchor.constraint(equalTo: internalTextField.bottomAnchor).isActive = true

        return view
    }()

    // MARK: Constraints

    internal var placeholderTopConstraint: NSLayoutConstraint?
    internal var placeholderLeftConstraint: NSLayoutConstraint?
    internal var placeholderXConstraint: NSLayoutConstraint?

    internal var textFieldTopConstraint: NSLayoutConstraint?
    internal var textFieldLeftConstraint: NSLayoutConstraint?
    internal var textFieldRightConstraint: NSLayoutConstraint?

    internal var infoHeightConstraint: NSLayoutConstraint?

    internal var secureEntryButtonWidthConstraint: NSLayoutConstraint?

    internal var bottomBorderWidthConstraint: NSLayoutConstraint?
    internal var bottomBorderLeftConstraint: NSLayoutConstraint?
    internal var bottomBorderRightConstraint: NSLayoutConstraint?

    // MARK: Initialization

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    internal func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        _ = placeholderLabel
        _ = bottomBorder
        _ = infoLabel
        _ = secureEntryButton
    }

    // MARK: Placeholder

    internal var placeholderSmallScale: CGFloat = 0.7
    internal var placeholderSmallFontSize: CGFloat { return font.pointSize * placeholderSmallScale }
    internal var textFieldVerticalMargin: CGFloat { return placeholderSmallFontSize + 10 }
    internal var textAlignmentObserver: NSKeyValueObservation?

    // MARK: Bottom Border Styling

    public var bottomBorderColor: UIColor? {
        didSet {
            bottomBorder.backgroundColor = bottomBorderColor
        }
    }

    public var bottomBorderWidth: CGFloat = 0 {
        didSet {
            bottomBorderWidthConstraint?.constant = bottomBorderWidth
        }
    }

    public var bottomBorderPadding: HorizontalPadding = (0,0) {
        didSet {
            bottomBorderLeftConstraint?.constant = bottomBorderPadding.left
            bottomBorderRightConstraint?.constant = -bottomBorderPadding.right
        }
    }

    // Default: UIColor.lightGray
    public var placeholderColor: UIColor = .lightGray {
        didSet {
            placeholderLabel.textColor = placeholderColor
        }
    }

    // MARK: Info Label

    public var infoTextColor: UIColor? {
        didSet {
            infoLabel.textColor = infoTextColor
        }
    }

    public var infoText: String? {
        return infoLabel.text?.trimmingCharacters(in: .whitespacesAndNewlines)
    }


    public func setInfoText(text: String, withIcon icon: UIImage? = nil) {
        infoLabel.text = text
        infoIcon.image = icon
    }


    // MARK: Seure Entry

    public func setSecureEntryButtonImages(enabled: UIImage, disabled: UIImage) {
        secureEntryButtonWidthConstraint?.isActive = false
        secureEntryButtonWidthConstraint = secureEntryButton.widthAnchor.constraint(equalTo: internalTextField.heightAnchor)
        secureEntryButtonWidthConstraint?.isActive = true

        secureEntryButton.isEnabled = true
        secureEntryButton.setImage(enabled, for: .normal)
        secureEntryButton.setImage(disabled, for: .selected)
        secureEntryButton.isSelected = !isSecureTextEntry
        secureEntryButton.addTarget(self, action: #selector(toggleSecureEntry), for: .touchUpInside)
    }


    @objc internal func toggleSecureEntry() {
        isSecureTextEntry = secureEntryButton.isSelected
        secureEntryButton.isSelected = !secureEntryButton.isSelected
    }

    // MARK: Miscellaneous

    public var font: UIFont = UIFont.systemFont(ofSize: 18) {
        didSet {
            internalTextField.font = font
            placeholderLabel.font = font
            infoLabel.font = font.withSize(font.pointSize * placeholderSmallScale)
            placeholderTopConstraint?.constant = textFieldVerticalMargin
            textFieldTopConstraint?.constant = textFieldVerticalMargin
            infoHeightConstraint?.constant = textFieldVerticalMargin
        }
    }

    /// Returns `true` if the textField has an actual
    /// value greater than an empty string; otherwise `false`.
    public var isEmpty: Bool {
        return text?.isEmpty ?? true
    }

    public var horizontalPadding: HorizontalPadding = (0,0) {
        didSet {
            placeholderLeftConstraint?.constant = horizontalPadding.left
            textFieldLeftConstraint?.constant = horizontalPadding.left
            textFieldRightConstraint?.constant = -horizontalPadding.right
        }
    }
}

