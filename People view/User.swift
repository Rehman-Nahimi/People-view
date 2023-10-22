//
//  User.swift
//  People view
//
//  Created by Ray Nahimi on 22/10/2023.
//

import Foundation
import SwiftUI

struct User: Identifiable, Codable{
    var id = UUID()
    var name: String
    var age: Int
    var company: String
}
