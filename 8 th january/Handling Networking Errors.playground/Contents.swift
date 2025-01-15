import Foundation
let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
let task = URLSession.shared.dataTask(with: url) { data, response, error in
    if let error = error {
        if let urlError = error as? URLError {
            switch urlError.code{
            case.timedOut:
                print("required time is out")
            case.notConnectedToInternet:
                print("No internet Connection")
            default:
                print("URL Error\(urlError)")
            }
            
            
        }else {
            print("other error")
        }
        return
    }
    if let data = data {
        let responseString = String(data: data, encoding: .utf8) ?? "No response"
            print(responseString)
    }
}
task.resume()
