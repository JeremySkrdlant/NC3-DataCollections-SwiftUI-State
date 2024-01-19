//
//  MarsData.swift
//  NC3-DataCollections-SwiftUI-State
//
//  Created by Jeremy Skrdlant on 1/18/24.
//

import Foundation

struct Photo:Codable{
    var id: Int
    var img_src: String
    var earth_date: String
}

struct MarsResult:Codable{
    var photos: [Photo]
}


func getPhoto(sol:Int)async throws ->MarsResult?{
    let key = "PUT_YOUR_OWN_KEY_HERE" //https://api.nasa.gov/
    
    let urlString = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=\(sol)&api_key=\(key)"
    
    guard let url = URL(string: urlString) else {
        print("We have an error getting the URL")
        return nil
    }
    
    let request = URLRequest(url: url)
    
    do{
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            print("Error contacting server")
            return nil
        }
        
        let jsonDecoder = JSONDecoder()
        let result = try jsonDecoder.decode(MarsResult.self, from: data)
        return result
        
    }catch {
        print("Error")
        return nil
    }
}


