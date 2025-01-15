import Foundation

// Model for User and Post
struct User: Decodable {
    let id: Int
    let name: String
}

struct Post: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

// Function to fetch user details asynchronously
func fetchUserDetails() async throws -> User {
    let url = URL(string: "https://jsonplaceholder.typicode.com/users/1")!
    let (data, _) = try await URLSession.shared.data(from: url)
    let user = try JSONDecoder().decode(User.self, from: data)
    return user
}

// Function to fetch posts asynchronously
func fetchUserPosts() async throws -> [Post] {
    let url = URL(string: "https://jsonplaceholder.typicode.com/posts?userId=1")!
    let (data, _) = try await URLSession.shared.data(from: url)
    let posts = try JSONDecoder().decode([Post].self, from: data)
    return posts
}

// Main async function to fetch both user and posts concurrently
func fetchUserAndPosts() async {
    do {
        // Run both network requests concurrently
        async let user = fetchUserDetails()  // Concurrent Task 1
        async let posts = fetchUserPosts()  // Concurrent Task 2
        
        // Wait for both tasks to finish and get their results
        let userDetails = try await user
        let userPosts = try await posts
        
        // Handle the results
        print("User Details: \(userDetails.name), ID: \(userDetails.id)")
        print("Posts:")
        userPosts.forEach { post in
            print("Post ID: \(post.id), Title: \(post.title)")
        }
        
    } catch {
        print("Error occurred: \(error)")
    }
}

// Create an asynchronous task at the root level (outside async function)
Task {
    await fetchUserAndPosts()
}
