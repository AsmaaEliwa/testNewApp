//
//  MotionManger.swift
//  testNewApp
//
//  Created by asmaa gamal  on 20/02/2024.
//

import Foundation
import CoreMotion
 
class MotionManger{
    //Create an instance of the CMMotionManager class, which acts as the entry point for accessing motion-related data.
    let motionManger = CMMotionManager()
    init(){
        
    }
    func config(){
        if motionManger.isAccelerometerAvailable {
            motionManger.accelerometerUpdateInterval = 0.1 // Update interval in seconds
            motionManger.startAccelerometerUpdates(to: .main) { (data, error) in
                // Handle accelerometer data here
            }
        }
    }
    
    func stopUpdate(){
        motionManger.stopAccelerometerUpdates()
    }
}
