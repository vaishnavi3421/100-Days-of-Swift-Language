//https://jsonplaceholder.typicode.com/posts
import Foundation
let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
let task = URLSession.shared.dataTask(with: url) { data, response, error in
    if let error = error {
        print("Error ")
        return
    }
    guard let response = response as? HTTPURLResponse else {
        return
    }
    switch response.statusCode {
    case 200:
        print("request Successful")
        if let data = data {
            let posts = try? JSONDecoder().decode([Post].self, from: data)
            print(posts ?? [])
        }
    case 400:
        print("NOt Found")
    case 530:
        print("Internal Server Error")
    default:
        print("Unhandled HTTP status: \(response.statusCode)")
    }
}
task.resume()
struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
