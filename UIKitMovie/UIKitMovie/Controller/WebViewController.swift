// WebViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

import WebKit

/// Контроллер веб страницы
final class WebViewController: UIViewController {
    // MARK: - Private Constants

    private enum Constants {
        static let webTitleText = "https://www.kinopoisk.ru"
    }

    // MARK: Private Visual Component

    private let toolBar = UIToolbar()
    private let goBackBarButtonItem = UIBarButtonItem(systemItem: .rewind)
    private let goForwardBarButtonItem = UIBarButtonItem(systemItem: .fastForward)
    private let spaceBarButtonItem = UIBarButtonItem(systemItem: .flexibleSpace)
    private let refreshBarButtonItem = UIBarButtonItem(systemItem: .refresh)
    private let progressView = UIProgressView()

    // MARK: - Private Properties

    private let webView = WKWebView()
    private var observer: NSKeyValueObservation?

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        createWebView()
        createToolBar()
        createProgressView()
    }

    private func createProgressView() {
        view.addSubview(progressView)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.leftAnchor.constraint(equalTo: webView.leftAnchor, constant: 140).isActive = true
        progressView.rightAnchor.constraint(equalTo: webView.rightAnchor, constant: -100).isActive = true
        progressView.bottomAnchor.constraint(equalTo: webView.bottomAnchor, constant: -23).isActive = true
        progressView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        progressView.centerXAnchor.constraint(equalTo: webView.centerXAnchor).isActive = true
        observer = webView.observe(\.estimatedProgress, options: [.new]) { _, _ in
            self.progressView.progress = Float(self.webView.estimatedProgress)
        }
        progressView.tintColor = .yellow
        progressView.trackTintColor = .white
    }

    private func createWebView() {
        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        webView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        webView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        guard let url = URL(string: Constants.webTitleText) else { return }
        let request = URLRequest(url: url)
        webView.load(request)
        webView.navigationDelegate = self
    }

    private func createToolBar() {
        view.addSubview(toolBar)
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        toolBar.leftAnchor.constraint(equalTo: webView.leftAnchor).isActive = true
        toolBar.rightAnchor.constraint(equalTo: webView.rightAnchor).isActive = true
        toolBar.bottomAnchor.constraint(equalTo: webView.bottomAnchor).isActive = true
        toolBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        toolBar.isTranslucent = false
        toolBar.items = [
            goBackBarButtonItem,
            goForwardBarButtonItem,
            spaceBarButtonItem,
            refreshBarButtonItem
        ]
        goBackBarButtonItem.action = #selector(goBackItemAction)
        goForwardBarButtonItem.action = #selector(goForwardItemAction)
        refreshBarButtonItem.action = #selector(refreshItemAction)
        toolBar.barTintColor = .black
        toolBar.tintColor = .yellow
    }

    @objc private func goBackItemAction() {
        if webView.canGoBack {
            webView.goBack()
        }
    }

    @objc private func goForwardItemAction() {
        if webView.canGoForward {
            webView.goForward()
        }
    }

    @objc private func refreshItemAction() {
        webView.reload()
    }
}

// MARK: - UIWebViewDelegate

extension WebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        goBackBarButtonItem.isEnabled = webView.canGoBack
        goForwardBarButtonItem.isEnabled = webView.canGoForward
    }
}
