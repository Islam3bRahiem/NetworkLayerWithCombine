//
//  BaseController.swift
//  NetworkLayerWithCombine
//
//  Created by Islam Rahiem on 31/05/2023.
//

import Foundation
import Combine

protocol ViewModel {
    var isLoading: PassthroughSubject<Bool, Never> { get }
    var displayMessage: PassthroughSubject<String?, Never> { get }
}

class BaseViewModel: ViewModel {
    var cancellable = Set<AnyCancellable>()
    var isLoading: PassthroughSubject<Bool, Never> = .init()
    var displayMessage: PassthroughSubject<String?, Never> = .init()
}
