//
//  MainCoordinator.swift
//  TestToDo
//
//  Created by CHATHURA ELLAWALA on 2024-01-12.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var networkManager: ApiClient
    
    init(navigationController: UINavigationController, networkManager: ApiClient) {
        self.navigationController = navigationController
        self.networkManager = networkManager
    }
    
    func start() {
        let searchViewModel = SearchViewModel(networkManager: networkManager)
        let searchViewController = SearchViewController(viewModel: searchViewModel)
        searchViewController.coordinator = self
        navigationController.pushViewController(searchViewController, animated: false)
    }
    
    func gotoDetailsView(title: String, selectedItem: SearchResult) {
        let detailsViewModel = DetailsViewModel(networkManager: networkManager, searchResult: selectedItem)
        let detailsViewController = DetailsViewController(viewModel: detailsViewModel, title: title)
        navigationController.pushViewController(detailsViewController, animated: true)
    }
}
