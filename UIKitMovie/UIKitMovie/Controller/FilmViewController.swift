// FilmViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер представления фильма
final class FilmViewController: UIViewController {
    // MARK: - Private Constants

    private enum Constants {
        static let dateOfReleaseText = "Дата релиза:"
        static let popularityText = "Популярность:"
        static let originalTitleText = "Оригинальное название:"
        static let myUIKitMovieText = "https://github.com/rozhkovmax/UIKitMovie"
        static let rightBarButtonItemImageName = "square.and.arrow.up"
    }

    // MARK: Private Visual Component

    private let filmImageView = UIImageView()
    private let filmOriginLable = PaddingLabel()
    private let filmFeatureLabel = PaddingLabel()
    private let filmDescriptionLable = PaddingLabel()

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
        createTapRecognizer()
    }

    private func createVisualPresentation() {
        view.backgroundColor = .black
        title = film?.title
        navigationController?.navigationBar
            .titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.yellow]
        navigationController?.navigationBar.tintColor = UIColor.yellow
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: Constants.rightBarButtonItemImageName),
            style: .plain,
            target: self,
            action: #selector(rightBarButtonAction)
        )
    }

    private func createTapRecognizer() {
        filmImageView.isUserInteractionEnabled = true
        filmImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapAction)))
    }

    private func createFilmImageView() {
        view.addSubview(filmImageView)
        filmImageView.translatesAutoresizingMaskIntoConstraints = false
        filmImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        filmImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        filmImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5).isActive = true
        filmImageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        filmImageView.backgroundColor = .black
        filmImageView.layer.cornerRadius = 10
        filmImageView.clipsToBounds = true
        filmImageView.contentMode = .scaleToFill
        filmImageView.layer.borderWidth = 1
        filmImageView.layer.borderColor = UIColor.yellow.cgColor
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
        filmOriginLable.backgroundColor = .black
        filmOriginLable.numberOfLines = 0
        filmOriginLable.adjustsFontSizeToFitWidth = true
        filmOriginLable.textAlignment = .center
        filmOriginLable.layer.cornerRadius = 10
        filmOriginLable.clipsToBounds = true
        filmOriginLable.layer.borderWidth = 1
        filmOriginLable.layer.borderColor = UIColor.yellow.cgColor
        filmOriginLable.textColor = .white
        filmOriginLable.padding(top: 0, bottom: 0, left: 10, right: 10)
        guard let originTitle = film?.originalTitle,
              let originLanguage = film?.originalLanguage else { return }
        filmOriginLable.attributedText = NSMutableAttributedString()
            .normal("\(Constants.originalTitleText) \n")
            .bold("\(originTitle) (\(originLanguage.uppercased()))")
    }

    private func createFilmFeatureLabel() {
        view.addSubview(filmFeatureLabel)
        filmFeatureLabel.translatesAutoresizingMaskIntoConstraints = false
        filmFeatureLabel.topAnchor.constraint(equalTo: filmOriginLable.bottomAnchor, constant: 10).isActive = true
        filmFeatureLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        filmFeatureLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5).isActive = true
        filmFeatureLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        filmFeatureLabel.backgroundColor = .black
        filmFeatureLabel.numberOfLines = 0
        filmFeatureLabel.adjustsFontSizeToFitWidth = true
        filmFeatureLabel.textAlignment = .center
        filmFeatureLabel.padding(top: 0, bottom: 0, left: 10, right: 10)
        filmFeatureLabel.layer.cornerRadius = 10
        filmFeatureLabel.clipsToBounds = true
        filmFeatureLabel.layer.borderWidth = 1
        filmFeatureLabel.layer.borderColor = UIColor.yellow.cgColor
        filmFeatureLabel.textColor = .white
        guard let popularity = film?.popularity,
              let dateOfRelease = film?.releaseDate else { return }
        filmFeatureLabel.attributedText = NSMutableAttributedString()
            .normal("\(Constants.dateOfReleaseText) \(dateOfRelease) \n \(Constants.popularityText) \(popularity)")
    }

    private func createFilmDescriptionLable() {
        view.addSubview(filmDescriptionLable)
        filmDescriptionLable.translatesAutoresizingMaskIntoConstraints = false
        filmDescriptionLable.topAnchor.constraint(equalTo: filmFeatureLabel.bottomAnchor, constant: 10).isActive = true
        filmDescriptionLable.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        filmDescriptionLable.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5).isActive = true
        filmDescriptionLable.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        filmDescriptionLable.backgroundColor = .black
        filmDescriptionLable.numberOfLines = 0
        filmDescriptionLable.adjustsFontSizeToFitWidth = true
        filmDescriptionLable.textAlignment = .justified
        filmDescriptionLable.padding(top: 0, bottom: 0, left: 20, right: 20)
        filmDescriptionLable.layer.cornerRadius = 10
        filmDescriptionLable.clipsToBounds = true
        filmDescriptionLable.text = film?.overview
        filmDescriptionLable.layer.borderWidth = 1
        filmDescriptionLable.layer.borderColor = UIColor.yellow.cgColor
        filmDescriptionLable.textColor = .white
    }

    @objc private func rightBarButtonAction() {
        guard let titleText = film?.title else { return }
        let buttonActivityViewController = UIActivityViewController(
            activityItems: [titleText],
            applicationActivities: nil
        )
        present(buttonActivityViewController, animated: true)
    }

    @objc private func tapAction(param: UIGestureRecognizer) {
        // let webViewController = WebViewController()
        //   present(webViewController, animated: true)
        //  navigationController?.pushViewController(webViewController, animated: true)
    }
}
