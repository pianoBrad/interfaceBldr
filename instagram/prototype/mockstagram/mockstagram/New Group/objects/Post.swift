//
//  Post.swift
//  mockstagram
//
//  Created by Brad Phillips on 11/3/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

struct Post: Codable
{
    /** Properties **/
    var author : String
    var avatarUrl : String
    var dateCreated : String
    var description : String
    var mediaUrl : String
    var type : String
    var commentCount : Int
    var likesCount : Int
}
