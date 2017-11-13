//
//  DemoURL.swift
//  Cassini
//
//  Created by Sanzhar on 11/1/17.
//  Copyright © 2017 Sanzhar Dauylov. All rights reserved.
//

import Foundation

struct DemoURL {
  static let stanford = URL(string: "https://www-media.stanford.edu/wp-content/uploads/2017/03/24182714/about_landing-1.jpg")
  
  static var NASA: Dictionary<String, URL> = {
    let NASAURLStrings = [ "Cassini" : "https://cdn.theatlantic.com/assets/media/img/photo/2017/06/the-best-of-cassini13-years-in-orbi/s01_RTX15AM4/main_900.jpg?1496860095",
                           "Earth" : "https://www.nasa.gov/centers/goddard/images/content/638831main_globe_east_2048.jpg",
                           "Saturn" : "https://saturn.jpl.nasa.gov/system/resources/detail_files/7504_PIA21046_MAIN.jpg"
    ]
    var urls = Dictionary<String, URL>()
    for (key, value) in NASAURLStrings {
      urls[key] = URL(string: value)
    }
    return urls
  }()
  
}
