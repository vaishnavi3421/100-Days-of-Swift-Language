//1. Fetching a List of Posts from JSONPlaceholder
//https://jsonplaceholder.typicode.com/posts

import Foundation
struct Post: Codable {
    let id: Int
    let title:String
    let body:String
}
let url = URL(string:"https://jsonplaceholder.typicode.com/posts")!
let task = URLSession.shared.dataTask(with: url) { data, response, error in
    if let error = error {
        print("Error")
    }
    guard let data = data else {
        print("NO Data")
        return
    }
    do {
        let posts = try JSONDecoder().decode([Post].self , from: data)
        for post in posts {
            print(" title :- \(post.title)")
        }
    }catch {
        print("Error")
    }

    }
task.resume()

//2. Fetching a Single User by ID
print("*******************************************************")
//https://jsonplaceholder.typicode.com/users/1

struct User: Codable {
    let id: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
}

struct Address: Codable {
    let street, suite, city, zipcode: String
}
let url1 = URL(string: "https://jsonplaceholder.typicode.com/users/1")!
let task1 = URLSession.shared.dataTask(with: url) { data, response, error in
    if let error = error {
        print("Error")
    }
    guard let data = data else {
        print("No data found")
        return
    }
    do {
        let user = try JSONDecoder().decode(User.self, from:data)
        print("user name\(user.name) Address: \(user.address)")
        
    } catch {
        print("Error decoding Data")
    }
}
task1.resume()

// 3 Fetching All Albums from JSONPlaceholder
// https://jsonplaceholder.typicode.com/albums
struct Album: Codable {
    let id: Int
    let title: String
}
let url2 = URL(string: "https://jsonplaceholder.typicode.com/albums")!
let task2 = URLSession.shared.dataTask(with: url2) { Data, Response, Error in
    if let Error = Error {
        print("error")
        return
    }
    guard let Data = Data else {
        print("no data found")
        return
    }

    do {
        let albums = try JSONDecoder().decode([Album].self , from:Data)
        for album in albums {
            print("id :\(album.id) title :\(album.title) ")
        }
    } catch {
        print("Error Decoding Data")
    }
}
task2.resume()

// Fetching Comments for a Post(name ,Email, Body)
//https://jsonplaceholder.typicode.com/posts/1/comments

struct Comments: Codable {
    let postID, id: Int
    let name, email, body: String

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case id, name, email, body
    }
}
let url3 = URL(string: "https://jsonplaceholder.typicode.com/posts/1/comments")!
let task3 = URLSession.shared.dataTask(with: url) { data, response, error in
    if let error = error {
        print("Erroe")
    }
    guard let data = data else {
        return
    }
    do {
        let comments = try JSONDecoder().decode([Comments].self, from: data)
        for comment in comments {
            print("Comment by \(comment.name) \(comment.email) \(comment.body)")
        }
        
    }catch {
        print("Error in data")
    }
}


// Fetching Random User from RandomUser.me (user, first name, last name)
// "https://randomuser.me/api/"
struct RandomUser: Codable {
    let results: [Result]
}
struct Result: Codable {
    let name: Name
}
struct Name: Codable {
    let title, first, last: String
}
let url4 = URL(string: "https://randomuser.me/api/")!
let task4 = URLSession.shared.dataTask(with: url4) { data, response, error in
    if let error = error {
        return
    }
    guard let data = data else {
        return
    }
    do {
        let randomuser = try JSONDecoder().decode(RandomUser.self, from: data)
        print("name :- \(randomuser.results[0].name.first) \(randomuser.results[0].name.last)")
    }catch {
        print("Error")
    }
}
task4.resume()

    
