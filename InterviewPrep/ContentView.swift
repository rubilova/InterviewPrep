//
//  ContentView.swift
//  InterviewPrep
//
//  Created by Elena Rubilova on 10/14/26.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = RestaurantListViewModel()
    
    var body: some View {
        VStack {
            
            Group {
                switch viewModel.state {
                    case .idle:
                    Text("Hello, interview prep!")
                    case .loading:
                        ProgressView()
                    case .loaded(let restaurants):
                        List(restaurants) { restaurant in
                            HStack {
                                Text(restaurant.ratingStringI())
                                Text(restaurant.name)
                            }
                        
                        }
                    case .error(let error):
                    Text(error.localizedCapitalized)
                    }
                }
            }
        .task {
            await viewModel.loadData()
        }
        
        
    }
}

#Preview {
    ContentView()
}
