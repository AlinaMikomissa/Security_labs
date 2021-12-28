import SwiftUI

struct SignInView : View {
    @ObservedObject var viewModel: IdentityViewModel = IdentityViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("FirstName", text: $viewModel.firstName)
                    .padding()
                
                TextField("LastName", text: $viewModel.lastName)
                    .padding()
                
                TextField("Login", text: $viewModel.login)
                    .padding()
                
                TextField("Password", text: $viewModel.password)
                    .padding()
                
                Button {
                    viewModel.signIn()
                } label: {
                    Text("SignIn")
                        .padding()
                        .foregroundColor(Color.white)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                Button {
                    viewModel.signUp()
                } label: {
                    Text("SignUp")
                        .padding()
                        .foregroundColor(Color.white)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                Button {
                    viewModel.user = nil
                } label: {
                    Text("SignOut")
                        .padding()
                        .foregroundColor(Color.white)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                Text("First name \(viewModel.user?.firstName ?? "No data")").padding()
                Text("Last name \(viewModel.user?.lastName ?? "No data")").padding()
                Text("Login \(viewModel.user?.login ?? "No data")").padding()
            }.padding(.horizontal, 20)
        }
    }
}
