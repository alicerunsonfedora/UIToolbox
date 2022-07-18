//
//  UIView.swift
//  
//
//  Created by Marquis Kurt on 18/7/22.
//

import UIKit

extension UIView {

    // MARK: - Binding to Edges

    /// Sets the constraints of the current view to be bound to the edges of another view.
    ///
    /// - Parameter view: The view that the current view will be constrained to.
    /// - Parameter insets: The insets to be used as padding from the parent view when setting constraints.
    /// The default value is `UIEdgeInsets.zero`.
    /// - Parameter useSafeArea: Whether to bind to the view's safe area layout guide.
    func bind(to view: UIView, insets: UIEdgeInsets = .zero, useSafeArea: Bool = true) {
        self.topAnchor.constraint(
            equalTo: useSafeArea ? view.safeAreaLayoutGuide.topAnchor : view.topAnchor,
            constant: insets.top
        ).isActive = true
        self.leftAnchor.constraint(
            equalTo: useSafeArea ? view.safeAreaLayoutGuide.leftAnchor : view.leftAnchor,
            constant: insets.left
        ).isActive = true
        self.rightAnchor.constraint(
            equalTo: useSafeArea ? view.safeAreaLayoutGuide.rightAnchor : view.rightAnchor,
            constant: -insets.right
        ).isActive = true
        self.bottomAnchor.constraint(
            equalTo: useSafeArea ? view.safeAreaLayoutGuide.bottomAnchor : view.bottomAnchor,
            constant: -insets.bottom
        ).isActive = true
    }

    /// Sets the constraints of the current view to be bound to the edges of another view.
    ///
    /// - Parameter view: The view that the current view will be constrained to.
    /// - Parameter horizontalInsets: The number of pixels to be padded away from the superview in the
    /// horizontal direction. The default value is 0.
    /// - Parameter verticalInsets: The number of pixels to be padded away from the superview in the vertical
    /// direction. The default value is 0.
    /// The default value is `UIEdgeInsets.zero`.
    /// - Parameter useSafeArea: Whether to bind to the view's safe area layout guide.
    func bind(
        to view: UIView,
        horizontalInsets: CGFloat = .zero,
        verticalInsets: CGFloat = .zero,
        useSafeArea: Bool = true
    ) {
        self.bind(
            to: view,
            insets: .init(
                top: verticalInsets,
                left: horizontalInsets,
                bottom: verticalInsets,
                right: horizontalInsets
            ),
            useSafeArea: useSafeArea
        )
    }

    /// Sets the constraints of the current view to be bound to the edges of its super view, provided that the
    /// super view exists.
    ///
    /// - Parameter view: The view that the current view will be constrained to.
    /// - Parameter insets: The insets to be used as padding from the parent view when setting constraints.
    /// The default value is `UIEdgeInsets.zero`.
    /// - Parameter useSafeArea: Whether to bind to the view's safe area layout guide.
    func bindToSuperView(insets: UIEdgeInsets, useSafeArea: Bool = true) {
        guard let superview = self.superview else { return }
        self.bind(to: superview, insets: insets, useSafeArea: useSafeArea)
    }

    /// Sets the constraints of the current view to be bound to the edges of its super view, provided that the
    /// super view exists.
    ///
    /// - Parameter view: The view that the current view will be constrained to.
    /// - Parameter horizontalInsets: The number of pixels to be padded away from the superview in the
    /// horizontal direction. The default value is 0.
    /// - Parameter verticalInsets: The number of pixels to be padded away from the superview in the vertical
    /// direction. The default value is 0.
    /// The default value is `UIEdgeInsets.zero`.
    /// - Parameter useSafeArea: Whether to bind to the view's safe area layout guide.
    func bindToSuperView(
        horizontalInsets: CGFloat = .zero,
        verticalInsets: CGFloat = .zero,
        useSafeArea: Bool = true
    ) {
        guard let superview = self.superview else { return }
        self.bind(
            to: superview,
            horizontalInsets: horizontalInsets,
            verticalInsets: verticalInsets,
            useSafeArea: useSafeArea
        )
    }

    // MARK: - Size Constraining

    /// Sets the constraints of the current view to be of a specific height and width.
    /// - Parameter width: The width of the view.
    /// - Parameter height: The height of the view.
    func constrainToSize(width: CGFloat, height: CGFloat) {
        self.widthAnchor.constraint(equalTo: width).isActive = true
        self.heightAnchor.constraint(equalTo: height).isActive = true
    }

    /// Sets the constraints of the current view to be of a specific height and width where the width and the
    /// height are equal (i.e., a square).
    /// - Parameter square: The width and height of the view.
    func constrainToSize(square: CGFloat) {
        self.constrainToSize(width: square, height: square)
    }

}
