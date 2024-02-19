//
//  threadSwiftUIView.swift
//  testNewApp
//
//  Created by asmaa gamal  on 18/02/2024.
//

import SwiftUI
import Combine

struct threadSwiftUIView: View {
    @State private var message: String = ""
    var mydispatch = dispatch()
    var body: some View {
        VStack {
            Text(message)
                .padding()
            
            Button("Start Background Task") {
                startBackgroundTask()
            }
        }.onAppear(){
            mydispatch.addTask()
            mydispatch.createSerialConcurrentQueue()
            self.startgroupTask()
            Task{
                await mydispatch.useActor()
                
            }
            encode()
            decode()
        }
    }
    
    func startBackgroundTask() {
        // Perform a task on a background thread
        DispatchQueue.global().async {
            // Simulate a long-running task
            Thread.sleep(forTimeInterval: 3)
            print(Thread.current)
            // Update UI on the main thread
            DispatchQueue.main.async {
                self.message = "Background task completed!"
            }
        }
    }
    
    func startgroupTask() {
        Task{
           await withTaskGroup(of: Void.self ) {group in
               for i in 1...3{
                   group.addTask {
                     await myTask(i: i)
                   }
               }
//               do {
//               try
                   await group.waitForAll()
//               }catch{
//                   print(error)
//               }
            }
            
            
        }
        
    }
    
    func myTask(i:Int)async{
        await Task.sleep(2)
        print(i)   //  2 1 3 will by concurrently executed
    }
    
    
    func startDispatchGroup(){
        let myDispatchGroup = DispatchGroup()
        myDispatchGroup.enter()
        performBackgroundTask1(completion: {
            myDispatchGroup.leave()
               })
        // Notify when all tasks in the group have completed
        myDispatchGroup.notify(queue: .main) {
                   self.message = "All background tasks completed!"
               }
    }
    
    
    
    func performBackgroundTask1(completion: @escaping () -> Void) {
         DispatchQueue.global().async {
             // Simulate a long-running task
             Thread.sleep(forTimeInterval: 3)
             print("Background task 1 completed")
             completion()
         }
     }
    
}

struct threadSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        threadSwiftUIView()
    }
}
