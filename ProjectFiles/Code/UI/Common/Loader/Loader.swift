//
//  Loader.swift
//  TemplateProject
//
//  Created by Ravindra Soni on 16/12/16.
//  Copyright © 2016 Nickelfox. All rights reserved.
//

import UIKit
import MBProgressHUD

class Loader {
	
	static func showAdded(to view: UIView, animated: Bool){
		MBProgressHUD.showAdded(to: view, animated: animated)
	}

	static func hide(for view: UIView, animated: Bool){
		MBProgressHUD.hide(for: view, animated: animated)
	}
}

extension UIViewController {
	
	func showLoader(animated: Bool = false) {
		Loader.showAdded(to: self.view, animated: animated)
	}

	func hideLoader(animated: Bool = false) {
		Loader.hide(for: self.view, animated: animated)
	}
	
}
