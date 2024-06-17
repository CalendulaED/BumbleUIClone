//
//  User.swift
//  BumbleClone
//
//  Created by Yuxuan Wu on 6/5/24.
//

import Foundation

struct UserArray: Codable {
    let users: [User]
    let total, skip, limit: Int
}

struct User: Codable, Identifiable {
    let id: Int
    let firstName, lastName: String
    let age: Int
    let email, phone, username, password: String
    let image: String
    let height: Double
    let weight: Double
    
    var aboutMe: String {
        "This is a sentence about me that will look good on my profile"
    }
    
    var basics: [UserInterest] {
        [
            UserInterest(iconName: "ruler", emoji: nil, text: "\(height)"),
            UserInterest(iconName: "graduationcap", emoji: nil, text: "Graduate Degree"),
            UserInterest(iconName: "wineglass", emoji: nil, text: "Socially"),
            UserInterest(iconName: "moon.stars.fill", emoji: nil, text: "Virgo"),
        ]
    }
    
    var interests: [UserInterest] {
        [
            UserInterest(iconName: nil, emoji: "🥰", text: "Running"),
            UserInterest(iconName: nil, emoji: "🫠", text: "Gym"),
            UserInterest(iconName: nil, emoji: "😝", text: "Music"),
            UserInterest(iconName: nil, emoji: "😁", text: "Cooking"),
        ]
    }
    
    var images: [String] {
        ["https://picsum.photos/500/500", "https://picsum.photos/600/600", "https://picsum.photos/700/700"]
    }
    
    static var mock: User {
        User(
            id: 144,
            firstName: "Awu",
            lastName: "W",
            age: 24,
            email: "w@gmail.com",
            phone: "123",
            username: "awu",
            password: "123",
            image: Constants.randomImage,
            height: 188,
            weight: 83
        )
    }
}
