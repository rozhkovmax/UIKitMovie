// NSMutableAttributedString.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// MARK: - NSMutableAttributedString

extension NSMutableAttributedString {
    var boldFont: UIFont { UIFont.boldSystemFont(ofSize: 18) }
    var systemFont: UIFont { UIFont.systemFont(ofSize: 18) }

    func bold(_ value: String) -> NSMutableAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: boldFont
        ]
        append(NSAttributedString(string: value, attributes: attributes))
        return self
    }

    func normal(_ value: String) -> NSMutableAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: systemFont,
        ]
        append(NSAttributedString(string: value, attributes: attributes))
        return self
    }
}
