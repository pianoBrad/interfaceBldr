//
//  Post.swift
//  mockstagram
//
//  Created by Brad Phillips on 11/3/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import UIKit

struct Post: Decodable
{
    /** Properties **/
    var data_created : String
    var description : String
    var media_url : String
    var type : String
    var user_id : String
}
