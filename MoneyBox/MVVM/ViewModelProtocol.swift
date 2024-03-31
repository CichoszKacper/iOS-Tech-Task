//
//  ViewModelProtocol.swift
//  MoneyBox
//
//  Created by Kacper Cichosz on 3/31/24.
//

import Foundation

protocol ViewModelProtocol: ViewModel {
	associatedtype UpdateType
	associatedtype ErrorType
	var update: ((UpdateType) -> Void)? { get set }
	var error: ((ErrorType) -> Void)? { get set }
}
