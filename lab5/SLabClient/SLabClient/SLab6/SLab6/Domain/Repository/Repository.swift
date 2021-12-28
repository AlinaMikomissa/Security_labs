import Foundation
import Alamofire
import Combine

class Repository : IRepository {

    var rest: RESTClient
    
    init() {
        rest = RESTClient()
    }
    
    func signIn(signInRequest: SignInRequest) -> AnyPublisher<UserResponse, AFError> {
        
        let json = try? JSONEncoder().encode(signInRequest)
        let jsonObject = try? JSONSerialization.jsonObject(with: json!, options: []) as? [String : Any]
        
        return rest.execute(endpoint: Endpoint(.post, "\(Constant.BaseUrl)/api/Identity/SignIn", UserResponse.self, parameters: jsonObject))
    }
    
    func signUp(signUpRequest: SignUpRequest) -> AnyPublisher<UserResponse, AFError> {
        let json = try? JSONEncoder().encode(signUpRequest)
        let jsonObject = try? JSONSerialization.jsonObject(with: json!, options: []) as? [String : Any]
        
        return rest.execute(endpoint: Endpoint(.post, "\(Constant.BaseUrl)/api/Identity/SignUp", UserResponse.self, parameters: jsonObject))
    }
}
