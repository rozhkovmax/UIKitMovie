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
    }

    // MARK: Private Visual Component

    private let movieImageView = UIImageView()
    private let movieTitleLabel = UILabel()
    private let movieOverviewLabel = PaddingLabel()
    private let movieRatingLable = UILabel()

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
        createMovieRatingLable()
        contentView.backgroundColor = .black
    }

    private func createMovieRatingLable() {
        contentView.addSubview(movieRatingLable)
        movieRatingLable.translatesAutoresizingMaskIntoConstraints = false
        movieRatingLable.centerYAnchor.constraint(equalTo: movieImageView.bottomAnchor).isActive = true
        movieRatingLable.rightAnchor.constraint(equalTo: movieImageView.rightAnchor).isActive = true
        movieRatingLable.heightAnchor.constraint(equalToConstant: 30).isActive = true
        movieRatingLable.widthAnchor.constraint(equalToConstant: 40).isActive = true
        movieRatingLable.layer.cornerRadius = 10
        movieRatingLable.clipsToBounds = true
        movieRatingLable.backgroundColor = .yellow
        movieRatingLable.textColor = .black
        movieRatingLable.textAlignment = .center
        movieRatingLable.font = UIFont(name: Constants.fontNameOne, size: 15)
    }

    private func createMovieImageView() {
        contentView.addSubview(movieImageView)
        movieImageView.translatesAutoresizingMaskIntoConstraints = false
        movieImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        movieImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        movieImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        movieImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        movieImageView.widthAnchor.constraint(equalToConstant: 180).isActive = true
        movieImageView.layer.shadowColor = UIColor.darkGray.cgColor
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
        movieTitleLabel.backgroundColor = .gray
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
        movieOverviewLabel.backgroundColor = .lightGray
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
        if let rating = movie.voteAverage {
            movieRatingLable.text = String(describing: rating)
        }
        if let image = movie.posterPath {
            movieImageView.updateImageName(URLAddres: image)
        }
    }
}
