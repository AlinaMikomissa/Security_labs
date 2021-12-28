import Foundation
import Alamofire
import Combine

protocol IRepository {
    func signIn(signInRequest: SignInRequest) -> AnyPublisher<UserResponse, AFError>
    func signUp(signUpRequest: SignUpRequest) -> AnyPublisher<UserResponse, AFError>
}
