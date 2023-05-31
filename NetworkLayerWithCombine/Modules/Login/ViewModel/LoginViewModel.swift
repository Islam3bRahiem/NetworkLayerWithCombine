//
//  LoginViewModel.swift
//  NetworkLayerWithCombine
//
//  Created by Islam Rahiem on 31/05/2023.
//

import Foundation
import Combine

protocol LoginViewModelInputs {
    func login()
}

protocol LoginViewModelOutputs {
    var navigateToDashboard: PassthroughSubject<Void, Never> { get }
}

protocol LoginViewModelProtocol {
    var inputs: LoginViewModelInputs { get set }
    var outputs: LoginViewModelOutputs { get }
}


// MARK: - ...  ViewModel
class LoginViewModel: BaseViewModel,
                      LoginViewModelProtocol,
                      LoginViewModelInputs,
                      LoginViewModelOutputs {
    
    var inputs: LoginViewModelInputs {
        get {
            return self
        }
        set {}
    }
    
    var outputs: LoginViewModelOutputs {
        return self
    }

    
    private var loginService: LoginServiceProtocol
    

    init(loginService: LoginServiceProtocol = LoginService()) {
        self.loginService = loginService
    }
    
    @Published var username: String = ""
    @Published var password: String = ""

    
    // MARK: - ... Outputs
    var navigateToDashboard = PassthroughSubject<Void, Never>()

    
    // MARK: - ... Inputs
    func login() {
        guard !username.isEmpty , !password.isEmpty else {
            self.displayMessage.send("Enter username and password")
            return
        }
        
        isLoading.send(true)

        let loginDTO: LoginDTO = .init(username: username,
                                       password: password)
        
        self.loginService.login(request: loginDTO)
            .receive(on: DispatchQueue.main)
            .sink { (completion) in
                self.isLoading.send(false)
                switch completion {
                case .failure(let error):
                    self.displayMessage.send(error.localizedDescription)
                case .finished:
                    print("FINISHED")
                }
            } receiveValue: { (response) in
                if response.status,
                   let data = response.data {
                    //Handle Response Successed
                    printIfDebug("\(data)")
                    self.navigateToDashboard.send(())
                } else {
                    self.displayMessage.send(response.message)
                }            }
            .store(in: &cancellable)
    }

}

