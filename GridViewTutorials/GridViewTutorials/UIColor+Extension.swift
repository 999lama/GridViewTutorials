//
//  UIColor+Extension.swift
//  GridViewTutorial
//
//  Created by Lama Albadri on 15/04/2022.
//

import Foundation
import UIKit

extension UIColor {
    
    static let purple = UIColor(named: "purple")!
    static let pink = UIColor(named: "pink")!
    static let orange = UIColor(named: "orange")!
    static let blue = UIColor(named: "blue")!
    static let cyan = UIColor(named: "cyan")!
    
 
    enum GridColors {
        case purple, pink, orange, blue, cyan
        var rawValue: UIColor {
            switch self {
            case .purple:
                return .purple
            case .pink:
                return .pink
            case .orange:
                return .orange
            case .blue:
                return .blue
            case .cyan:
                return .cyan
            }
        }
    }
    
    
    
}
