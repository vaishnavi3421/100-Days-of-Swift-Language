//"https://jsonplaceholder.typicode.com/posts"
import Foundation

func fecthPost(completion:@escaping([Post]?) -> Void) {
    let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            print(error)
            completion(nil)
            return
        }
        guard let data = data else {
            return
        }
        do {
            var posts = try JSONDecoder().decode([Post].self, from: data)
            completion(posts)
        } catch {
            print("Error decoding: \(error.localizedDescription)")
            completion(nil)
        }
        
    }
    task.resume()
}

fecthPost { posts in
    if let posts = posts {
        print(posts)
    }

    
}
struct Post: Codable {
    let id: Int
    //let title: String
    //let body: String
}
