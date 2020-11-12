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

    func fetch(subreddit: String, completion: @escaping (Result<[Post], Error>) -> Void) {
        URLSession.shared.dataTask(with: API.subreddit(subreddit).toURL()) { (data, res, error) in
            guard error == nil, data != nil else {
                completion(.failure(error!))
                return
            }

            do {
                let response = try JSONDecoder().decode(Response.self, from: data!)

                completion(.success(posts(from: response)))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }

    func posts(from response: Response) -> [Post] {
        return response.data.children.map { $0.data }
    }
}
