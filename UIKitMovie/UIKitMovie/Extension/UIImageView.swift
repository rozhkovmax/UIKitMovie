// UIImageView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Расширение для UIImageView
extension UIImageView {
    func updateImageName(URLAddres: String) {
        guard let url = URL(string: URLAddres) else { return }
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                    self?.image = loadedImage
                }
            }
        }
    }
}
