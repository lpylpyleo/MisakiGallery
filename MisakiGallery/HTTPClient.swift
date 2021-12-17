//
//  HTTPClient.swift
//  MisakiGallery
//
//  Created by Spike Liao on 2021/12/17.
//

import Foundation

class HTTPClient {
    let baseUrl = apiBaseUrl
    
    static let shared: HTTPClient = {
        let inst = HTTPClient()
        return inst
    }()
    
    
    static func request<T: Decodable>(
        _ path: String,
        method: Method = Method.GET,
        onSuccess: @escaping (_ resp: T) -> Void,
        onError: @escaping (_ err: Error) -> Void
    )  {
        let url = URL(string: apiBaseUrl+path)!
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        let task = URLSession.shared.dataTask(with: request) { (data, res, err) in
            if let err = err {
                print(err)
                return
            }
            
            guard let res = res as? HTTPURLResponse? else { return }
            
            // TODO: statusCode 30X
            if res?.statusCode == 200 {
                DispatchQueue.main.async {
                    do {
                        let decoded = try JSONDecoder().decode(T.self, from: data!)
                        onSuccess(decoded)
                    }catch let err{
                        print(err)
                        onError(err)
                    }
                }
            }
        }
        
        task.resume()
    }
}

enum Method: String {
    case GET = "GET"
    case POST = "POST"
}
