//
//  PostService.swift
//  App
//
//  Created by Maxime Mongeau on 2019-01-19.
//

import Foundation
import Vapor

public struct Post {
    let title: String
    let content: String
}

public struct PostService: Service {
    private let posts: [Post] = [
        Post(title: "Test 1", content: "This is a content"),
        Post(title: "Title 2", content: "Nothing interesting here")
    ]

    public func getPosts() -> [Post] {
        return posts
    }
}
