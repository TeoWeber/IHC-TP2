//
//  ViewCodeProtocol.swift
//  IHC TP2
//
//  Created by Teo Weber on 08/09/21.
//

import Foundation
import UIKit

public protocol ViewCodeProtocol {
    associatedtype CustomView: UIView
}

extension ViewCodeProtocol where Self: UIViewController {
    
    public var customView: CustomView {
        guard let customView = view as? CustomView else {
            fatalError("ViewCode error! View should be \(CustomView.self), not \(type(of: view)).")
        }
        return customView
    }
}
