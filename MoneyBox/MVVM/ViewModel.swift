//
//  ViewModel.swift
//  MoneyBox
//
//  Created by Kacper Cichosz on 3/31/24.
//

import Foundation

class ViewModel {
	
	enum BaseType {
		case beginLoading
		case endLoading
	}
	
	var base: ((BaseType) -> Void)?
}
