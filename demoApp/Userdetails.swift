//
//  Userdetails.swift
//  demoApp
//
//  Created by Pravinkumar on 21/11/25.
//

import Foundation


struct Userdetails : Codable {
    var name: String
    var email: String
    var phone: String
}

struct Result : Codable

{
    var results : Details
}


struct Details : Codable {
    
    var date : String
    
     var sunrise : String
    
}



//https://api.sunrisesunset.io/json?lat=38.907192&lng=-77.036873

/*
 {
     "results": {
         "date": "2025-11-24",
         "sunrise": "7:02:17 AM",
         "sunset": "4:50:30 PM",
         "first_light": "5:28:39 AM",
         "last_light": "6:24:08 PM",
         "dawn": "6:33:13 AM",
         "dusk": "5:19:34 PM",
         "solar_noon": "11:56:24 AM",
         "golden_hour": "4:10:11 PM",
         "day_length": "9:48:13",
         "timezone": "America/New_York",
         "utc_offset": -300
     },
     "status": "OK"
 }
 */
