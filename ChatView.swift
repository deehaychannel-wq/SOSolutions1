//
//  ChatView.swift
//  SOSolutions
//
//  Created by Dee Hay on 2/5/26.
//

import SwiftUI

private let chatService = ChatService()


struct ChatView: View {
    @Binding var inChat: Bool
    
    @State private var messages: [String] = []
    @State private var inputText: String = ""
    
    
    var body: some View {
        ZStack{
            VStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(messages, id: \.self) { message in
                            HStack {
                                if message.hasPrefix("Me:") {
                                    Spacer()
                                    Text(message.replacingOccurrences(of: "Me:", with: ""))
                                        .padding(10)
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(16)
                                } else {
                                    Text(message)
                                        .padding(10)
                                        .background(Color.gray.opacity(0.2))
                                        .cornerRadius(16)
                                    Spacer()
                                }
                            }
                        }

                    }
                    .padding()
                }
                
                HStack {
                    TextField("Message", text: $inputText)
                        .textFieldStyle(.roundedBorder)
                    
                    Button("Send") {
                        sendMessage()
                    }
                }
                .padding()
            }
            
            VStack {
                HStack {
                    Button {
                        withAnimation() {
                            inChat = false
                        }
                    } label: {
                        Image(systemName: "phone.down.fill")
                            .font(.system(size: 35))
                            .foregroundColor(.white)
                            .padding(25)
                            .background(Color.red)
                            .clipShape(Circle())
                    }
                    
                    Spacer()
                }
                .padding()
                .overlay(
                    Rectangle()
                        .frame(height: 2)
                        .foregroundStyle(Color.blue),
                    alignment: .bottom
                )
                Spacer()
            }
        }
        .onAppear {
            chatService.onReceive = { incoming in
                messages.append(incoming)
            }
        }
    }
    
    private func sendMessage() {
        guard !inputText.isEmpty else { return }

        messages.append(inputText)
        chatService.send(inputText)
        inputText = ""
    }

    
}
