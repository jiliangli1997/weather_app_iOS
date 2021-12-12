//
//  TableView.swift
//  571hw9v2
//
//  Created by Jiliang Li on 12/6/21.
//

import SwiftUI

struct TableView: View {
    @EnvironmentObject var model: ContentModel
    @State var index = 0
    var body: some View {
        ZStack{
            
            NavigationView{} .navigationBarItems(leading: Text("\(model.selected)").padding(.leading,80), trailing: Button(action: {
                let url = URL(string: "https://twitter.com/intent/tweet?text=The+current+temperature+at+Los+Angeles+California+is+57+%C2%B0F.+The+weather+conditions+are+Clear&hashtags=CSCI571WeatherSearch")
                UIApplication.shared.open(url!)
            }, label: {Image("tw")}))
            
            
            TabView(selection : $index){
                    NineBoxView()
                        .tabItem{
                            VStack{
                                if index == 0 {
                                    Image("Today_Tab").foregroundColor(.blue)
                                    Text("TODAY").foregroundColor(.blue)
                                } else {
                                    Image("Today_Tab")
                                    Text("TODAY")
                                }
                                
                            }
                        }.tag(0)
                    WeekView()
                        .tabItem{
                            VStack{
                                if index == 1 {
                                Image("Weekly_Tab").foregroundColor(.blue)
                                    Text("WEEKLY").foregroundColor(.blue)} else {
                                        Image("Weekly_Tab")
                                            Text("WEEKLY")
                                    }
                            }
                            }.tag(1)
                    WeatherDataView()
                        .tabItem{
                            VStack{
                                if index == 2 {
                                Image("Weather_Data_Tab").foregroundColor(.blue)
                                    Text("WEATHER DATA").foregroundColor(.blue)} else {
                                        Image("Weather_Data_Tab")
                                            Text("WEATHER DATA")
                                    }
                            }
                            }.tag(2)
                    
                }.padding(.top,-195)}
            
            
        
        
    }
}

struct TableView_Previews: PreviewProvider {
    static var previews: some View {
        TableView()
    }
}
