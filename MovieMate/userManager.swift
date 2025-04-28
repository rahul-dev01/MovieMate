import Foundation

class UserManager {
    static let shared = UserManager()
    private init() {}

    var users: [AppUser] = [
        AppUser(firstName: "Rahul", lastName: "Raj", Moblenumber: "9876543210", email: "rahul@example.com", password: "1234"),
        AppUser(firstName: "Ankit", lastName: "Singh", Moblenumber: "9123456780", email: "ankit@example.com", password: "pass"),
        AppUser(firstName: "Priya", lastName: "Kumar", Moblenumber: "9988776655", email: "priya@example.com", password: "test"),
        AppUser(firstName: "Ravi", lastName: "Yadav", Moblenumber: "9090909090", email: "ravi@example.com", password: "abcd"),
        AppUser(firstName: "Neha", lastName: "Sharma", Moblenumber: "9012345678", email: "neha@example.com", password: "9876"),
        AppUser(firstName: "tt", lastName: "tt", Moblenumber: "tt", email: "tt", password: "tt")
    ]

    func addUser(_ user: AppUser) {
        users.append(user)
    }

    func validate(email: String, password: String) -> AppUser? {
        return users.first { $0.email == email && $0.password == password }
    }
}
