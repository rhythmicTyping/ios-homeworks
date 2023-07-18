//
//  Post.swift
//  Navigation
//
//  Created by Evgeny Savin on 12.03.2023.
//

import Foundation

struct Post {
    let author: String
    let description: String
    let image: String
    let likes: Int
    let views: Int
}


extension Post {
    static func fillTableWithData() -> [Post] {
        [
            Post(author: "author 1", description: "1", image: "postImage", likes: 1, views: 1),
            Post(author: "Author 2", description: "2", image: "postImage", likes: 2, views: 2),
            Post(author: "Author 3", description: "3", image: "postImage", likes: 3, views: 3),
            Post(author: "Author 4", description: "4", image: "postImage", likes: 4, views: 4)
        ]
    }
}
