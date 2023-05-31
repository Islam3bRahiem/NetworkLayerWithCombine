//
//  AlertFacade.swift
//  NetworkLayerWithCombine
//
//  Created by Islam Rahiem on 31/05/2023.
//

import UIKit

protocol AlertFacade {
    func notify()
}

extension AlertFacade where Self: NotificationBuilder {
    
    func notify() {
        let alert = UIAlertController(title: self.title,
                                      message: self.body,
                                      preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default,
                                      handler: {(_: UIAlertAction!) in
            self.agreeHandler?()
        }))
        
        guard let topController: UIViewController = UIApplication.keyWindow?.rootViewController else {
            return
        }
        topController.present(alert, animated: true, completion: nil)
    }
}
