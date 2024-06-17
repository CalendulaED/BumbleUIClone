//
//  BumbleChatsView.swift
//  BumbleClone
//
//  Created by Yuxuan Wu on 6/11/24.
//

import SwiftUI
import SwiftfulRouting

struct BumbleChatsView: View {
    
    @Environment(\.router) var router
    
    @State private var allUsers: [User] = []
    
    var body: some View {
        ZStack {
            Color.bumbleWhite.ignoresSafeArea()
            
            VStack(spacing: 0) {
                header
                    .padding(16)
                
                matchQueueSection
                    .padding(.vertical, 16)
                
                recentChatSection

            }
            
        }
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private func getData() async {
        guard allUsers.isEmpty else { return }
        
        do {
            allUsers = try await DatabaseHelper().getUsers()
        } catch {
            
        }
    }
    
    private var header: some View {
        HStack(spacing: 0) {
            Image(systemName: "line.horizontal.3")
                .onTapGesture {
                    router.dismissScreen()
                }
            Spacer()
            Image(systemName: "magnifyingglass")
        }
        .font(.title)
        .fontWeight(.medium)
    }
    
    private var matchQueueSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Group {
                Text("Match Queue")
                +
                Text("(\(allUsers.count))")
                    .foregroundStyle(.bumbleGray)
            }
            .padding(.horizontal, 16)
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 16) {
                    ForEach(allUsers) { user in
                        BumbleProfileImageCell(
                            imageName: user.image,
                            percentageRemaining: Double.random(in: 0...1),
                            hasNewMessage: Bool.random()
                        )
                    }
                }
                .padding(.leading, 16) // padding here make sure the scroll can reach to the edge of the device on the left
            }
            .scrollIndicators(.hidden)
            .frame(height: 100)
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var recentChatSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 0) {
                Group {
                    Text("Match Queue")
                    +
                    Text("(\(allUsers.count))")
                        .foregroundStyle(.bumbleGray)
                }
                
                Spacer(minLength: 0)
                
                Image(systemName: "line.horizontal.3.decrease")
                    .font(.title2)
            }
            .padding(.horizontal, 16)
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 16) {
                    ForEach(allUsers) { user in
                        BumbleChatPreviewCell(
                            imageName: user.image,
                            percentageRemaining: Double.random(in: 0...1),
                            hasNewMessage: Bool.random(),
                            userName: user.firstName,
                            lastChatMessage: user.lastName,
                            isYourMove: Bool.random()
                        )
                    }
                }
                .padding(16)
            }
            .scrollIndicators(.hidden)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    BumbleChatsView()
}
