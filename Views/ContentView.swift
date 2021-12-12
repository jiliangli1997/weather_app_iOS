//
//  ContentView.swift
//  571hw9v2
//
//  Created by Jiliang Li on 12/4/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model: ContentModel
    var body: some View {
         
        HomeTabView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
