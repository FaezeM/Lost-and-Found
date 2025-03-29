//
//  Object.swift
//  Lost and Found
//
//  Created by Faeze Memari on 15/02/25.
//

import Foundation
import UIKit

struct Object: Codable {
    let name: String
    let location: String
    let discription: String
    var image: String
}

var Objects = [
    Object(name: "cat", location: "main st.", discription: "a cat is lost in the neighborhood", image: "cat1"),
    Object(name: "tobby", location: "6th st.", discription: "tobby is missing", image: "cat2"),
    Object(name: "mr. plankton", location: "barley st.", discription: "ran away", image: "cat3"),
    Object(name: "cat", location: "sand st.", discription: "a cat is found in the neighborhood", image: "cat4")
]



// Save Objects to file
func saveObjects(objects: [Object]) {
    do {
        let encoder = JSONEncoder()
        let data = try encoder.encode(objects)
        
        // Get document directory
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = documentsDirectory.appendingPathComponent("objects.json")
        
        // Write to file
        try data.write(to: fileURL)
        print("Objects saved successfully!")
    } catch {
        print("Failed to save objects: \(error)")
    }
}

// Load Objects from file
func loadObjects() -> [Object]? {
    let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    let fileURL = documentsDirectory.appendingPathComponent("objects.json")
    
    do {
        let data = try Data(contentsOf: fileURL)
        let decoder = JSONDecoder()
        let objects = try decoder.decode([Object].self, from: data)
        return objects
    } catch {
        print("Failed to load objects: \(error)")
        return nil
    }
}

// Function to add new object and save
func addNewObject(object: Object) {
    // First load existing objects
    var currentObjects = loadObjects() ?? []
    
    // Add the new object
    currentObjects.append(object)
    
    // Save all objects
    saveObjects(objects: currentObjects)
}


