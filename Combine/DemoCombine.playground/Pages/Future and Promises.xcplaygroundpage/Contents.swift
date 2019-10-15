//: [Previous](@previous)

import Foundation
import Combine
/*:
[Previous](@previous)
## Future and Promises
A `Publishers.Future` creates a new `Publisher` that eventually produces one value and then finishes, or fails.
- Allows you to call custom methods and return a Result.success or Result.failure
*/

struct User {
    let id: Int
    let name: String
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

enum FetchError: Error {
    case userNotFound
}

let users = [User.init(id: 0, name: "dcj"), User.init(id: 2, name: "lpj")]

func fetchUser(for userId: Int, completion: ((_ res:Result<User,FetchError>) -> Void))
{
    if let user = users.first(where: { $0.id == userId })  {
        completion(Result.success(user))
    }else {
        completion(Result.failure(FetchError.userNotFound))
    }
}
let subject = PassthroughSubject<Int, FetchError>()

let publisher = subject.flatMap
{ (userId) -> Future<User, FetchError> in
    return Future
    { (promise) in
        fetchUser(for: userId)
        { (res) in
            switch res
            {
                case .success(let user):
                    promise(.success(user))
                case .failure(let err):
                    promise(.failure(err))
            }
        }
    }
}
.map { user in user.name }
.catch { (err) -> Just<String> in
    print("Error occurred: \(err)")
    return Just("Not found")
}
.sink { (name) in
    print("user name is: \(name)")

}

subject.send(0)
subject.send(3)

//: [Next](@next)
