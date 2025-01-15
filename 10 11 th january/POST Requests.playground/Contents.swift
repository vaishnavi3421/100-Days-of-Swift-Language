//These examples cover a range of scenarios such as submitting forms, uploading files, interacting with APIs, and more.
//demonstrates how to send data to an API using the POST method. Typically, POST requests are used to create, update, or submit data to a server.


// 1  Creating a Post on JSONPlaceholder
import Foundation

let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
var request = URLRequest(url: url)
request.httpMethod = "POST"
request.setValue("application/json", forHTTPHeaderField: "Content-Type")
let body:[String:Any] = [
    "title": "New Post",
        "body": "This is a new post created via POST request",
        "userId": 1
]
do {
    request.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
}catch {
    print("Error")
}
let task = URLSession.shared.dataTask(with: request) { data, response, error in
    if let error = error {
        print("error")
        return
    }
    if let data = data {
        do {
            let post = try JSONDecoder().decode(Post.self, from: data)
            print("ID\(post.id)")
        } catch {
            print("Error")
        }
        
    }

}
task.resume()
struct Post: Codable {
    let id: Int
    let title: String
    let body: String
    let userId: Int
}

// 2. Submitting a New Comment on JSONPlaceholder

let url1 = URL(string: "https://jsonplaceholder.typicode.com/comments")!
var request1 = URLRequest(url: url1)
request1.httpMethod = "POST"
request1.setValue("application/json", forHTTPHeaderField: "Content-Type")

let body1: [String: Any] = [
    "postId": 1,
    "name": "Commenter",
    "email": "commenter@example.com",
    "body": "This is a comment on the post."
]
do
{
    request1.httpBody = try JSONSerialization.data(withJSONObject: body1, options: [])
}catch {
    print("Error")
}
let task1 = URLSession.shared.dataTask(with: request1) { data, response, error in
    if let error = error {
        print("Error")
        return
    }
    if let data = data {
        do {
            let comment  = try JSONDecoder().decode(Comment.self, from: data)
            print("Comment ID: \(comment.id), Comment Body: \(comment.body)")
        }catch {
            print("Error")
        }
    }
    
}
task1.resume()
struct Comment: Codable {
    let id: Int
    let postId: Int
    let name: String
    let email: String
    let body: String
}
