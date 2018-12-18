//
//  UIView+Extension.swift
//  ViewSetupPostLayout
//
//  Created by Jonathan Oh on 12/17/18.
//  Copyright © 2018 Jonathan Oh. All rights reserved.
//

import UIKit

// This extension can help avoid having to store constraints
// UIView Extension to access any constraint a view might have
extension UIView {
    
    var topAnchorConstraint: NSLayoutConstraint? {
        return getConstraintFromSuperview(.top)
    }
    
    var leftAnchorConstraint: NSLayoutConstraint? {
        return getConstraintFromSuperview(.left)
    }
    
    var bottomAnchorConstraint: NSLayoutConstraint? {
        return getConstraintFromSuperview(.bottom)
    }
    
    var rightAnchorConstraint: NSLayoutConstraint? {
        return getConstraintFromSuperview(.right)
    }
    
    var leadingAnchorConstraint: NSLayoutConstraint? {
        return getConstraintFromSuperview(.leading)
    }
    
    var trailingAnchorConstraint: NSLayoutConstraint? {
        return getConstraintFromSuperview(.trailing)
    }
    
    var centerXAnchorConstraint: NSLayoutConstraint? {
        return getConstraintFromSuperview(.centerX)
    }
    
    var centerYAnchorConstraint: NSLayoutConstraint? {
        return getConstraintFromSuperview(.centerY)
    }
    
    var widthAnchorConstraint: NSLayoutConstraint? {
        return constraints.filter { $0.firstAttribute == .width }.first ?? getConstraintFromSuperview(.width)
    }
    
    var heightAnchorConstraint: NSLayoutConstraint? {
        return constraints.filter { $0.firstAttribute == .height }.first ?? getConstraintFromSuperview(.height)
    }
    
    private func getConstraintFromSuperview(_ constraintAnchor: NSLayoutConstraint.Attribute) -> NSLayoutConstraint? {
        return superview?.constraints.filter { $0.firstItem === self && $0.firstAttribute == constraintAnchor }.first
    }
    
    // Removes all constraints related to the view this function is being invoked on
    func removeAllConstraints() {
        removeConstraints(superview?.constraints.filter { $0.firstItem === self } ?? [])
        removeConstraints(constraints)
    }
    
}
