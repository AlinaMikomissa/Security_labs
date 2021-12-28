import Foundation
import Alamofire
import Combine

class IdentityViewModel : ObservableObject {
    @Published var user: UserResponse?
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var login = ""
    @Published var password = ""
    
    var repository: Repository = Repository()
    private var cancellables: Set<AnyCancellable> = Set<AnyCancellable>()
    
    func signIn() {
        repository.signIn(signInRequest: SignInRequest(login: login, password: password)).sink(receiveCompletion: { completion in
            switch completion {
                case .finished:
                    print("Finished")
                case .failure(let error):
                    print(error.errorDescription)
            }
        }, receiveValue: { [self] userResponse in
            user = userResponse
        }).store(in: &cancellables)
    }
    
    func signUp() {
        repository.signUp(signUpRequest: SignUpRequest(firstName: firstName, lastName: lastName, login: login, password: password)).sink(receiveCompletion: { completion in
            switch completion {
                case .finished:
                    print("Finished")
                case .failure(let error):
                    print(error.errorDescription)
            }
        }, receiveValue: { [self] userResponse in
            user = userResponse
        }).store(in: &cancellables)
    }
}
