//
//  LogInPresenter.swift
//  MVP Demo
//
//  Created by mac on 17/03/23.
//

import Foundation

protocol LogInPresenterView: AnyObject {
    func loading(isLoading: Bool)
    func showAlert(errorMsg: String)
    func logInSuccess()
}

class LogInPresenter {
    //MARK: - Properties
    weak var view: LogInPresenterView?
    
    //MARK: - LifeCycle
    init(view: LogInPresenterView) {
        self.view = view
    }
    
    //MARK: - Functions
    func logIn(email: String, password: String) {
        view?.loading(isLoading: true)
        FirebaseManager.shared.signIn(email: email, password: password) { [weak self] result in
            self?.view?.loading(isLoading: false)
            switch result {
            case .success():
                self?.view?.logInSuccess()
            case .failure(let error):
                self?.view?.showAlert(errorMsg: error.localizedDescription)
            }
        }
    }
}
