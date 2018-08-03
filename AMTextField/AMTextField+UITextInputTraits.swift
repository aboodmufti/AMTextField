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
            return internalTextfield.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        }
        set {
            internalTextfield.text = newValue
        }
    }

    public var textColor: UIColor? {
        get {
            return internalTextfield.textColor
        }
        set {
            internalTextfield.textColor = newValue
        }
    }

    public var attributedText: NSAttributedString? {
        get {
            return internalTextfield.attributedText
        }
        set {
            internalTextfield.attributedText = newValue
        }
    }

    public var placeholder: String? {
        get {
            return placeholderLabel.text
        }
        set {
            internalTextfield.placeholder = nil
            placeholderLabel.text = newValue
        }
    }

    public var attributedPlaceholder: NSAttributedString? {
        get {
            return placeholderLabel.attributedText
        }
        set {
            internalTextfield.placeholder = nil
            placeholderLabel.attributedText = newValue
        }
    }

    public var textAlignment: NSTextAlignment {
        get {
            return internalTextfield.textAlignment
        }
        set {
            internalTextfield.textAlignment = newValue
            textAlignmentHasChanged()
        }
    }

    public var clearsOnBeginEditing: Bool {
        get {
            return internalTextfield.clearsOnBeginEditing
        }
        set {
            internalTextfield.clearsOnBeginEditing = newValue
        }
    }

    public var adjustsFontSizeToFitWidth: Bool {
        get {
            return internalTextfield.adjustsFontSizeToFitWidth
        }
        set {
            internalTextfield.adjustsFontSizeToFitWidth = newValue
        }
    }

    public var minimumFontSize: CGFloat {
        get {
            return internalTextfield.minimumFontSize
        }
        set {
            internalTextfield.minimumFontSize = newValue
        }
    }

    public var delegate: UITextFieldDelegate? {
        get {
            return internalTextfield.delegate
        }
        set {
            internalTextfield.delegate = newValue
        }
    }

    public override var tintColor: UIColor! {
        didSet {
            internalTextfield.tintColor = tintColor
        }
    }

    public var isEditing: Bool { return internalTextfield.isEditing }

    // MARK: UITextInputTraits

    public var autocapitalizationType: UITextAutocapitalizationType {
        get {
            return internalTextfield.autocapitalizationType
        }
        set {
            internalTextfield.autocapitalizationType = newValue
        }
    }

    public var autocorrectionType: UITextAutocorrectionType {
        get {
            return internalTextfield.autocorrectionType
        }
        set {
            internalTextfield.autocorrectionType = newValue
        }
    }

    public var spellCheckingType: UITextSpellCheckingType {
        get {
            return internalTextfield.spellCheckingType
        }
        set {
            internalTextfield.spellCheckingType = newValue
        }
    }

    public var smartQuotesType: UITextSmartQuotesType {
        get {
            return internalTextfield.smartQuotesType
        }
        set {
            internalTextfield.smartQuotesType = newValue
        }
    }

    public var smartDashesType: UITextSmartDashesType {
        get {
            return internalTextfield.smartDashesType
        }
        set {
            internalTextfield.smartDashesType = newValue
        }
    }

    public var smartInsertDeleteType: UITextSmartInsertDeleteType {
        get {
            return internalTextfield.smartInsertDeleteType
        }
        set {
            internalTextfield.smartInsertDeleteType = newValue
        }
    }

    public var keyboardType: UIKeyboardType {
        get {
            return internalTextfield.keyboardType
        }
        set {
            internalTextfield.keyboardType = newValue
        }
    }

    public var keyboardAppearance: UIKeyboardAppearance {
        get {
            return internalTextfield.keyboardAppearance
        }
        set {
            internalTextfield.keyboardAppearance = newValue
        }
    }

    public var enablesReturnKeyAutomatically: Bool {
        get {
            return internalTextfield.enablesReturnKeyAutomatically
        }
        set {
            internalTextfield.enablesReturnKeyAutomatically = newValue
        }
    }

    public var isSecureTextEntry: Bool {
        get {
            return internalTextfield.isSecureTextEntry
        }
        set {
            internalTextfield.isSecureTextEntry = newValue
        }
    }

    public var textContentType: UITextContentType! {
        get {
            return internalTextfield.textContentType
        }
        set {
            internalTextfield.textContentType = newValue
        }
    }

}
