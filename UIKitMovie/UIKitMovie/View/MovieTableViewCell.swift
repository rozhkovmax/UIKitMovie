// MovieTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер представления в ячейке
final class MovieTableViewCell: UITableViewCell {
    // MARK: - Private Constants

    private enum Constants {
        static let fatalErrorText = "Критическая ошибка"
        static let fontNameOne = "Helvetica-Bold"
        static let fontNameTwo = "AmericanTypewriter-Bold"
        static let fontNameThree = "Avenir-Black"
        static let blackCustomColor = UIColor(named: "blackCustomColor")
        static let yellowCustomColor = UIColor(named: "yellowCustomColor")
        static let darkGrayCustomColor = UIColor(named: "darkGrayCustomColor")
        static let grayCustomColor = UIColor(named: "grayCustomColor")
        static let lightGrayCustomColor = UIColor(named: "lightGrayCustomColor")
    }

    // MARK: Private Visual Component

    private let movieImageView = UIImageView()
    private let movieTitleLabel = UILabel()
    private let movieOverviewLabel = PaddingLabel()
    private let movieRatingLabel = UILabel()

    // MARK: - Life Cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constants.fatalErrorText)
    }

    // MARK: - Private Methods

    private func setupUI() {
        createMovieImageView()
        createMovieTitleLabel()
        createMovieOverviewLabel()
        createMovieRatingLabel()
        createVisualPresentation()
    }

    private func createVisualPresentation() {
        contentView.backgroundColor = Constants.blackCustomColor
    }

    private func createMovieRatingLabel() {
        contentView.addSubview(movieRatingLabel)
        movieRatingLabel.translatesAutoresizingMaskIntoConstraints = false
        movieRatingLabel.centerYAnchor.constraint(equalTo: movieImageView.bottomAnchor).isActive = true
        movieRatingLabel.rightAnchor.constraint(equalTo: movieImageView.rightAnchor).isActive = true
        movieRatingLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        movieRatingLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        movieRatingLabel.layer.cornerRadius = 10
        movieRatingLabel.clipsToBounds = true
        movieRatingLabel.backgroundColor = Constants.yellowCustomColor
        movieRatingLabel.textColor = Constants.blackCustomColor
        movieRatingLabel.textAlignment = .center
        movieRatingLabel.font = UIFont(name: Constants.fontNameOne, size: 15)
    }

    private func createMovieImageView() {
        contentView.addSubview(movieImageView)
        movieImageView.translatesAutoresizingMaskIntoConstraints = false
        movieImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        movieImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        movieImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        movieImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        movieImageView.widthAnchor.constraint(equalToConstant: 180).isActive = true
        movieImageView.layer.shadowColor = Constants.darkGrayCustomColor?.cgColor
        movieImageView.layer.shadowOffset = CGSize(width: -6, height: -6)
        movieImageView.layer.shadowOpacity = 10
        movieImageView.layer.shadowRadius = 6
        movieImageView.layer.masksToBounds = false
        movieImageView.contentMode = .scaleToFill
    }

    private func createMovieTitleLabel() {
        contentView.addSubview(movieTitleLabel)
        movieTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        movieTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        movieTitleLabel.leftAnchor.constraint(equalTo: movieImageView.rightAnchor, constant: 20).isActive = true
        movieTitleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        movieTitleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        movieTitleLabel.backgroundColor = Constants.grayCustomColor
        movieTitleLabel.numberOfLines = 0
        movieTitleLabel.layer.cornerRadius = 10
        movieTitleLabel.clipsToBounds = true
        movieTitleLabel.adjustsFontSizeToFitWidth = true
        movieTitleLabel.textAlignment = .center
        movieTitleLabel.font = UIFont(name: Constants.fontNameTwo, size: 18)
    }

    private func createMovieOverviewLabel() {
        contentView.addSubview(movieOverviewLabel)
        movieOverviewLabel.translatesAutoresizingMaskIntoConstraints = false
        movieOverviewLabel.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 10).isActive = true
        movieOverviewLabel.centerXAnchor.constraint(equalTo: movieTitleLabel.centerXAnchor).isActive = true
        movieOverviewLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        movieOverviewLabel.widthAnchor.constraint(equalTo: movieTitleLabel.widthAnchor).isActive = true
        movieOverviewLabel.backgroundColor = Constants.lightGrayCustomColor
        movieOverviewLabel.numberOfLines = 10
        movieOverviewLabel.layer.cornerRadius = 10
        movieOverviewLabel.clipsToBounds = true
        movieOverviewLabel.lineBreakMode = .byTruncatingTail
        movieOverviewLabel.textAlignment = .left
        movieOverviewLabel.padding(top: 0, bottom: 0, left: 10, right: 10)
        movieOverviewLabel.font = UIFont(name: Constants.fontNameThree, size: 15)
    }

    // MARK: - Public Methods

    func refrashMovie(_ movie: Movie) {
        movieTitleLabel.text = movie.title
        movieOverviewLabel.text = movie.overview
        guard let rating = movie.voteAverage else { return }
        movieRatingLabel.text = String(describing: rating)
        guard let image = movie.posterPath else { return }
        movieImageView.updateImageName(URLAddres: image)
    }
}
