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
    override init() {
        super.init()
        self.geometry?.firstMaterial?.locksAmbientWithDiffuse = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
