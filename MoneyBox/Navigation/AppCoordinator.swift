//
//  AppCoordinator.swift
//  MoneyBox
//
//  Created by Kacper Cichosz on 3/31/24.
//

import Foundation
import UIKit

class AppCoordinator: LoginViewModelDelegate {
	var navigationController: NavigationController?
	var window: UIWindow
	
	init(window: UIWindow) {
		self.window = window
		let loginViewController = LoginViewController(viewModel: LoginViewModel(delegate: self))
		self.window.rootViewController = loginViewController
		self.window.makeKeyAndVisible()
	}
	
	func setupNavigationController() {
		let tabBarController = TabBarController()
		let navigationController = NavigationController(rootViewController: tabBarController)
		navigationController.navigationBar.backIndicatorImage = UIImage(named: "chevron.backward.circle.fill")
		navigationController.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "chevron.backward.circle.fill")
		self.navigationController = navigationController
		self.window.rootViewController = self.navigationController
	}
	
	func didLoginSuccessfully(session: SessionService) {
		self.setupNavigationController()
	}
}
