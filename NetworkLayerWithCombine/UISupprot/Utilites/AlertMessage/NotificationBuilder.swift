//
//  NotificationBuilder.swift
//  NetworkLayerWithCombine
//
//  Created by Islam Rahiem on 31/05/2023.
//

import Foundation

class NotificationBuilder: AlertFacade {
    var title: String? = nil,
        body: String? = nil,
        displayButton: Bool = false,
        agreeHandler: (() -> Void)? = nil
    
    init() {
        
    }
    func setTitle(_ title: String?) -> Self {
        self.title = title
        return self
    }
    func setBody(_ body: String?) -> Self {
        self.body = body
        return self
    }
    func setButton(_ button: Bool) -> Self {
        self.displayButton = button
        return self
    }
    func setAgreeHandler(_ handler: (() -> Void)?) -> Self {
        self.agreeHandler = handler
        return self
    }
    @discardableResult
    func bulid() -> Self {
        notify()
        return self
    }
}
