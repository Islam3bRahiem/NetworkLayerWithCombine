//
//  BaseViewModel.swift
//  NetworkLayerWithCombine
//
//  Created by Islam Rahiem on 31/05/2023.
//

import UIKit
import Combine

class BaseController<T: BaseViewModel>: UIViewController {

    //MARK: - ... Properties
    var viewModel: T


    //This property for hide and unhide navigation bar
    var hideNav: Bool = false

    
    lazy var cancellable: Set<AnyCancellable> = {
        return Set<AnyCancellable>()
    }()
        
    
    //MARK: - ... Init
    init(viewModel: T) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - ... Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bind(viewModel: viewModel)
        bindStates()
    }

    
    //MARK: - ... Functions
    func bind(viewModel: T){
        fatalError("Please override bind function")
    }
        
    func bindStates(){
        viewModel.isLoading
            .sink { [weak self] isLoading in
                guard let self = self else { return }
                if isLoading { self.startLoading() }
                else { self.stopLoading() }
            }.store(in: &cancellable)
        

        viewModel.displayMessage
            .sink { [weak self] message in
                guard let self = self else { return }
                self.displayAlertMessage(message: message)
            }.store(in: &cancellable)
    }

    
    //MARK: - ... Actions
    // This action for any back for all pages
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
