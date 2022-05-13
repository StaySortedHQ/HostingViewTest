//
//  HostingView.swift
//  SchedulePreview
//
//  Created by Joseph Cheung on 13/5/2022.
//  Copyright © 2022 StaySorted Limited. All rights reserved.
//

import SwiftUI

struct HostingView<V: View>: UIViewRepresentable {
    typealias UIViewType = UIHostingView
    
    private(set) var view: V

    init(view: V) {
        self.view = view
    }
    
    func makeUIView(context: Context) -> UIHostingView<V> {
        return UIHostingView<V>(view: view)
    }
    
    func updateUIView(_ uiView: UIHostingView<V>, context: Context) {
        uiView.view = view
    }
}
