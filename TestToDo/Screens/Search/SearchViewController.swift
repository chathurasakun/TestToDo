//
//  ViewController.swift
//  TestToDo
//
//  Created by CHATHURA ELLAWALA on 2024-01-12.
//

import UIKit

class SearchViewController: UIViewController {
    
    // MARK: - Variables
    weak var coordinator: MainCoordinator?
    var viewModel: SearchViewModel!
    
    // MARK: - Components
    private var searchTableView: UITableView!
    
    private lazy var searchController: UISearchController = {
        let controller = UISearchController(searchResultsController: nil)
        controller.searchResultsUpdater = self
        controller.obscuresBackgroundDuringPresentation = false
        return controller
    }()
    
    init(viewModel: SearchViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchSearchResults()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        view.backgroundColor = .white
        title = "Search Today's Special"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
        
        searchTableView = UITableView(frame: .zero, style: .plain)
        searchTableView.translatesAutoresizingMaskIntoConstraints = false
        searchTableView.allowsMultipleSelection = true
        searchTableView.backgroundColor = .clear
        searchTableView.delegate = self
        searchTableView.dataSource = self
        view.addSubview(searchTableView)
        
        let searchTableViewConstraints = [
            searchTableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12),
            searchTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            searchTableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12),
            searchTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0)
        ]
        NSLayoutConstraint.activate(searchTableViewConstraints)
        
        searchTableView.register(SearchResultCell.self, forCellReuseIdentifier: SearchResultCell.identifier)
    }
}

// MARK: - UISeacrhController Delegate
extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
       fetchSearchResults()
    }
}

// MARK: - UITableView Datasource
extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let searchResultCell = tableView.dequeueReusableCell(withIdentifier: SearchResultCell.identifier) as? SearchResultCell {
            let searchItem = viewModel.searchResults[indexPath.row]
            searchResultCell.configData(searchResult: searchItem)
            return searchResultCell
        }
        return UITableViewCell()
    }
}

// MARK: - UITableView Delegate
extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let searchItem = viewModel.searchResults[indexPath.row].itemName else {
            return
        }
        let selectedItem = viewModel.searchResults[indexPath.row]
        coordinator?.gotoDetailsView(title: searchItem, selectedItem: selectedItem)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

// MARK: - API Requests
extension SearchViewController {
    private func fetchSearchResults() {
        viewModel.fetchSearchResults { (success, message) in
            if success {
                self.searchTableView.reloadData()
            }
        }
    }
}

