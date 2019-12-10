//
//  ResponseSerializer.swift
//  movies-app
//
//  Created by David Petrosyan on 12/9/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import Foundation
import Alamofire

extension DataRequest {
    
    @discardableResult
    func responseObject<T: Codable>(
        queue: DispatchQueue? = nil,
        completionHandler: @escaping (DataResponse<T>) -> Void
    ) -> Self {
        return response(
            queue: queue,
            responseSerializer: DataRequest.jsonResponseSerializer(),
            completionHandler: completionHandler)
    }
    
    @discardableResult
    func responseCollection<T: Codable>(
        queue: DispatchQueue? = nil,
        completionHandler: @escaping (DataResponse<[T]>) -> Void
        ) -> Self {
        return response(
            queue: queue,
            responseSerializer: DataRequest.jsonArrayResponseSerializer(),
            completionHandler: completionHandler
        )
    }
    
    static func jsonResponseSerializer<T: Codable>() -> DataResponseSerializer<T> {
        return DataResponseSerializer { request, response, data, error in
            guard error == nil else { return .failure(NetworkingError.networkError) }
            let result = Request.serializeResponseData(response: response, data: data, error: nil)
            guard case let .success(validData) = result else {
                return .failure(NetworkingError.jsonCouldNotBeSerialized)
            }
            do {
                let json = try JSONDecoder().decode(T.self, from: validData)
                return .success(json)
            } catch {
                return .failure(NetworkingError.jsonCouldNotBeSerialized)
            }
        }
    }
    
    static func jsonArrayResponseSerializer<T: Codable>() -> DataResponseSerializer<[T]> {
        return DataResponseSerializer { _, response, data, error in
            guard error == nil else { return .failure(NetworkingError.networkError) }
            let result = Request.serializeResponseData(response: response, data: data, error: nil)
            guard case let .success(validData) = result else {
                return .failure(NetworkingError.jsonCouldNotBeSerialized)
            }
            do {
                let json = try JSONDecoder().decode([T].self, from: validData)
                return .success(json)
            } catch {
                return .failure(NetworkingError.jsonCouldNotBeSerialized)
            }
        }
    }
}
