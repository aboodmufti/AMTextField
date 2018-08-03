//
//  AMTextField+UITextInputTraits.swift
//  AMTextField
//
//  Created by Abood Mufti on 2018-08-03.
//  Copyright © 2018 abood mufti. All rights reserved.
//

import UIKit


extension AMTextField: UITextInputTraits {


    public var text: String? {
        get {
            return internalTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        }
        set {
            internalTextField.text = newValue
        }
    }

    public var textColor: UIColor? {
        get {
            return internalTextField.textColor
        }
        set {
            internalTextField.textColor = newValue
        }
    }

    public var attributedText: NSAttributedString? {
        get {
            return internalTextField.attributedText
        }
        set {
            internalTextField.attributedText = newValue
        }
    }

    public var placeholder: String? {
        get {
            return placeholderLabel.text
        }
        set {
            internalTextField.placeholder = nil
            placeholderLabel.text = newValue
        }
    }

    public var attributedPlaceholder: NSAttributedString? {
        get {
            return placeholderLabel.attributedText
        }
        set {
            internalTextField.placeholder = nil
            placeholderLabel.attributedText = newValue
        }
    }

    public var textAlignment: NSTextAlignment {
        get {
            return internalTextField.textAlignment
        }
        set {
            internalTextField.textAlignment = newValue
            textAlignmentHasChanged()
        }
    }

    public var clearsOnBeginEditing: Bool {
        get {
            return internalTextField.clearsOnBeginEditing
        }
        set {
            internalTextField.clearsOnBeginEditing = newValue
        }
    }

    public var adjustsFontSizeToFitWidth: Bool {
        get {
            return internalTextField.adjustsFontSizeToFitWidth
        }
        set {
            internalTextField.adjustsFontSizeToFitWidth = newValue
        }
    }

    public var minimumFontSize: CGFloat {
        get {
            return internalTextField.minimumFontSize
        }
        set {
            internalTextField.minimumFontSize = newValue
        }
    }

    public var delegate: UITextFieldDelegate? {
        get {
            return internalTextField.delegate
        }
        set {
            internalTextField.delegate = newValue
        }
    }

    public override var tintColor: UIColor! {
        didSet {
            internalTextField.tintColor = tintColor
        }
    }

    public var isEditing: Bool { return internalTextField.isEditing }

    // MARK: UITextInputTraits

    public var autocapitalizationType: UITextAutocapitalizationType {
        get {
            return internalTextField.autocapitalizationType
        }
        set {
            internalTextField.autocapitalizationType = newValue
        }
    }

    public var autocorrectionType: UITextAutocorrectionType {
        get {
            return internalTextField.autocorrectionType
        }
        set {
            internalTextField.autocorrectionType = newValue
        }
    }

    public var spellCheckingType: UITextSpellCheckingType {
        get {
            return internalTextField.spellCheckingType
        }
        set {
            internalTextField.spellCheckingType = newValue
        }
    }

    public var smartQuotesType: UITextSmartQuotesType {
        get {
            return internalTextField.smartQuotesType
        }
        set {
            internalTextField.smartQuotesType = newValue
        }
    }

    public var smartDashesType: UITextSmartDashesType {
        get {
            return internalTextField.smartDashesType
        }
        set {
            internalTextField.smartDashesType = newValue
        }
    }

    public var smartInsertDeleteType: UITextSmartInsertDeleteType {
        get {
            return internalTextField.smartInsertDeleteType
        }
        set {
            internalTextField.smartInsertDeleteType = newValue
        }
    }

    public var keyboardType: UIKeyboardType {
        get {
            return internalTextField.keyboardType
        }
        set {
            internalTextField.keyboardType = newValue
        }
    }

    public var keyboardAppearance: UIKeyboardAppearance {
        get {
            return internalTextField.keyboardAppearance
        }
        set {
            internalTextField.keyboardAppearance = newValue
        }
    }

    public var enablesReturnKeyAutomatically: Bool {
        get {
            return internalTextField.enablesReturnKeyAutomatically
        }
        set {
            internalTextField.enablesReturnKeyAutomatically = newValue
        }
    }

    public var isSecureTextEntry: Bool {
        get {
            return internalTextField.isSecureTextEntry
        }
        set {
            internalTextField.isSecureTextEntry = newValue
        }
    }

    public var textContentType: UITextContentType! {
        get {
            return internalTextField.textContentType
        }
        set {
            internalTextField.textContentType = newValue
        }
    }

}
