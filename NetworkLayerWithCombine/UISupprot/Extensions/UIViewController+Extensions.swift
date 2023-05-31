//
//  UIViewController+Extensions.swift
//  NetworkLayerWithCombine
//
//  Created by Islam Rahiem on 31/05/2023.
//

import UIKit

extension UIViewController {
    
    func startLoading() {
        self.view.hideToastActivity()
        self.view.makeToastActivity(.center)
    }
    
    func stopLoading() {
        //remove the spinner view controller
        self.view.removeSubviewWithTag(403415)
        self.view.hideToastActivity()
    }
    
    func displayAlertMessage(message: String?) {
        guard let message = message,
              !message.isEmpty
        else { return }
        let model = NotificationBuilder()
        model.setTitle("")
             .setBody(message)
             .bulid()
    }
}
