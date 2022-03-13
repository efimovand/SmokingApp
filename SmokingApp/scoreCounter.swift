//
//  scoreCounter.swift
//  SmokingApp
//
//  Created by Андрей Ефимов on 14.03.2022.
//

import Foundation

// Public score
class Score: ObservableObject {
    @Published var score: Int = 8
}
