//
//  UILabel.swift
//
//
//  Created by Marquis Kurt on 18/7/22.
//

import UIKit

extension UILabel {
    /// Initializes a UILabel with default settings and specified text.
    /// - Parameter text: The text contents of the UILabel.
    public convenience init(text: String) {
        self.init(frame: .zero)
        self.text = text
    }
}
