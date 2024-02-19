//
//  jsonSerialization.swift
//  testNewApp
//
//  Created by asmaa gamal  on 19/02/2024.
//

import Foundation
//Serialization (Encoding):


// Create a Swift dictionary representing some data
let dataDict: [String: Any] = [
    "name": "John Doe",
    "age": 30,
    "isStudent": false,
    "scores": [85, 90, 78]
]

func encode(){
    do{
        let jsonData = try JSONSerialization.data(withJSONObject: dataDict, options: [])
        print("json data is \(jsonData)")
        let stringData = String(data: jsonData, encoding: .utf8)
        print("stringData  is \(stringData)")
    }catch{
        
    }
    
}

//Deserialization (Decoding):


let jsonString = """
{
    "name": "Jane Smith",
    "age": 25,
    "isStudent": true,
    "scores": [92, 88, 95]
}
"""


func decode(){
    if let jsonData = jsonString.data(using: .utf8) {
        do {
            if let jsonDict = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] {
                print("\nDeserialized JSON data:")
                print("Name:", jsonDict["name"] ?? "")
                print("Age:", jsonDict["age"] ?? "")
                print("Is Student:", jsonDict["isStudent"] ?? "")
                print("Scores:", jsonDict["scores"] ?? "")
            } else {
                print("Failed to convert JSON data to dictionary")
            }
        } catch {
            print("Error deserializing JSON:", error)
        }
    } else {
        print("Failed to convert JSON string to data")
    }
}
