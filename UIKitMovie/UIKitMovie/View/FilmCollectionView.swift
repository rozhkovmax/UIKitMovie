// FilmCollectionView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Настройка коллекции с фото актеров
final class FilmCollectionView: UICollectionView {
    // MARK: - Private Constants

    private enum Constants {
        static let fatalErrorText = "Критическая ошибка"
        static let indentifierActorCollectionCell = "ActorCollectionCell"
    }

    // MARK: - Private Properties

    //  private var actors: [] = []

    // MARK: - Initialize

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        super.init(frame: .zero, collectionViewLayout: layout)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constants.fatalErrorText)
    }

    // MARK: - Private Methods

    private func setupUI() {
        createCollectionView()
    }

    private func createCollectionView() {
        delegate = self
        dataSource = self
        register(FilmCollectionViewCell.self, forCellWithReuseIdentifier: Constants.indentifierActorCollectionCell)
        contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        backgroundColor = .cyan
        showsHorizontalScrollIndicator = false
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension FilmCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //   actors.count
        5
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Constants.indentifierActorCollectionCell,
            for: indexPath
        ) as? FilmCollectionViewCell else { return UICollectionViewCell() }
        //                guard let item = movies?.results[indexPath.row] else { return UITableViewCell() }
        //                cell.refrashMovie(item)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension FilmCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        CGSize(width: 150, height: 150)
    }
}
