//
//  Concurrency.swift
//  InterviewPrep
//
//  Created by Elena Rubilova on 10/23/26.
//

import SwiftUI

struct Concurrency: View {
    
    @State var greeting = /*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/
    func fetchCalories(for meal: String) async -> Int {
        try? await Task.sleep(for: .seconds(2))   // pretend this is the OpenAI call
        return meal.count * 50
    }

    func logMeal(for meals: [String]) async -> Int {
        var calories = 0
        for meal in meals {
            await calories += fetchCalories(for: meal)
        }
        print(calories)
        return calories
    }

    func logTwoMeals() async -> Int {
        async let oatmeal = fetchCalories(for: "oatmeal")
        async let salad   = fetchCalories(for: "salad")
        let total = await oatmeal + salad
        print(total)
        return total
    }

    func logMeals(for meals: [String]) async -> Int {
        await withTaskGroup(of: Int.self) { group in
            for meal in meals {
                group.addTask { await fetchCalories(for: meal) }   // start one child task per meal
            }
            var total = 0
            for await calories in group {
                total += calories                     // add up each result as it arrives
            }
            print(total)
            return total
        }
    }
    
    var body: some View {
        Text(greeting)
            .task {
                greeting = "\(await logMeals(for: ["oatmeal", "salad"]))"
        }
    }
}

#Preview {
    Concurrency()
}
