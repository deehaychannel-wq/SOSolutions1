//
//  SignInView.swift
//  SOSolutions
//
//  Created by Dee Hay on 2/3/26.
//

import SwiftUI
import AuthenticationServices

struct SignInView: View {
    @Binding var isSignedIn: Bool
    @Binding var username: String
    
    var body: some View {
        SignInWithAppleButton(
            onRequest: { request in
                request.requestedScopes = [.fullName, .email]
            },
            onCompletion: { result in
                switch result {
                case .success(let authorization):
                    if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
                        let userID = appleIDCredential.user
                        KeychainSrvc.save(userID, for: keychainKeys.appleUserID)
                        
                        if let fullName = appleIDCredential.fullName {
                            let first = fullName.givenName ?? ""
                            let last = fullName.familyName ?? ""
                            username = "\(first) \(last)"
                            
                            KeychainSrvc.save(username, for: keychainKeys.fullName)
                        } else {
                            username = KeychainSrvc.load(keychainKeys.fullName) ?? "User"
                        }
                        
                        isSignedIn = true
                    }
                case .failure(let error):
                    print("Apple Sign In failed: \(error.localizedDescription)")
                }
            }
        )
    }
}
