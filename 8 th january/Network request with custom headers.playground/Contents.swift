import Foundation

let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
var request = URLRequest(url: url)
request.httpMethod = "GET"
request.setValue("application/json", forHTTPHeaderField: "Accept")
request.setValue("Bearer token_value", forHTTPHeaderField: "Authorization")

let task = URLSession.shared.dataTask(with: request) { data, response, error in
    if let error = error {
        print("Error: \(error)")
        return
    }

    if let data = data {
        let jsonResponse = try? JSONSerialization.jsonObject(with: data, options: [])
        print("Response: \(jsonResponse ?? "No data")")
    }
}

task.resume()

