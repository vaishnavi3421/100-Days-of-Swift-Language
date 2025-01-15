
//"https://jsonplaceholder.typicode.com/posts"
import Foundation

let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
var request = URLRequest(url: url)
request.httpMethod = "GET"

let task = URLSession.shared.dataTask(with: url) { Data, Response, error in
    if let error = error {
        print("Error: \(error.localizedDescription)")
        return
    }
    guard let Data = Data else {
        return
    }

    do {
        let posts = try JSONDecoder().decode([Post].self, from: Data)
        print(posts)
    } catch {
        print("Error decoding: \(error.localizedDescription)")
    }
}
task.resume()

struct Post:Codable {
    let userId : Int
    let id : Int
    let title : String
    let body : String
}
