//
//  WelcomeSpinView.swift
//  571hw9v2
//
//  Created by Jiliang Li on 12/4/21.
//

import SwiftUI
import SwiftSpinner

struct WelcomeSpinView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> some UIView {
        SwiftSpinner.show("Loading...")
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

struct WelcomeSpinView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeSpinView()
    }
}
