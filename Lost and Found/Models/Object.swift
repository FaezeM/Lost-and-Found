//
//  Object.swift
//  Lost and Found
//
//  Created by Faeze Memari on 15/02/25.
//

import Foundation
import UIKit

struct Object {
    let name: String
    let location: String
    let discription: String
    var image: UIImage
}

var Objects = [
    Object(name: "cat", location: "main st.", discription: "a cat is lost in the neighborhood", image: UIImage(named: "cat1")!),
    Object(name: "tobby", location: "6th st.", discription: "tobby is missing", image: UIImage(named: "cat2")!),
    Object(name: "mr. plankton", location: "barley st.", discription: "ran away", image: UIImage(named: "cat3")!),
    Object(name: "cat", location: "sand st.", discription: "a cat is found in the neighborhood", image: UIImage(named: "cat4")!)
]
