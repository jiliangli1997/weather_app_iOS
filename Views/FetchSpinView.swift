//
//  WelcomeSpinView.swift
//  571hw9v2
//
//  Created by Jiliang Li on 12/4/21.
//

import SwiftUI
import SwiftSpinner

struct FetchSpinView: UIViewRepresentable {
    @EnvironmentObject var model: ContentModel
    func makeUIView(context: Context) -> some UIView {
        SwiftSpinner.show("Fetching Weather Details for " + "\(model.selected)")
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

