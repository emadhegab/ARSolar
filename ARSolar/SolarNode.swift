//
//  SolarNode.swift
//  ARSolar
//
//  Created by Mohamed Hegab on 12/2/17.
//  Copyright © 2017 Mohamed Emad Hegab. All rights reserved.
//

import Foundation
import ARKit

class SolarNode: SCNNode {
    init(geometry: SCNGeometry) {
        super.init()
        self.geometry = geometry
    }
    /* Xcode required this */
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
