//
//  Tweet.swift
//  appTwitter
//
//  Created by Alejandro Villagrán Poblete on 21-07-23.
//

import Foundation

struct Tweet: Identifiable{
  let id = UUID()
  let authorName: String
  let authorUserName: String
  let timestampText: String
  let text: String
  let numberOfReplies: Int
  let numberOfRetweets: Int
  let numberOfLikes: Int
}
