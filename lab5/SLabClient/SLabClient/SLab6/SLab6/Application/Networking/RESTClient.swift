import Foundation
import Alamofire
import Combine

class RESTClient {
    func execute <Response: Decodable> (endpoint: Endpoint<Response>, headers: HTTPHeaders? = nil) -> AnyPublisher<Response, AFError> {
        var encoding: ParameterEncoding = JSONEncoding.default
        if endpoint.method == .get {
            encoding = URLEncoding.default
        }
        let request = AF.request(endpoint.relativeUrl, method: endpoint.method, parameters: endpoint.parameters, encoding: encoding, headers: headers)

        return request.validate()
            .publishDecodable(type: Response.self, emptyResponseCodes: [200])
            .value()
            .eraseToAnyPublisher()
    }
}
