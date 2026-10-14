//
//  ContentView.swift
//  InterviewPrep
//
//  Created by Elena Rubilova on 10/14/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, interview prep!")
        }
        .padding()
        .task {
            do {
                let restaurants = try loadRestaurants()
                print(restaurants.count, restaurants.first?.name ?? "none")
            } catch {
                print("Decoding failed:", error)
            }
        }
    }
    
    func loadRestaurants() throws -> [Restaurant] {
        guard let url = Bundle.main.url(forResource: "restaurants", withExtension: "json") else {
            throw URLError(.fileDoesNotExist)
        }
        let data = try Data(contentsOf: url)

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        let response = try decoder.decode(RestaurantsResponse.self, from: data)
        return response.restaurants
    }
}

#Preview {
    ContentView()
}
