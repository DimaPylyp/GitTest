//
//  RepoModel.swift
//  GitTest
//
//  Created by Alexey Antonov on 11/09/2020.
//  Copyright © 2020 Alex Antonov. All rights reserved.
//

import Foundation

struct RepoData: Decodable {
    let items: [Item]
}

struct Item: Decodable {
    let name: String
    let stargazers_count: Int
    let owner: Owner
}

struct Owner: Decodable {
    let avatar_url: String?
}
