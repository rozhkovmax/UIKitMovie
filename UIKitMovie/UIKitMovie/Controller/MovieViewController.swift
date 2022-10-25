// MovieViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер представления фильмов
final class MovieViewController: UIViewController {
    // MARK: - Private Constants

    private enum Constants {
        static let titleText = "Movie"
        static let indentifierMovieCell = "MovieCell"
        static let movieSegmentControlItems = ["В прокате", "Популярное", "Топ рейтинга"]
        static let errorText = "Ошибка"
    }

    private enum ApiKey {
        static let rentalApiKey =
            "https://api.themoviedb.org/3/movie/upcoming?api_key=b6abe1b1835ab9f0603050760032a03a&language=ru-RU&page=1"
        static let popularApiKey =
            "https://api.themoviedb.org/3/movie/popular?api_key=b6abe1b1835ab9f0603050760032a03a&language=ru-RU&page=1"
        static let topApiKey =
            "https://api.themoviedb.org/3/movie/top_rated?api_key=b6abe1b1835ab9f0603050760032a03a&language=ru-RU&page=1"
    }

    // MARK: Private Visual Component

    private let movieSegmentControl = UISegmentedControl(items: Constants.movieSegmentControlItems)
    private let movieTableView = UITableView()

    // MARK: - Private Properties

    private var movies: ResultsMovie?

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        createMovieSegmentControl()
        createMovieTableView()
        title = Constants.titleText
        createMovies(ApiKey.rentalApiKey)
    }

    private func createMovies(_ key: String) {
        guard let url = URL(string: key) else { return }
        let session = URLSession.shared
        session.dataTask(with: url) { data, response, error in
            guard let response = response, let data = data else { return }
            print(response)
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                self.movies = try decoder.decode(ResultsMovie.self, from: data)
                DispatchQueue.main.async {
                    self.movieTableView.reloadData()
                }
            } catch {
                print(Constants.errorText, error)
            }
        }.resume()
    }

    private func createMovieSegmentControl() {
        view.addSubview(movieSegmentControl)
        movieSegmentControl.translatesAutoresizingMaskIntoConstraints = false
        movieSegmentControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        movieSegmentControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        movieSegmentControl.widthAnchor.constraint(equalToConstant: 300).isActive = true
        movieSegmentControl.heightAnchor.constraint(equalToConstant: 50).isActive = true
        movieSegmentControl.backgroundColor = .lightGray
        movieSegmentControl.selectedSegmentIndex = 0
        movieSegmentControl.addTarget(self, action: #selector(movieSegmentControlAction), for: .valueChanged)
    }

    private func createMovieTableView() {
        view.addSubview(movieTableView)
        movieTableView.translatesAutoresizingMaskIntoConstraints = false
        movieTableView.topAnchor.constraint(equalTo: movieSegmentControl.bottomAnchor, constant: 20).isActive = true
        movieTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        movieTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        movieTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        movieTableView.dataSource = self
        movieTableView.delegate = self
        movieTableView.backgroundColor = .white
        movieTableView.register(MovieTableViewCell.self, forCellReuseIdentifier: Constants.indentifierMovieCell)
    }

    @objc private func movieSegmentControlAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            createMovies(ApiKey.rentalApiKey)
            print("В прокате")
        case 1:
            createMovies(ApiKey.popularApiKey)
            print("Популярное")
        case 2:
            createMovies(ApiKey.topApiKey)
            print("Топ рейтинга")
        default:
            break
        }
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension MovieViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies?.results.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.indentifierMovieCell,
            for: indexPath
        ) as? MovieTableViewCell else { return UITableViewCell() }
        guard let item = movies?.results[indexPath.row] else { return UITableViewCell() }
        cell.refrashMovie(item)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
