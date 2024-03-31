//
//  Thread + Extension.swift
//  MoneyBox
//
//  Created by Kacper Cichosz on 3/31/24.
//

import Foundation

public extension Thread {
	/// A method to ensure execution of the provided block on the main thread
	/// - Parameter block: The block to execute on the main thread
	class func runOnMain(block: () -> ()) {
		if Thread.isMainThread {
			block()
			return
		}
		DispatchQueue.main.sync {
			block()
		}
	}
}
