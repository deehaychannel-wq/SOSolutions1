//
//  ChatService.swift
//  SOSolutions
//
//  Created by Dee Hay on 2/8/26.
//

import Foundation

final class ChatService {
    var onReceive: ((String) -> Void)?

    func send(_ text: String) {
        // simulate network delay + response
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.onReceive?("Auto-reply to: \(text)")
        }
    }
}
