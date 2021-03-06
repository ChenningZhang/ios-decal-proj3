//
//  Photo.swift
//  Photos
//
//  Created by Gene Yoo on 11/3/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import Foundation

class Photo {
    /* The number of likes the photo has. */
    var likes : Int!
    /* The string of the url to the photo file. */
    var url : String!
    /* The username of the photographer. */
    var username : String!
    /* The date posted. */
    var date : String!
    /* Liked or not */
    var isLiked : Bool!

    /* Parses a NSDictionary and creates a photo object. */
    init (data: NSDictionary) {
        // FILL ME IN
        // HINT: use nested .valueForKey() calls, and then cast using 'as! TYPE'
        self.likes = data.valueForKey("likes")?.valueForKey("count") as! Int
        self.username = data.valueForKey("user")?.valueForKey("username") as! String
        self.url = data.valueForKey("images")?.valueForKey("thumbnail")?.valueForKey("url") as! String
        self.date = data.valueForKey("created_time") as! String
        self.isLiked = false
    }

}