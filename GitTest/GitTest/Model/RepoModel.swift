//
//  RepoData.swift
//  GitTest
//
//  Created by Alexey Antonov on 11/09/2020.
//  Copyright © 2020 Alex Antonov. All rights reserved.
//

import Foundation

struct RepoModel: Decodable {
    let name: String
    let starCount: Int
    let avatarURL: String
}


