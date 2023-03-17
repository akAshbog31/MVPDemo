//
//  LogInVc.swift
//  MVP Demo
//
//  Created by mac on 17/03/23.
//

import UIKit

class LogInVc: BaseVc {
    //MARK: - @IBOutlet
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnEye: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var viewLogIn: UIView!
    @IBOutlet weak var viewEmail: UIView!
    @IBOutlet weak var viewPassword: UIView!
    
    //MARK: - Properties
    var presenter: LogInPresenter?
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUi()
        presenter = LogInPresenter(view: self)
    }
    
    //MARK: - @IBAction
    @IBAction func btnSignUp(_ sender: Any) {
        pushVc(vc: SignupVc.self)
    }
    
    @IBAction func onTapBtnLogIn(_ sender: Any) {
        guard let email = txtEmail.text, !email.isEmpty else {
            showAlert(msg: "Please enter valid email")
            return
        }
        
        guard let password = txtPassword.text, !password.isEmpty else {
            showAlert(msg: "Please enter valid password")
            return
        }
        
        presenter?.logIn(email: email, password: password)
    }
    
    @IBAction func onTapBtnEye(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        txtPassword.isSecureTextEntry = !sender.isSelected
    }
    
    //MARK: - Functions
    private func setUpUi() {
        viewLogIn.layer.cornerRadius = 12
        viewEmail.layer.cornerRadius = 12
        viewPassword.layer.cornerRadius = 12
        btnEye.isSelected = false
        viewEmail.setShadow(shadowColor: .gray)
        viewPassword.setShadow(shadowColor: .gray)
    }
}

//MARK: - LogInPresenterView
extension LogInVc: LogInPresenterView {
    func loading(isLoading: Bool) {
        isLoading ? showHUD() : dismissHUD()
    }
    
    func showAlert(errorMsg: String) {
        showAlert(msg: errorMsg)
    }
    
    func logInSuccess() {
        showAlert(errorMsg: "Log in Success....")
    }
}

