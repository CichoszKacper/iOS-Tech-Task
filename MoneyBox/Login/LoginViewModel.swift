//
//  LoginViewModel.swift
//  MoneyBox
//
//  Created by Kacper Cichosz on 3/31/24.
//

import Foundation
import Networking

protocol LoginViewModelDelegate {
	func didLoginSuccessfully(session: SessionService)
}

class LoginViewModel: ViewModel, ViewModelProtocol {
	private var email: String?
	private var password: String?
	private let dataProvider = DataProvider()
	private var session: SessionService?
	var delegate: LoginViewModelDelegate?
	
	var update: ((LoginViewModel.UpdateType) -> Void)?
	enum UpdateType {
		case enterData
		case loggingIn
	}
	
	var error: ((LoginViewModel.ErrorType) -> Void)?
	enum ErrorType {
		case canNotProcessData
	}
	
	init(delegate: LoginViewModelDelegate) {
		self.delegate = delegate
	}
	
	public func login(email: String, password: String) {
		self.email = email
		self.password = password
		self.update?(.loggingIn)
		guard let email = self.email,
			  let password = self.password else {
			self.error?(.canNotProcessData)
			return
		}
		
		let loginRequest = LoginRequest(email: email, password: password)
		self.dataProvider.login(request: loginRequest) { [weak self] response in
			switch response {
			case .success(let successResponse):
				self?.session = SessionService(response: successResponse)
				if let session = self?.session {
					self?.delegate?.didLoginSuccessfully(session: session)
				}
			case .failure(let errorResponse):
				self?.error?(.canNotProcessData)
			}
		}
	}
}
