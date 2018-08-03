//
//  AMTextField+Placeholder.swift
//  AMTextField
//
//  Created by Abood Mufti on 2018-08-03.
//  Copyright © 2018 abood mufti. All rights reserved.
//

import UIKit


extension AMTextField {

    @objc internal func movePlaceholderUp() {
        let labelWidth = placeholderLabel.bounds.size.width
        let xTransform = self.internalTextfield.textAlignment == .left ? -(1-self.placeholderSmallScale) * (labelWidth/2) : 0

        UIView.animate(withDuration: 0.1, delay: 0, options: [.curveEaseOut], animations: {
            var transform = CGAffineTransform.identity
            transform = transform.translatedBy(x: 0, y: 5)
            transform = transform.scaledBy(x: 1.1, y: 1.1)
            self.placeholderLabel.transform = transform
        }) { _ in
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: [.curveEaseOut], animations: {
                var transform = CGAffineTransform.identity
                transform = transform.translatedBy(x: xTransform, y: -self.textFieldVerticalMargin)
                transform = transform.scaledBy(x: self.placeholderSmallScale, y: self.placeholderSmallScale)
                self.placeholderLabel.transform = transform
            })
        }
    }

    @objc internal func movePlaceholderDown() {
        UIView.animate(withDuration: 0.1) { self.placeholderLabel.transform = .identity }
    }

    @objc internal func textfieldEditingDidEnd() {
        secureEntryButton.isEnabled = false
        secureEntryButton.alpha = 0
        if internalTextfield.text?.isEmpty ?? false { movePlaceholderDown() }
    }

    @objc internal func textfieldEditingDidBegin() {
        secureEntryButton.isEnabled = true
        secureEntryButton.alpha = 1
        if internalTextfield.text?.isEmpty ?? false { movePlaceholderUp() }
    }

    @objc internal func placeholderLabelTapped() {
        internalTextfield.becomeFirstResponder()
    }

    internal func textAlignmentHasChanged() {
        placeholderLabel.textAlignment = internalTextfield.textAlignment
        switch internalTextfield.textAlignment {
        case .left:
            placeholderXConstraint?.isActive = false
            placeholderLeftConstraint?.isActive = true
        case .center:
            placeholderXConstraint?.isActive = true
            placeholderLeftConstraint?.isActive = false
        default: break
        }
    }
}
