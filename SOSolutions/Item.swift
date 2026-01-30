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
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
