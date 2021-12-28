import Foundation

struct SignUpRequest: Codable {
    public var firstName: String
    public var lastName: String
    public var login: String
    public var password: String
}
