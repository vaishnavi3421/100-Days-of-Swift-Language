import Foundation

let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
var request = URLRequest(url: url)
request.httpMethod = "POST"
request.setValue("application/json", forHTTPHeaderField: "Content-Type")

let post = ["title": "foo", "body": "bar", "userId": 1]
let postData = try! JSONSerialization.data(withJSONObject: post, options: [])

request.httpBody = postData

let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
    if let error = error {
        print("Error: \(error.localizedDescription)")
        return
    }
    guard let data = data else { return }
    let responseString = String(data: data, encoding: .utf8) ?? "No response"
    print(responseString)
}

task.resume()

