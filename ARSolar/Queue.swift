//
//  Queue.swift
//  ARSolar
//
//  Created by Mohamed Emad Hegab on 10/02/16.
//  Copyright © 2017 ARSolar. All rights reserved.
//
import UIKit

struct Queue {

    static let main = Queue(queue: DispatchQueue.main)

    let queue: DispatchQueue
    init(queue: DispatchQueue) {
        self.queue = queue
    }

    func after(_ time: TimeInterval, block: @escaping () -> Void) {
        queue.asyncAfter(deadline: DispatchTime.now() + Double(Int64(time * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: block)
    }

}
