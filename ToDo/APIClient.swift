//
//  APIClient.swift
//  ToDo
//
//  Created by roger on 2017/7/10.
//  Copyright © 2017年 roger. All rights reserved.
//

import Foundation

enum WebserviceError : Error {
    case DataEmptyError
    case ResponseError
}

protocol SessionProtocol {
    func dataTask(
        with url: URL,
        completionHandler: @escaping
        (Data?, URLResponse?, Error?) -> Void)
        -> URLSessionDataTask
}

class APIClient {
    lazy var session: SessionProtocol = URLSession.shared
    
    func loginUser(withName username: String, password: String, completion: @escaping (Token?, Error?) -> Void) {
        let allowedCharacters = CharacterSet(
            charactersIn: "/%&=?$#+-~@<>|\\*,.()[]{}^!").inverted
        guard let encodedUsername = username.addingPercentEncoding(
            withAllowedCharacters: allowedCharacters) else { fatalError() }
        guard let encodedPassword = password.addingPercentEncoding(
            withAllowedCharacters: allowedCharacters) else { fatalError() }
        let query = "username=\(encodedUsername)&password=\(encodedPassword)"
        guard let url = URL(string:
            "https://awesometodos.com/login?\(query)") else {
                fatalError()
        }
        session.dataTask(with: url) { (data, response, error) in
            
            guard error == nil else { completion(nil, error); return }
            
            guard let data = data else {
                completion(nil, WebserviceError.DataEmptyError)
                return
            }
            do {
                let dict = try JSONSerialization.jsonObject(
                    with: data,
                    options: []) as? [String:String]
                let token: Token?
                if let tokenString = dict?["token"] {
                    token = Token(id: tokenString)
                } else {
                    token = nil
                }
                completion(token, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
    
}

extension URLSession: SessionProtocol {}
