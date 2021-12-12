//
//  customNavBar.swift
//  571hw9v2
//
//  Created by Jiliang Li on 12/6/21.
//

import SwiftUI

struct customNavBar: View {
    @Environment(\.presentationMode) var presentationMode:Binding<PresentationMode>
    @EnvironmentObject var model: ContentModel
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    HStack{
                        Image(systemName: "chevron.left").foregroundColor(.blue)
                        Text("Weather").foregroundColor(.blue)
                    }
                })
                Spacer()
                Text("\(model.selected)").foregroundColor(.black).font(.system(size:25, weight: .bold))
                Spacer()
                Button(action: {}, label: {Image("twitter")})
            }.padding().background(Color.white.ignoresSafeArea(edges:.top)).accentColor(.white)
            Spacer()
        }
        
        
    }
}

struct customNavBar_Previews: PreviewProvider {
    static var previews: some View {
        customNavBar()
    }
}
