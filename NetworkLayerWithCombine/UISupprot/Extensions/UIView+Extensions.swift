//
//  UIView+Extensions.swift
//  NetworkLayerWithCombine
//
//  Created by Islam Rahiem on 31/05/2023.
//

import UIKit

// MARK: - Methods
public extension UIView {
    
    /// SwifterSwift: Add array of subviews to view.
    ///
    /// - Parameter subviews: array of subviews to add to self.
    func addSubviews(_ subviews: [UIView]) {
        subviews.forEach({ self.addSubview($0) })
    }
        
    /// SwifterSwift: Remove all subviews in view.
    func removeSubviews() {
        subviews.forEach({ $0.removeFromSuperview() })
    }
    
    /// SwifterSwift: Remove  subview in view with tag.
    func removeSubviewWithTag(_ tag: Int) {
        subviews.forEach({
            if let viewWithTag = $0.viewWithTag(tag) {
                viewWithTag.removeFromSuperview()
            }
        })
    }
    
    /// A helper function to add multiple subviews.
    func addSubviews(_ subviews: UIView...) {
      subviews.forEach {
        addSubview($0)
      }
    }
}
