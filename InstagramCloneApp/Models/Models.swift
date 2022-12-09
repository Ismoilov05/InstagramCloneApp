//
//  Models.swift
//  InstagramCloneApp
//
//  Created by MuhammadQodir on 3.12.2022.
//

import Foundation
public enum Gender {
    case male, female, others
}
struct User {
    let userName: String
    let bio: String
    let name: (first: String, last: String)
    let birthDay: Date
    let gender: Gender
    let counts: UserCount
    let joinDate: Date
}

struct UserCount {
    let following: Int
    let followers: Int
    let posts: Int
}
public enum userPostType {
    case photo, video
}
///
public struct UserPost {
    let identifier: String
    let postType: userPostType
    let thumbNailImage: URL
    let postUrl: URL // either video url or full resolution photo
    let caption: String?
    let likeCount: [PostLike]
    let createdate: Date
    let comments: [PostComment]
    let taggedUser: [String]
}

struct PostLike {
    let username: String
    let postIdentifier: String
}
struct CommentLike {
    let username: String
    let commentIdentifier: String
}
struct PostComment {
    let identifier: String
    let username: String
    let text: String
    let createDate: Date
    let likes: [CommentLike]
}
