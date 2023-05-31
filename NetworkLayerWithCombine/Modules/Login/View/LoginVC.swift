//
//  LoginVC.swift
//  NetworkLayerWithCombine
//
//  Created by Islam Rahiem on 31/05/2023.
//

import UIKit

class LoginVC: BaseController<LoginViewModel> {

    // MARK: - ... Outlets
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var loginBtn: UIButton!

        
    // MARK: - ... LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    
    // MARK: - ... Binding
    override func bind(viewModel: LoginViewModel) {
        usernameTxt.textPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.username, on: self.viewModel)
            .store(in: &cancellable)
        
        passwordTxt.textPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.password, on: self.viewModel)
            .store(in: &cancellable)
        
        self.loginBtn
            .publisher(for: .touchUpInside)
            .sink {[weak self] _ in
                guard let self else { return }
                self.viewModel.login()
        }.store(in: &cancellable)

        viewModel.navigateToDashboard
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.presentNextScreen()
            }.store(in: &cancellable)
    }

    
    // MARK: - Functions
    private
    func setup() {
        self.hideNav = true
    }
    
    
    private
    func presentNextScreen() {
        let scene = UIViewController()
        scene.view.backgroundColor = .red
        self.present(scene, animated: true)
    }


}
