import Foundation
import Alamofire

class Endpoint<Response: Decodable> {
    let method: HTTPMethod
    let relativeUrl: String
    let responseType: Response.Type
    let parameters: [String : Any]?
    
    init(_ method: HTTPMethod, _ relativeUrl: String, _ responseType: Response.Type, parameters: [String : Any]? = nil) {
        self.method = method
        self.relativeUrl = relativeUrl
        self.responseType = responseType
        self.parameters = parameters
    }
}
