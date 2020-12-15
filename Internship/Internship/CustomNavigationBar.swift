//
//  CustomNavigationBar.swift
//  Internship
//
//  Created by 懶懶獸 🐼 on 12/13/20.
//

import Foundation
import UIKit
struct System {
    static func clearNavigationBar(forBar navBar: UINavigationBar) {
        navBar.setBackgroundImage(UIImage(), for: .default)
        //navBar.backButtonImage = UIImage(named: "backButton")
        navBar.shadowImage = UIImage()
        navBar.isTranslucent = true

    }

}
