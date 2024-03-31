//
//  TabBarController.swift
//  MoneyBox
//
//  Created by Kacper Cichosz on 3/31/24.
//

import UIKit

class TabBarController: UITabBarController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.setUpTabBarController()
	}
	
	func setUpTabBarController() {
		let mainMenu = NavigationController(rootViewController: AccountViewController())
//		let peopleView = NavigationController(rootViewController: PeopleListViewController(viewModel: PeopleListViewModel()))
//		let roomsView = NavigationController(rootViewController: RoomListViewController(viewModel: RoomListViewModel()))
		self.setViewControllers([mainMenu], animated: true)
		guard let items = self.tabBar.items else {
			return
		}
		
		if #available(iOS 15, *) {
			let appearance = UITabBarAppearance()
			appearance.configureWithDefaultBackground()
			appearance.stackedLayoutAppearance.normal.iconColor = .blue
			appearance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
			
			appearance.stackedLayoutAppearance.selected.iconColor = .green
			appearance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
			
			self.tabBar.standardAppearance = appearance
			self.tabBar.scrollEdgeAppearance = appearance
		}
		
		let images = ["house"]
		for (index, item) in items.enumerated() {
			item.image = UIImage(named: images[index])
		}
	}
	
	override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
		let viewController = self.viewControllers?[selectedIndex] as? NavigationController
		viewController?.popToRootViewController(animated: false)
	}
}

