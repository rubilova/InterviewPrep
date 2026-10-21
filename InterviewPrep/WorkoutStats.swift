//
//  WorkoutStats.swift
//  InterviewPrep
//
//  Created by Elena Rubilova on 10/20/26.
//

// let minutes = [0, 30, 45, 60, 0, 90, 120]
let minutes = [0, 0, 0, 0, 0, 30, 45]
let days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]

let filtered = minutes.filter { $0 > 0 }

print("Total: \(filtered.reduce(0, +)) minutes")
print("Active days: \(filtered.count)")

if let bestDayIndex = minutes.indices.max(by: {minutes[$0] < minutes[$1]}) {
    print("Best day: " + days[bestDayIndex] + " \(minutes[bestDayIndex]) minutes")
} else {
    print("all days are 0")
}
var streak = 0
var maxStreak = 0
for dayMinutes in minutes {
    if dayMinutes > 0 {
        streak += 1
        maxStreak = max(maxStreak, streak)
    } else {
        streak = 0
    }
}

print("Longest streak: \(maxStreak)")
