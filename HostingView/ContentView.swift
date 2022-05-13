//
//  ContentView.swift
//  HostingView
//
//  Created by Joseph Cheung on 13/5/2022.
//

import SwiftUI
import UIKit

enum Route {
    case hosting
    case normal
}

struct ContentView: View {
    @State var route: Route = .hosting
    
    var body: some View {
        HStack {
            VStack {
                Button("To hosting") {
                    route = .hosting
                }
                Button("To normal") {
                    route = .normal
                }
            }
            .frame(width: 300)
            VStack {
                switch route {
                case .hosting:
                    HostingView(view: Text("1").onAppear {
                        print("1 appear")
                    })

                case .normal:
                    Text("Normal")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
