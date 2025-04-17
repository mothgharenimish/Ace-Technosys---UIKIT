//
//  APIServices.swift
//  Ace-Technosys - UIKIT
//
//  Created by Nimish Mothghare on 16/04/25.
//

import Foundation
import Alamofire



class APIService {
    
    static let shared = APIService()
    
    private init() {}
    
    func loginUser(email: String, password: String, completion: @escaping (Result<String, Error>) -> Void) {
        
        let url = "https://reqres.in/api/login"
        
        let parameters: [String: String] = [
            "email": email,
            "password": password
        ]
        
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseDecodable(of: LoginResponse.self) { response in
                switch response.result {
                case .success(let loginResponse):
                    completion(.success(loginResponse.token))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    
    func fetchProducts(completion: @escaping (Result<[Products], Error>) -> Void) {
            let url = "https://fakestoreapi.com/products"
            
            AF.request(url, method: .get).responseDecodable(of: [Products].self) { response in
                switch response.result {
                case .success(let products):
                    completion(.success(products))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
}
