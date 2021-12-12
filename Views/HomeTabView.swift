//
//  HomeTabView.swift
//  571hw9v2
//
//  Created by Jiliang Li on 12/4/21.
//
import SwiftSpinner
import SwiftUI
import UIKit

struct HomeTabView: View {
    @EnvironmentObject var model: ContentModel
    var body: some View {
//        if (model.initialize) {
//            ZStack(){
//                Image("App_background").resizable()
//                    .scaledToFill().ignoresSafeArea()
//                Text("Power by Tomorrow")
//            }
//        }
        if (!model.gotLoc) {
            ZStack(alignment: .topTrailing){
                WelcomeSpinView().ignoresSafeArea().background(WelPic())
            }
        }
        else {
            CurCityView()
        }
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
