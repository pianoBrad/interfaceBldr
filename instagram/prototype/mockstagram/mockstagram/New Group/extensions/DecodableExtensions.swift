//
//  DecodableExtensions.swift
//  mockstagram
//
//  Created by Brad Phillips on 11/4/18.
//  Copyright © 2018 megaBreezy. All rights reserved.
//

import Foundation
import Firebase

extension Decodable {
    /// Initialize from JSON Dictionary. Return nil on failure
    init?(dictionary value: [String:Any])
    {
        var array = value
        // Change Firebase timestamp data to parsable json data
        for (key, data) in array
        {
            if let time = data as? Timestamp
            {
                array[key] = String("\(time.dateValue())")
            }
        }
        
        guard JSONSerialization.isValidJSONObject(array) else
        {
            print("not valid json object")
            return nil
        }
        
        guard let jsonData = try?
        JSONSerialization.data(
            withJSONObject: array, options: []
        )
        else
        {
            return nil
        }
        
        /**
        guard let newValue = try?
        JSONDecoder().decode(
            Self.self, from: jsonData
        )
        else
        {
            return nil
        }
        **/
        
        print(jsonData)
        
        do
        {
            let newValue = try JSONDecoder().decode(Self.self, from: jsonData)
            self = newValue
        }
        catch let jsonErr
        {
            print("Error serializing json: ", jsonErr)
            return nil
        }
    }
}
