//
//  File.swift
//  TwitterClient
//
//  Created by Bill Luoma on 10/24/16.
//  Copyright © 2016 Bill Luoma. All rights reserved.
//

import Foundation

//MARK: - dlog
func dlog(_ message: String, _ filePath: String = #file, _ functionName: String = #function, _ lineNum: Int = #line)
{
    #if DEBUG
        
        let url  = URL(fileURLWithPath: filePath)
        let path = url.lastPathComponent
        var fileName = "Unknown"
        if let name = path.characters.split(separator: ",").map(String.init).first {
            fileName = name
        }
        let logString = String(format: "%@.%@[%d]: %@", fileName, functionName, lineNum, message)
        NSLog(logString)
        
    #endif
    
}

//MARK: - alog
func alog(_ message: String, _ filePath: String = #file, _ functionName: String = #function, _ lineNum: Int = #line)
{
    let url  = URL(fileURLWithPath: filePath)
    let path = url.lastPathComponent
    var fileName = "Unknown"
    if let name = path.characters.split(separator: ",").map(String.init).first {
        fileName = name
    }
    let logString = String(format: "%@.%@[%d]: %@", fileName, functionName, lineNum, message)
    NSLog(logString)
}



func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    let documentsDirectory = paths[0]
    return documentsDirectory
}

//MARK: - oauth1a

let consumerKey = "52LAxu5pHerDedZznOe0pMfJ6"
let consumerSecret = "TzgDLpTTPvqPV9zezDZrsVY8lj4MyTsTMZl1vVtsiqIRGgld4m"
let oauth1CallBackUrl = URL(string: "btweeter://oauth")!
var oauthAccessToken: String? = nil
var oauthVerifierToken: String? = nil
let didReceiveOauthTokenNotification = Notification.Name(rawValue: "didReceiveOauthTokenNotification")

