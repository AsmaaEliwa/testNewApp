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
           await Task.withGroup(resultType: Void.self ) {group in
               for i in 1...3{
                   group.addTask {
                     await myTask(i: i)
                   }
               }
               do {
               try
                   await group.waitForAll()
               }catch{
                   print(error)
               }
            }
            
            
        }
        
    }
    
    func myTask(i:Int)async{
        await Task.sleep(2)
        print(i)   //  2 1 3 will by concurrently executed
    }
    
    
}

struct threadSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        threadSwiftUIView()
    }
}
