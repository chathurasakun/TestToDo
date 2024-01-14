//
//  SearchViewModel.swift
//  TestToDo
//
//  Created by CHATHURA ELLAWALA on 2024-01-12.
//

import UIKit

protocol SearchViewModelProtocol {
    var searchResults: [SearchResult] { get set }
    func fetchSearchResults(completion: @escaping viewControllerHandler)
}

class SearchViewModel: SearchViewModelProtocol {
    
    var networkManager: ApiClient
    var searchResults: [SearchResult] = []
    
    init(networkManager: ApiClient) {
        self.networkManager = networkManager
    }
    
    func fetchSearchResults(completion: @escaping viewControllerHandler) {
        networkManager.fetchSearchResults(searchText: "") { (_, _, results) in
            if let results = results {
                self.searchResults = results
                completion(true, "Data fetched successfully")
            }
            completion(false, "No results available")
        }
    }
}
