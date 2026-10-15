//
//  RestaurantListViewModel.swift
//  InterviewPrep
//
//  Created by Elena Rubilova on 10/15/26.
//
import Foundation

enum LoadingState {
    case idle
    case loading
    case loaded([Restaurant])
    case error(String)
}

@MainActor
@Observable
final class RestaurantListViewModel {
    private(set) var state: LoadingState = .idle
    
    func loadData() async {
        state = .loading
        do {
            state = .loaded(try await loadRestaurants())
            print("Success")
        } catch {
            // handle an error
            print(error)
            state = .error(error.localizedDescription)
        }
    }
    
    func loadRestaurants() async throws -> [Restaurant] {
        // where do we get data from
        guard let url = Bundle.main.url(forResource: "restaurants", withExtension: "json") else {
            throw URLError(.fileDoesNotExist)
        }
        let data = try Data(contentsOf: url)
        // declare decoder
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let response = try decoder.decode(RestaurantsResponse.self, from: data)
        return response.restaurants
    }
}
