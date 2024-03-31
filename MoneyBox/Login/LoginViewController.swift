//
//  LoginViewController.swift
//  MoneyBox
//
//  Created by Kacper Cichosz on 3/31/24.
//

import UIKit

class LoginViewController: ModelledViewController<LoginViewModel> {
	@IBOutlet weak var emailAddressTextfield: UITextField!
	@IBOutlet weak var passwordTextfield: UITextField!
	@IBOutlet weak var loginButton: UIButton!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		self.hideKeyboardWhenTappedAround()
		self.viewModel.update?(.enterData)
    }
	
	override func updateView(_ type: LoginViewModel.UpdateType) {
		switch type {
		case .enterData:
			//TODO: Main view
			break
		case .loggingIn:
			//TODO: Loading
			break
		}
	}
	
	@IBAction func loginButtonPressed() {
		if let email = emailAddressTextfield.text,
		   let password = passwordTextfield.text {
			self.viewModel.login(email: email,
								 password: password)
		}
	}
}
