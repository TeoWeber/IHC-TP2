//
//  Activities.swift
//  IHC TP2
//
//  Created by Teo Weber on 08/09/21.
//

import Foundation

enum Activities: String, CaseIterable {
    case activity1
    case activity2
    case activity3
    case activity4
    
    var localized: String {
        switch self {
        case .activity1:
            return "Atividade 1"
        case .activity2:
            return "Atividade 2"
        case .activity3:
            return "Atividade 3"
        case .activity4:
            return "Atividade Parte 2"
        }
    }
}
