//
//  GetJsonDataFromApi.swift
//  Fetch
//
//  Created by Nihar Satasia on 6/11/24.
//

import Foundation

// File private variable to be returned containing the JSON data
fileprivate var jsonDataFromApi = Data()

/*
*   Get JSON Data from a RESTful API
*/
public func getJsonDataFromApi(apiHeaders: [String: String], apiUrl: String, timeout: Double) -> Data? {
    jsonDataFromApi = Data()
    
    // Obtaining API Query URL Struct
    var apiQueryUrlStruct: URL?
    if let urlStruct = URL(string: apiUrl) {
        apiQueryUrlStruct = urlStruct
    } else {
        return nil
    }
        
    // Setting Up HTTP Get Request
    let request = NSMutableURLRequest(url: apiQueryUrlStruct!,
                                      cachePolicy: .useProtocolCachePolicy,
                                      timeoutInterval: timeout)
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = apiHeaders
    
    // Setting Up a URL Session to Fetch the JSON File from the API in an Asynchronous Manner
    let semaphore = DispatchSemaphore(value: 0)
    
    URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
        guard error == nil else {
            semaphore.signal()
            return
        }
       
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            semaphore.signal()
            return
        }
       
        guard let dataObtained = data else {
            semaphore.signal()
            return
        }
        
        jsonDataFromApi = dataObtained
        semaphore.signal()
    }).resume()
   
    _ = semaphore.wait(timeout: .now() + timeout)
    
    return jsonDataFromApi
}

