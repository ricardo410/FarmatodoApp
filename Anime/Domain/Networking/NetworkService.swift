//
//  NetworkService.swift
//  Anime
//
//  Created by William Ardila on 1/03/22.
//

import Foundation
import Combine
import Alamofire

class NetworkService {
    
    private var urlSession: URLSession
    private var baseURL: URL?
    
    public init(urlSession: URLSession, url: String) {
        self.urlSession = urlSession
        self.baseURL = URL(string: url)
    }
    
    private func getBaseUrl(path: String, parameters: [String: Any] = [:]) -> URL? {
        var url = URL(string: "" )
        guard let baseURL = baseURL?.appendingPathComponent(path) else {
            return nil
        }
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)!
        
        if !parameters.isEmpty {
            urlComponents.queryItems = parameters.map {
                URLQueryItem(name: $0, value: String(describing: $1))
            }
        }
        
        if baseURL.absoluteString == "https://api.jikan.moe/v3/anime/" {
            let newUrl = urlComponents.url?.absoluteString.replacingOccurrences(of: "?=",
                                                                                with: CoreConstants.Values.empty) ?? CoreConstants.Values.empty
            url = URL(string: newUrl)
        } else {
            url =  URL(string: urlComponents.url?.absoluteString.removingPercentEncoding ?? CoreConstants.Values.empty)
        }
        
        return url
    }
    
    private func getHeaders<Response>(_ request: APIRequest<Response>) -> Alamofire.HTTPHeaders {
        var headers = Alamofire.HTTPHeaders.default
        
        headers["Content-type"] = request.contentType.rawValue
        
        return headers
    }
    
    private func getURLRequest<Response>(_ endpoint: APIRequest<Response>) -> URLRequest? {
        var url: URL?
        var httpBody: Data?
        
        if let parameters = endpoint.parameters {
            if endpoint.method != .get {
                let body =  try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
                httpBody = body
                url = getBaseUrl(path: endpoint.relativePath)
            } else {
                url = getBaseUrl(path: endpoint.relativePath, parameters: parameters)
            }
        } else {
            url = getBaseUrl(path: endpoint.relativePath)
        }
        
        guard let requestUrl: URL = url else { return nil }
        
        let headers = getHeaders(endpoint)
        
        var request = URLRequest(url: requestUrl)
        request.httpBody =  httpBody
        request.allHTTPHeaderFields = headers.dictionary
        request.httpMethod = endpoint.method.rawValue
        
        return request
    }
}

extension NetworkService: NetworkServiceType {
    
    func request<Response>(_ endpoint: APIRequest<Response>,
                           queue: DispatchQueue,
                           retries: Int) -> AnyPublisher<Response, Error> where Response : Decodable {
        
        guard let request  = getURLRequest(endpoint) else {
            return Fail<Response, Error>(error: CustomErrors.APIRequest.malFormedURL)
                .eraseToAnyPublisher()
        }
        
        let decoder = JSONDecoder()
        
        let result =  urlSession.dataTaskPublisher(for: request)
            .tryMap { data, response -> Data in
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw CustomErrors.APIRequest.serverError
                }
                
                if !(200 ..< 300 ~= httpResponse.statusCode) {
                    let statusCode = DataConstants.StatusCodes(from: httpResponse.statusCode)
                    let error = CustomErrors.APIRequest(statusCode: statusCode)
                    
                    debugPrint("Error Endpoint: \(request.url?.absoluteString ?? "")")
                    
                    if var resString = String(data: data, encoding: .utf8) {
                        resString.removeAll(where: {$0 == "\\"})
                        debugPrint(" ** Error response data: ** \(resString))")
                    }
                    
                    throw error ?? .serverError
                }
                
                
                return data
                
            }
        
        if Response.self == Data.self {
            return result
                .tryMap { $0 as! Response }
                .receive(on: queue)
                .retry(retries)
                .mapError { $0 }
                .eraseToAnyPublisher()
        } else {
            return result
                .decode(type: Response.self, decoder: decoder)
                .receive(on: queue)
                .retry(retries)
                .mapError { $0 }
                .eraseToAnyPublisher()
        }
    }
    
    func setBaseUrl(_ baseUrl: String) {
        self.baseURL = URL(string: baseUrl)
    }
}
