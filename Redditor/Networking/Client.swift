//
//  Client.swift
//  Redditor
//
//  Created by Matt Dias on 11/10/20.
//

import Foundation

private enum API {
    case subreddit(_ value: String)

    func toURL() -> URL {
        switch self {
        case .subreddit(let value):
            return URL(string: "https://reddit.com/r/\(value).json")!
        }
    }
}

struct Client {

    func fetch(subreddit: String, completion: @escaping (Result<Response, Error>) -> Void) {
        URLSession.shared.dataTask(with: API.subreddit(subreddit).toURL()) { (data, _, error) in
            guard error == nil, data != nil else {
                completion(.failure(error!))
                return
            }

            do {
                let response = try JSONDecoder().decode(Response.self, from: data!)

                completion(.success(response))
            } catch {
                completion(.failure(error))
            }
        }
    }
}
