//
//  Comment.swift
//  mockstagram
//
//  Created by Brad Phillips on 11/8/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import Foundation

struct Comment : Codable
{
    /** Properties **/
    var author : String
    var avatarUrl : String
    var comment : String
    var created : String
    var postId : String
}
