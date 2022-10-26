// FilmCollectionViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка коллекции с фото актеров
final class FilmCollectionViewCell: UICollectionViewCell {
    // MARK: - Private Constants

    private enum Constants {
        static let fatalErrorText = "Критическая ошибка"
    }

    // MARK: Private Visual Component

    private let actorImageView = UIImageView()

    // MARK: - Initialize

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constants.fatalErrorText)
    }

    // MARK: - Private Methods

    private func setupUI() {
        createActorImageView()
    }

    private func createActorImageView() {
        contentView.addSubview(actorImageView)
        actorImageView.translatesAutoresizingMaskIntoConstraints = false
        actorImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        actorImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        actorImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        actorImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        actorImageView.contentMode = .scaleAspectFit
        actorImageView.backgroundColor = .blue
        actorImageView.layer.cornerRadius = 5
        actorImageView.layer.shadowRadius = 10
        actorImageView.layer.shadowOpacity = 0.3
        actorImageView.layer.shadowOffset = CGSize(width: 5, height: 8)
        actorImageView.clipsToBounds = true
    }
}
