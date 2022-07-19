//
//  UIBadgeImageView.swift
//
//
//  Created by Marquis Kurt on 18/7/22.
//

import UIKit

/// A UIImageView that contains a child badge.
///
/// Like a `UIImageView`, a ``UIBadgeImageView`` will display an image or a sequece of images. This view will
/// also include a child image view called the badge, which renders on top of the view. The badge is
/// constrained to the bottom right of the parent image view and is given a square size. The badge will
/// typically be a system symbol provided by SF Symbols.
public class UIBadgeImageView: UIImageView {
    /// The child image view that represents the badge image.
    public var badge: UIImageView

    /// A Boolean value that determines whether the view’s autoresizing mask is translated into Auto Layout
    /// constraints.
    ///
    /// - SeeAlso: ``UIView.translatesAutoResizingMaskIntoConstraints``.
    public override var translatesAutoresizingMaskIntoConstraints: Bool {
        didSet {
            self.badge.translatesAutoresizingMaskIntoConstraints = self.translatesAutoresizingMaskIntoConstraints
        }
    }

    // MARK: - Constructors

    /// Initializes a ``UIBadgeImageView`` with a default badge name and color.
    /// - Parameter badgeSystemName: The system name of an SF symbol to use as the badge image.
    /// - Parameter color: The color the badge image will be.
    public convenience init(badgeSystemName: String, color: UIColor) {
        self.init(frame: .zero, badge: badgeSystemName, with: 24)
        contentMode = .scaleAspectFit
        badge.image = badge.image?.withTintColor(color, renderingMode: .alwaysOriginal)
    }

    /// Initialize a ``UIBadgeImageView``.
    ///
    /// - Note: This initializer turns `translatesAutoresizingMaskIntoConstraints` off by default.
    ///
    /// - Parameter frame: The frame the view will have.
    /// - Parameter systemName: The system name of an SF symbol to use as the badge image.
    /// - parameter badgeSize: The width and height of the badge.
    public init(frame: CGRect, badge systemName: String, with badgeSize: CGFloat) {
        badge = UIImageView(frame: .zero)
        badge.translatesAutoresizingMaskIntoConstraints = false
        super.init(frame: frame)
        addSubview(badge)
        configureBadgeView(systemName: systemName, badgeSize: badgeSize)
    }

    @available(*, unavailable)
    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureBadgeView(systemName: String, badgeSize: CGFloat) {
        badge.image = UIImage(systemName: systemName)
        badge.backgroundColor = .systemBackground
        badge.layer.cornerRadius = badgeSize / 2
        badge.contentMode = .scaleAspectFit
        badge.constrainToSize(square: badgeSize)
        badge.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        badge.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        bringSubviewToFront(badge)
    }

    // MARK: - Class Methods

    /// Sets the color of the symbol in the badge to a specified color.
    /// - Parameter color: The UIColor to color the symbol with.
    public func setBadgeColor(to color: UIColor) {
        badge.image = badge.image?.withTintColor(color, renderingMode: .alwaysOriginal)
    }
}
