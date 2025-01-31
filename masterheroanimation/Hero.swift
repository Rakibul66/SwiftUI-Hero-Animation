//
//  Hero.swift
//  masterheroanimation
//
//  Created by Roxy  on 30/1/25.
//


import Foundation
import SwiftUI
// Hero model
struct Hero: Identifiable, Equatable {
    var id: Int
    var title: String
    var icon: String
    var color: Color
    var detail: String

    // Equatable conformance - required for `==` operator
    static func == (lhs: Hero, rhs: Hero) -> Bool {
        return lhs.id == rhs.id
    }
}



class HeroViewModel: ObservableObject {
    @Published var heroes = [
        Hero(id: 1, title: "Flutter", icon: "app.fill", color: .blue, detail: "Flutter is an open-source UI software development kit."),
        Hero(id: 2, title: "React Native", icon: "globe", color: .purple, detail: "React Native is a framework for building native apps using React."),
        Hero(id: 3, title: "Jetpack Compose", icon: "gearshape.fill", color: .orange, detail: "Jetpack Compose is a modern UI toolkit for Android."),
        Hero(id: 4, title: "KMP", icon: "rectangle.stack.fill", color: .green, detail: "Kotlin Multiplatform allows you to share code between Android and iOS.")
    ]
}
