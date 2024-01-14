//
//  ApiClient.swift
//  TestToDo
//
//  Created by CHATHURA ELLAWALA on 2024-01-12.
//
import Foundation

protocol ApiClient {
    func fetchSearchResults(searchText: String, completion: @escaping searchResultsHander)
    func fetchItemDetails(id: UUID, completion: @escaping itemDetailsHandler)
}
