// FilmViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер представления фильма
final class FilmViewController: UIViewController {
    // MARK: - Private Constants

    private enum Constants {
        //       static let titleText = "Кино"
        static let dateOfReleaseText = "Дата релиза:"
        static let popularityText = "Популярность:"
        static let originalTitleText = "Оригинальное название:"
    }

    // MARK: Private Visual Component

    private let filmImageView = UIImageView()
    private let filmOriginLable = UILabel()
    private let filmFeatureLabel = UILabel()
    private let filmDescriptionLable = UILabel()

    // MARK: - Private Properties

    //   private let filmCollectionView = FilmCollectionView()

    // MARK: - Public Properties

    var film: Movie?

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        createVisualPresentation()
        createFilmImageView()
        createFilmOriginLable()
        createFilmFeatureLabel()
        createFilmDescriptionLable()
        //    createFilmCollectionView()
    }

    private func createVisualPresentation() {
        view.backgroundColor = .red
        title = film?.title
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.gray]
        navigationController?.navigationBar.tintColor = UIColor.gray
    }

    private func createFilmImageView() {
        view.addSubview(filmImageView)
        filmImageView.translatesAutoresizingMaskIntoConstraints = false
        filmImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        filmImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        filmImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5).isActive = true
        filmImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        filmImageView.backgroundColor = .yellow
        filmImageView.layer.cornerRadius = 10
        filmImageView.clipsToBounds = true
        filmImageView.contentMode = .scaleToFill
        if let imageName = film?.backdropPath {
            filmImageView.updateImageName(URLAddres: imageName)
        }
    }

    private func createFilmOriginLable() {
        view.addSubview(filmOriginLable)
        filmOriginLable.translatesAutoresizingMaskIntoConstraints = false
        filmOriginLable.topAnchor.constraint(equalTo: filmImageView.bottomAnchor, constant: 10).isActive = true
        filmOriginLable.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        filmOriginLable.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5).isActive = true
        filmOriginLable.heightAnchor.constraint(equalToConstant: 50).isActive = true
        filmOriginLable.backgroundColor = .brown
        filmOriginLable.numberOfLines = 0
        filmOriginLable.adjustsFontSizeToFitWidth = true
        filmOriginLable.textAlignment = .center
        filmOriginLable.layer.cornerRadius = 10
        filmOriginLable.clipsToBounds = true
        guard let originTitle = film?.originalTitle,
              let originLanguage = film?.originalLanguage else { return }
        filmOriginLable
            .text = "\(Constants.originalTitleText) \(originTitle) (\(originLanguage.uppercased()))"
    }

    private func createFilmFeatureLabel() {
        view.addSubview(filmFeatureLabel)
        filmFeatureLabel.translatesAutoresizingMaskIntoConstraints = false
        filmFeatureLabel.topAnchor.constraint(equalTo: filmOriginLable.bottomAnchor, constant: 10).isActive = true
        filmFeatureLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        filmFeatureLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5).isActive = true
        filmFeatureLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        filmFeatureLabel.backgroundColor = .brown
        filmFeatureLabel.numberOfLines = 0
        filmFeatureLabel.adjustsFontSizeToFitWidth = true
        filmFeatureLabel.textAlignment = .center
        filmFeatureLabel.layer.cornerRadius = 10
        filmFeatureLabel.clipsToBounds = true
        guard let popularity = film?.popularity,
              let dateOfRelease = film?.releaseDate else { return }
        filmFeatureLabel
            .text = "\(Constants.dateOfReleaseText) \(dateOfRelease) \(Constants.popularityText) \(popularity)"
    }

    private func createFilmDescriptionLable() {
        view.addSubview(filmDescriptionLable)
        filmDescriptionLable.translatesAutoresizingMaskIntoConstraints = false
        filmDescriptionLable.topAnchor.constraint(equalTo: filmFeatureLabel.bottomAnchor, constant: 10).isActive = true
        filmDescriptionLable.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        filmDescriptionLable.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5).isActive = true
        filmDescriptionLable.heightAnchor.constraint(equalToConstant: 300).isActive = true
        filmDescriptionLable.backgroundColor = .gray
        filmDescriptionLable.numberOfLines = 0
        filmDescriptionLable.adjustsFontSizeToFitWidth = true
        filmDescriptionLable.textAlignment = .left
        filmDescriptionLable.layer.cornerRadius = 10
        filmDescriptionLable.clipsToBounds = true
        filmDescriptionLable.text = film?.overview
    }

//    private func createFilmCollectionView() {
//        view.addSubview(filmCollectionView)
//        filmCollectionView.translatesAutoresizingMaskIntoConstraints = false
//        filmCollectionView.topAnchor.constraint(equalTo: filmDescriptionLable.bottomAnchor, constant: 10)
//            .isActive = true
//        filmCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        filmCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//        filmCollectionView.heightAnchor.constraint(equalToConstant: 180).isActive = true
//    }
}
