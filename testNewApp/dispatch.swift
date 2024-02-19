//
//  dispatch.swift
//  testNewApp
//
//  Created by asmaa gamal  on 18/02/2024.
//

import Foundation
class dispatch{
    // Define the task as a block object
    let task = {
        Thread.sleep(forTimeInterval: 3)
        DispatchQueue.main.async{
            print("30")
        }
    }
    func addTask(){
        DispatchQueue.global().async(execute: task)
        DispatchQueue.global().async {
            self.mytask()
        }
    }
    
    // Define the task as a function
    func mytask(){
        print("my task was executed")
    }
    
    func createSerialConcurrentQueue(){
        
        //defining a serial queue by default is serial
        let serialQueue = DispatchQueue(label: "mySerialQueue")
        serialQueue.async {
            print("\(serialQueue.label) was exicuted")
        }
      // we can also pass a block object to the serial queue
        serialQueue.async(execute: task)
        
        //defining a concurrent queue
        let concurentQueue = DispatchQueue(label: "myConcurrentQueue" , attributes: .concurrent)
        
        concurentQueue.async(execute: mytask)
        
        
    }
    
    
    actor myActor{
       private  var count:Int = 0
        func increase(){
            count+=1
        }
        func getCount()->Int{
            return count
        }
    }
    
    func useActor()async{
        let actor = myActor()
       await actor.increase()
        let value = await actor.getCount()
        print("my count is \(value)")
    }
    
}
