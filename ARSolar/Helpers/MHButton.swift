//
//  MHButton.swift
//  ARSolar
//
//  Created by Mohamed Hegab on 12/7/17.
//  Copyright © 2017 Mohamed Emad Hegab. All rights reserved.
//

import UIKit

class MHButton: UIButton {
    override var isSelected: Bool {
        didSet {
             tintColor = isSelected ?  UIColor.lightGray : UIColor.white
        }
    }
}
