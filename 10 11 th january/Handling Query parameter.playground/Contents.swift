//1. Basic Query Parameters: Simple Key-Value Pairs
/*
 Query Parameter :-
 A query parameter is added to the URL after the ? symbol and is composed of a key-value pair separated by =, with multiple pairs separated by &.
 
 
 
 */

import Foundation
//let baseURL = "https://api.example.com/products"
//let category = "electronics"
//let priceMin = 100
//let priceMax = 1000
//let urlString = "\(baseURL)?category=\(category)&price_min=\(priceMin)&price_max=\(priceMax)"
//print(urlString)
//if let url = URL(string: urlString){
//    print(url)
//}


/*

// Base URL for OpenWeatherMap API
let baseURL = "https://api.openweathermap.org/data/2.5/weather"

// Parameters
let city = "London"
let apiKey = "YOUR_API_KEY"  // Replace with your actual API key

// Construct URL using URLComponents
var urlComponents = URLComponents(string: baseURL)!
urlComponents.queryItems = [
    URLQueryItem(name: "q", value: city),
    URLQueryItem(name: "appid", value: apiKey)
]

// Safely unwrap the URL
if let url = urlComponents.url {
    print("Built URL: \(url)")  // Output the full URL for testing

    // Making the GET request
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            print("Error: \(error.localizedDescription)")
            return
        }
        
        if let data = data {
            do {
                // Parse the JSON response
                let weather = try JSONDecoder().decode(WeatherResponse.self, from: data)
                print("Weather in \(weather.name): \(weather.main.temp)°C")
            } catch {
                print("Error decoding data: \(error.localizedDescription)")
            }
        }
    }
    task.resume()
}

// Define the Codable structs for decoding the JSON response
struct WeatherResponse: Codable {
    let name: String
    let main: Main
}

struct Main: Codable {
    let temp: Double
}

*/

// Base URL for GitHub API
let baseURL = "https://api.github.com/users/octocat/repos"

// Making the GET request using URLSession
if let url = URL(string: baseURL) {
    print("Requesting URL: \(url)")

    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            print("Error: \(error.localizedDescription)")
            return
        }
        
        if let data = data {
            do {
                // Decode the JSON into an array of repositories
                let repos = try JSONDecoder().decode([Repository].self, from: data)
                for repo in repos {
                    print("Repository: \(repo.name), Stars: \(repo.stargazers_count)")
                }
            } catch {
                print("Error decoding data: \(error.localizedDescription)")
            }
        }
    }
    task.resume()
}

// Define the structure for the repository data
struct Repository: Codable {
    let name: String
    let stargazers_count: Int
}
