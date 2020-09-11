//
//  RepoManager.swift
//  GitTest
//
//  Created by Alexey Antonov on 11/09/2020.
//  Copyright © 2020 Alex Antonov. All rights reserved.
//

import Foundation

class RepoManager {
    private let urlBase = "https://api.github.com/search/repositories?q=ios&sort=stars"
    
    private(set) var items = [RepoModel]()
    
    func performRequest(complition: @escaping()->()){
        if let url = URL(string: "\(urlBase)"){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    print (error!)
                    return
                }
                if let safeData = data {
                    if let repos = self.parseJSON(safeData){
                        self.items = repos
                        complition()
                    }
                }
            }
            task.resume()
        }
    }
    
    private func parseJSON(_ reposData: Data) -> [RepoModel]? {
        let decoder = JSONDecoder()
        do {
            let decodedData: RepoData = try decoder.decode(RepoData.self, from: reposData)
            var repos: [RepoModel] = []
            for repo in decodedData.items {
                let avatarURL = repo.owner.avatar_url
                let name = repo.name
                let stars = repo.stargazers_count
                let repo = RepoModel(name: name, starCount: stars, avatarURL: avatarURL ?? "")
                repos.append(repo)
            }
            return repos
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
