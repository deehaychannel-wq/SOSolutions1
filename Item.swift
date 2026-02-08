//
//  Item.swift
//  SOSolutions
//
//  Created by Dee Hay on 1/30/26.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    var content: String
    var index: Int = -1
    
    init(content: String, index: Int) {
        self.timestamp = Date()
        self.content = content
        self.index = index
    }
}
