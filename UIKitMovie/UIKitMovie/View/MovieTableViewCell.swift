// MovieTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер представления в ячейке
final class MovieTableViewCell: UITableViewCell {
    // MARK: - Private Constants

    private enum Constants {
        static let fatalErrorText = "Критическая ошибка"
        static let fontName = "Helvetica-Bold"
//        static let blackColor = UIColor(named: "BlackColorCastom")
    }

    // MARK: Private Visual Component

    private let movieImageView = UIImageView()
    private let movieTitleLabel = UILabel()
    private let movieOverviewLabel = UILabel()
    private let movieRaitingLable = UILabel()

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
        createMovieRaitingLable()
//        contentView.backgroundColor = Constants.blackColor
    }

    private func createMovieRaitingLable() {
        contentView.addSubview(movieRaitingLable)
        movieRaitingLable.translatesAutoresizingMaskIntoConstraints = false
        movieRaitingLable.bottomAnchor.constraint(equalTo: movieImageView.bottomAnchor).isActive = true
        movieRaitingLable.rightAnchor.constraint(equalTo: movieImageView.rightAnchor).isActive = true
        movieRaitingLable.heightAnchor.constraint(equalToConstant: 30).isActive = true
        movieRaitingLable.widthAnchor.constraint(equalToConstant: 40).isActive = true
        movieRaitingLable.layer.cornerRadius = 10
        movieRaitingLable.clipsToBounds = true
        movieRaitingLable.backgroundColor = .green
        movieRaitingLable.textAlignment = .center
        movieRaitingLable.font = UIFont(name: Constants.fontName, size: 15)
    }

    private func createMovieImageView() {
        contentView.addSubview(movieImageView)
        movieImageView.translatesAutoresizingMaskIntoConstraints = false
        movieImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        movieImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        movieImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        movieImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        movieImageView.widthAnchor.constraint(equalToConstant: 180).isActive = true
        movieImageView.layer.cornerRadius = 10
        movieImageView.clipsToBounds = true
        movieImageView.contentMode = .scaleAspectFit
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
    }

    // MARK: - Public Methods

    func refrashMovie(_ movie: Movie) {
        movieTitleLabel.text = movie.title
        movieOverviewLabel.text = movie.overview
        if let rating = movie.voteAverage {
            movieRaitingLable.text = String(describing: rating)
        }
        if let image = movie.posterPath {
            movieImageView.updateImageName(URLAddres: image)
        }
    }
}
