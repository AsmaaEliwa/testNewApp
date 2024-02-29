//
//  SwiftUIView.swift
//  testNewApp
//
//  Created by asmaa gamal  on 29/02/2024.
//

import SwiftUI
import PMAlertController
//struct SwiftUIView: View {
//    func createAlert(){
//        let customAlert = PMAlertController(title: "my custom alert!", description: "custom alert", image: UIImage(named: "icon"), style: .alert)
//        customAlert.addAction(PMAlertAction(title: "OK", style: .default, action: {
//            
//        }))
//        customAlert.addAction(PMAlertAction(title: "WOW", style: .cancel, action: {
//            
//        }))
//        present(customAlert,animated:true , compilation:nil)
//    }
//    var body: some View {
//        VStack{
//            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//        }.onAppear(){
//            createAlert()
//        }
//    }
//}
//
//#Preview {
//    SwiftUIView()
//}
import SwiftUI

struct CustomAlertView: View {
    var body: some View {
        VStack {
            Text("my custom alert!")
            Text("custom alert")
            Button("OK", action: {
                // Handle OK button action
            })
            .buttonStyle(DefaultButtonStyle())
            Button("WOW", action: {
                // Handle WOW button action
            })
            .buttonStyle(DefaultButtonStyle())
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct SwiftUIView: View {
    @State private var showAlert = false

    var body: some View {
        VStack {
            Text("Hello, World!")
        }
        .onAppear {
            self.showAlert = true
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("")
            )
        }
    }
}
