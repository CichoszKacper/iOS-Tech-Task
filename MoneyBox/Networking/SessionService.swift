//
//  SessionService.swift
//  MoneyBox
//
//  Created by Kacper Cichosz on 3/31/24.
//

import Foundation
import Networking

struct SessionService {
	private let sessionManager = SessionManager()
	private var session: LoginResponse.Session?
	private var user: LoginResponse.User?
	
	init(response: LoginResponse) {
		self.session = response.session
		self.user = response.user
		self.sessionManager.setUserToken(response.session.bearerToken)
	}
}
