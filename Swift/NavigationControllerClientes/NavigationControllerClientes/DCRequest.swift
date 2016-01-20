//
//  DCRequest.swift
//  iTunesList
//
//  Created by Diego Cavalca on 02/05/15.
//  Copyright (c) 2015 Diego Cavalca. All rights reserved.
//
import UIKit

class DCRequest {
    internal func getData(url: String, completionHandler: ((NSData!, NSError!) -> Void)!) -> Void
    {
        
        let httpMethod = "GET"
        let timeout = 15
        let url = NSURL(string: url)
        let urlRequest = NSMutableURLRequest(URL: url!,
            cachePolicy: .ReloadIgnoringLocalAndRemoteCacheData,
            timeoutInterval: 15.0)
        let queue = NSOperationQueue()
        NSURLConnection.sendAsynchronousRequest(
            urlRequest,
            queue: queue,
            completionHandler: {(response: NSURLResponse!,
                data: NSData!,
                error: NSError!) in
                if (error != nil) {
                    return completionHandler(nil, error)
                }
                if data.length >= 0 && error == nil{
                    //let json = NSString(data: data, encoding: NSASCIIStringEncoding)
                    // Retornar resultado...
                    return completionHandler(data, nil)
                    
                } else {
                    return completionHandler(nil, error)
                }
            }
        )
        
    }
    internal func parseJSON(data:NSData)->AnyObject
    {
        var parseError: NSError?
        let parsedObject: AnyObject? = NSJSONSerialization.JSONObjectWithData(data,
            options: NSJSONReadingOptions.AllowFragments,
            error:&parseError)
        return parsedObject!
    }
}