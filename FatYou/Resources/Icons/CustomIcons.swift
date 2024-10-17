//
//  CustomIcons.swift
//  FatYou
//
//  Created by Глеб Москалев on 17.10.2024.
//

import SwiftUI

enum CustomIcons: String{
    case back
    case calendar
    case close
    case diary
    case down
    case downSmall
    case edit
    case minus
    case plus
    case more
    case profile
    case question
    case statistics
    case trash
    case up
    case upSmall
    case warning
}


extension Image{
    init(_ name: CustomIcons){
        self.init(name.rawValue)
    }
}
