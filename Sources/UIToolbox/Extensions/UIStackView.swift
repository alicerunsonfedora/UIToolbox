//
//  UIStackView.swift
//
//
//  Created by Marquis Kurt on 18/7/22.
//

import UIKit

extension UIStackView {
    /// Initializes a stack view with default settings.
    /// - Parameter axis: The axis in which the items will be stacked.
    /// - Parameter alignment: The alignment in which the items in the stack will be aligned. The default value
    /// is center.
    /// - Parameter spacing: The number of pixels to add between each item in the stack. The default value is 0.
    convenience init(
        axis: NSLayoutConstraint.Axis,
        alignment: UIStackView.Alignment = .center,
        spacing: CGFloat = .zero
    ) {
        self.init(frame: .zero)
        self.axis = axis
        self.alignment = alignment
        self.spacing = spacing
    }

    /// Adds a list of subviews to the stack and arranges it in the stack.
    ///
    /// - Important: The views in the array will be added in the order they appear in the array. To ensure that
    /// this method adds the views in the order you specify, sort or reorder your array to match.
    ///
    /// - Parameter views: The views to add to the stack view.
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach { view in
            self.addArrangedSubview(view)
        }
    }
}
