//
//  ContentView.swift
//  BookWorm
//
//  Created by Santhosh Srinivas on 29/08/25.
//

import SwiftUI

struct PushButton: View{
    
    let title: String
//    @State var isOn: Bool
    @Binding var isOn: Bool
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View{
        Button(title){
            isOn.toggle()
        }
        .padding()
        .background(LinearGradient(colors: isOn ? onColors: offColors, startPoint: .top, endPoint: .bottom))
        .foregroundStyle(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: isOn ? 0 : 5)
    }
}
struct ContentView: View {
    
    @State private var rememberMe = false
    @AppStorage("notes") private var notes = ""
    @AppStorage("notes1") private var notes1 = ""
    @State private var name = ""
    @State private var hobby = ""
    var body: some View {
        NavigationStack{
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
    //            Toggle("Remember Me", isOn: $rememberMe)
                // Passing the data of isOn to remember me.
                PushButton(title: "Remember Me", isOn: $rememberMe)
                Text(rememberMe ? "On" : "Off")
                
                TextField("Enter your text", text: $notes1, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .navigationTitle("Notes")
                    .padding()
                
                Form{
                    Section{
                        TextField("Whats your name", text: $name)
                        TextField("Whats your hobby?", text: $hobby, axis: .vertical)
                    }
                }
                // this creates smth like a notes app. We always need to wrap this w a NavStack or a scrollview or a form
                TextEditor(text: $notes)
                    .padding()
                
            }
            .padding()
            .navigationTitle("Notes")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
