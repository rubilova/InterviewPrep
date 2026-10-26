//
//  JSONDecoding.swift
//  InterviewPrep
//
//  Created by Elena Rubilova on 10/26/26.
//

import Foundation
import SwiftUI

struct MealAnalysisResponse: Codable {
    let calories: Int
    let healthScore: Int
    //let gutScore: Int
    //let protein: String
    //let balance: String
    //let suggestions: [String]
}

func analyze(_ json: String) -> String {
    var result: String
    let data = Data(json.utf8)      // never fails, so no guard needed
        do {
            // 1. decode `data` into MealAnalysisResponse here (with try)
            let decoder = JSONDecoder()
            let response = try decoder.decode(MealAnalysisResponse.self, from: data)
            // 2. print "540 calories, health score 82" using the result
            result = "Your meal calories: \(response.calories), health score: \(response.healthScore)"
            
        } catch {
            // 3. print the friendly message
            result = "Sorry, we couldn't read this meal"
            print("Debug: Error converting JSON data: \(error)")
        }
    return result
}

struct JSONDecoding: View {
    
    private let goodJSON = #"{"calories": 540, "healthScore": 82}"#
    private let badJSON  = #"{"calories": 540.5, "healthScore": 82}"#
    
    var body: some View {
        VStack {
            Text(analyze(goodJSON))
            Text(analyze(badJSON))
        }
    }
}

#Preview {
    JSONDecoding()
}
