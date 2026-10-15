//
//  Restaurant.swift
//  InterviewPrep
//
//  Created by Elena Rubilova on 10/14/26.
//

import Foundation

struct Restaurant: Codable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let cuisines: [String]
    let rating: Double?
    let reviewCount: Int
    let priceLevel: Int
    let isOpen: Bool
    let imageUrl: String?
    let delivery: Delivery
    let address: Address
    let promo: String?
    
    func ratingString() -> String {
        rating.map{"\($0)"} ?? "Not yet rated"
    }
    
    func ratingStringI() -> String {
        if let rating {
            return String(format: "%.0f", rating)
        }
        else {
            return "Not yet rated"
        }
        
    }
    
    func ratingStringII() -> String {
        guard let rating
        else {
            return "Not yet rated"
        }
        return String(format: "%.0f", rating)
    }
}

struct Address: Codable {
    let street: String
    let city: String
    let state: String
    let zipCode: String
    let latitude: Double
    let longitude: Double
}

struct Delivery: Codable {
    let fee: Double
    let estimatedMinutes: Int
    let distanceMiles: Double
}

struct RestaurantsResponse: Codable {
    let page: Int
    let perPage: Int
    let totalPages: Int
    let nextPageUrl: String?
    let restaurants: [Restaurant]
}
