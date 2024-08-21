//
//  NetworkService.swift
//  doctorsTest
//
//  Created by Сергей on 16.08.2024.
//

import Foundation
import Alamofire

final class NetworkService {
    static let shared = NetworkService()
    private init() {}
    
    func fetchData(completion: @escaping (Result<Response, Error>) -> Void) {
        let url = "https://raw.githubusercontent.com/salfa-ru/test_iOS_akatosphere/main/test.json"
        
        AF.request(url).responseDecodable(of: Response.self) { response in
            switch response.result {
            case .success(let model):
                completion(.success(model))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
