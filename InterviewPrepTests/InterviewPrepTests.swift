//
//  InterviewPrepTests.swift
//  InterviewPrepTests
//
//  Created by Elena Rubilova on 10/14/26.
//

import Testing
import Foundation
@testable import InterviewPrep

struct InterviewPrepTests {

    @Test func example() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    }

}

@MainActor
struct RestaurantDecodingTests {

    @Test func decodesRestaurantWithNullRating() throws {
        let json = """
        {
          "id": 1,
          "name": "Test Diner",
          "description": "Eggs",
          "cuisines": ["American"],
          "rating": null,
          "review_count": 0,
          "price_level": 1,
          "is_open": true,
          "image_url": null,
          "delivery": { "fee": 1.5, "estimated_minutes": 20, "distance_miles": 1.0 },
          "address": {
            "street": "1 Main St", "city": "New York", "state": "NY",
            "zip_code": "10001", "latitude": 40.0, "longitude": -73.0
          },
          "promo": null
        }
        """.data(using: .utf8)!

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        let restaurant = try decoder.decode(Restaurant.self, from: json)

        #expect(restaurant.name == "Test Diner")
        #expect(restaurant.rating == nil)
        #expect(restaurant.address.zipCode == "10001")
    }
}
