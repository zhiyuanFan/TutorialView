//
//  TutorialModel.swift
//  TestFillRule
//
//  Created by Jason Fan on 08/08/2017.
//  Copyright © 2017 QooApp. All rights reserved.
//

import UIKit

public enum LineDirection {
    case up
    case down
    case left
    case right
    case leftDown
    case rightDown
}

class TutorialModel {
    var centerPoint: CGPoint?
    var radius: CGFloat?
    var towards: LineDirection?
    var title: String?
    var size: CGSize?
}
