//
//  SignupVc.swift
//  MVP Demo
//
//  Created by mac on 17/03/23.
//

import UIKit

class SignupVc: BaseVc {
    //MARK: - @IBOutlet
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConformPassword: UITextField!
    @IBOutlet weak var viewUserName: UIView!
    @IBOutlet weak var viewEmail: UIView!
    @IBOutlet weak var viewPassword: UIView!
    @IBOutlet weak var viewConformPassword: UIView!
    @IBOutlet weak var viewSignUp: UIView!
    
    //MARK: - Properties
    var presenter: SignupPresenter?
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUi()
        presenter = SignupPresenter(view: self)
    }
    
    //MARK: - @IBAction
    @IBAction func onTapBtnEye(_ sender: UIButton) {
        if sender.tag == 0 {
            sender.isSelected = !sender.isSelected
            txtPassword.isSecureTextEntry = !sender.isSelected
        } else {
            sender.isSelected = !sender.isSelected
            txtConformPassword.isSecureTextEntry = !sender.isSelected
        }
    }
    
    @IBAction func onTapBtnSignUp(_ sender: Any) {
        guard let email = txtEmail.text, !email.isEmpty else {
            showAlert(msg: "Please enter valid email")
            return
        }
        
        guard let password = txtPassword.text, !password.isEmpty else {
            showAlert(msg: "Please enter valid password")
            return
        }
        
        guard let conformPassword = txtConformPassword.text, password == conformPassword else {
            showAlert(msg: "Conform password dose not match with password")
            return
        }
        
        presenter?.createUser(name: txtUserName.text ?? "", email: email, password: password)
    }
    
    @IBAction func onTapBtnLogIn(_ sender: Any) {
        popVc()
    }
    
    //MARK: - Functions
    private func setUpUi() {
        viewSignUp.layer.cornerRadius = 12
        viewEmail.layer.cornerRadius = 12
        viewUserName.layer.cornerRadius = 12
        viewConformPassword.layer.cornerRadius = 12
        viewPassword.layer.cornerRadius = 12
        viewEmail.setShadow(shadowColor: .gray)
        viewPassword.setShadow(shadowColor: .gray)
        viewConformPassword.setShadow(shadowColor: .gray)
        viewUserName.setShadow(shadowColor: .gray)
    }
}

//MARK: - SignupPresenterView
extension SignupVc: SignupPresenterView {
    func loading(isLoading: Bool) {
        isLoading ? showHUD() : dismissHUD()
    }
    
    func showAlert(errorMsg: String) {
        showAlert(msg: errorMsg)
    }
    
    func userCreatedSuccess() {
        pushVc(vc: LogInVc.self)
    }
}
