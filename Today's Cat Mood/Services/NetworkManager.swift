//
//  Services.swift
//  Today's Cat Mood
//
//  Created by Дарья Кобелева on 20.03.2024.
//

import Foundation

enum Link {
    case image
    
    var url: URL {
        switch self{
        case .image:
            return URL(string: "https://cataas.com/cat")!
        }
    }
}

enum NetworkError: Error {
    case noData
    case decodingError
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    // MARK: - Public Methods
    func fetchImage(from url: URL, completion: @escaping(Result<Data, NetworkError>) -> Void) {
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else {
                completion(.failure(.noData))
                return
            }
            DispatchQueue.main.async {
                completion(.success(imageData))
            }
        }
    }
    
    
    
}
