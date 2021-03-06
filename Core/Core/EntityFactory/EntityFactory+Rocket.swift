//
//  EntityFactory+Rocket.swift
//  Core
//
//  Created by Ramon Haro Marques
//

import Foundation
public extension EntityFactory {
    /// Returns an instance of Rocket
    static let falcon1Rocket: Rocket = Rocket(id: "5e9d0d95eda69955f709d1eb", name: "Falcon 1", type: .rocket)
    
    /// Returns an instance of Rocket
    static let falconHeavyRocket: Rocket = Rocket(id: "5e9d0d95eda69974db09d1ed", name: "Falcon Heavy", type: .unknown)
}
