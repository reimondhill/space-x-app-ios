//
//  MockNetworkManager.swift
//  InfoTests
//
//  Created by Ramon Haro Marques
//

import Foundation
@testable import Data

public class MockNetworkManager {
    //MARK: - Class model
    typealias T = (Codable, Decodable)
    enum MockNetworkManagerError: Error {
        case invalid
    }

    
    //MARK: - Properties
    public var injectedCodable: Codable?
    public var injectedData: Data?
    
    public var spyURL: URL?
    public var spyHTTPMethodType: HTTPMethodType?
    public var spyHeaders: [String:String]?
    public var spyParams: [String:Any]?
}

extension MockNetworkManager: NetworkFetcher {
    public func fetchCodable<T:Codable>(url: URL, httpMethodType: HTTPMethodType, headers: [String:String], params: [String:Any], completion: @escaping (Result<T,Error>) -> Void) {
        spyURL = url
        spyHTTPMethodType = httpMethodType
        spyHeaders = headers
        spyParams = params
        
        if let injectedCodable = injectedCodable as? T{
            completion(.success(injectedCodable))
        } else {
            completion(.failure(MockNetworkManagerError.invalid))
        }
    }
    
    public func fetchData(url: URL, httpMethodType: HTTPMethodType, headers: [String : String], params: [String : Any], completion: @escaping (Result<Data, Error>) -> Void) {
        if let injectedData = injectedData {
            completion(.success(injectedData))
        } else {
            completion(.failure(MockNetworkManagerError.invalid))
        }
    }
}
