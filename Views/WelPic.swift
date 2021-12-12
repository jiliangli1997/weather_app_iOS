//
//  WelPic.swift
//  571hw9v2
//
//  Created by Jiliang Li on 12/5/21.
//

import SwiftUI

struct WelPic: View {
    var body: some View {
        Image("App_background").resizable()
            .scaledToFill().ignoresSafeArea()
    }
}

struct WelPic_Previews: PreviewProvider {
    static var previews: some View {
        WelPic()
    }
}
