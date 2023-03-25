//
//  Colors.swift
//  TestTaskSwiftUI
//
//  Created by Антон Шарин on 20.03.2023.
//

import Foundation
import SwiftUI

extension Color {
  init(_ hex: UInt, alpha: Double = 1) {
    self.init(
      .sRGB,
      red: Double((hex >> 16) & 0xFF) / 255,
      green: Double((hex >> 8) & 0xFF) / 255,
      blue: Double(hex & 0xFF) / 255,
      opacity: alpha
    )
  }
}


let signInButtonColor = Color(0x4E55D7)
let signInScreenBackColor = Color(0xFAF9FF)
let signInTextFieldBackColor = Color(0xE8E8E8)
let categoryBackColor = Color(0xEEEFF4)
let homeSearchBarColor = Color(0xF5F6F7)
let tabBarSelectedColor = Color(0xEEEFF4)

let addToCartBackground = Color(0x181726)

let screenSize = UIScreen.main.bounds.size


