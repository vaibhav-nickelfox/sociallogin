//
//  NavigationItem.swift
//  TemplateProject
//
//  Created by Ravindra Soni on 18/12/16.
//  Copyright © 2016 Nickelfox. All rights reserved.
//

import UIKit

private let titleFont: UIFont = UIFont.systemFont(ofSize: 18.0)
private let barButtonFont: UIFont = UIFont.systemFont(ofSize: 18.0)
class StyledNavigationItem: UINavigationItem {
	
	@IBInspectable var backButtonTitle: String? = nil {
		didSet {
			self.updateBackButtonTitle()
		}
	}
	
	override var title: String? {
		didSet {
			self.updateTitle()
		}
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		self.updateTitle()
		
		self.updateBackButtonTitle()
		
		if let item = self.leftBarButtonItem { self.configureFontsForBarButtonItem(item: item) }
		if let item = self.rightBarButtonItem { self.configureFontsForBarButtonItem(item: item) }
	}
	
	private func configureFontsForBarButtonItem(item: UIBarButtonItem) {
		item.setTitleTextAttributes([
			NSFontAttributeName: barButtonFont,
			NSForegroundColorAttributeName: UIColor.white
			], for: .normal)
	}
	
	private func updateTitle() {
		if let title = self.title {
			self.attributedTitle = NSAttributedString(string: title, attributes: [
				NSFontAttributeName: titleFont,
				NSForegroundColorAttributeName: UIColor.white
				])
		} else {
			self.attributedTitle = nil
		}
	}
	
	private func updateBackButtonTitle() {
		self.backBarButtonItem = UIBarButtonItem(title: self.backButtonTitle ?? "", style: .plain, target: nil, action: nil)
	}
	
}

private let kAttributedTitleLabelTag = 325

extension UINavigationItem {
	
	public var attributedTitle: NSAttributedString? {
		get {
			return  self.labelForAttributedTitle()?.attributedText
		}
		set(attributedTitle){
			let label: UILabel
			if let currentLabel = self.labelForAttributedTitle() {
				label = currentLabel
			} else {
				label = UILabel()
				label.tag = kAttributedTitleLabelTag
				self.titleView = label
			}
			
			label.attributedText = attributedTitle
			label.textAlignment = NSTextAlignment.center
			label.sizeToFit()
		}
	}
	
	private func labelForAttributedTitle() -> UILabel? {
		var label : UILabel? = nil
		if let currentLabel = self.titleView as? UILabel , currentLabel.tag == kAttributedTitleLabelTag {
			label = currentLabel
		}
		return label
	}
	
}
