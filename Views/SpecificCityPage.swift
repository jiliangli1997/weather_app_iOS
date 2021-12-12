//
//  SpecificCityPage.swift
//  571hw9v2
//
//  Created by Jiliang Li on 12/5/21.
//

import SwiftUI

struct ToastModifier: ViewModifier {
    @Binding var isShowing: Bool
    let duration: TimeInterval
    
    @EnvironmentObject var model: ContentModel
    func body(content: Content) -> some View {
        ZStack {
            content
            if (isShowing) {
                VStack{
                    Spacer()
                    HStack {
                        if (model.add) {
                            Text("\(model.selected)") + Text(" was added to the Favorite List")
                        } else {
                            Text("\(model.selected)") + Text(" was removed from the Favorite List")
                        }
                        Spacer()
                    }.frame(minWidth:0,maxWidth: 280).padding().background(Color.black).foregroundColor(.white).cornerRadius(5).opacity(0.8)
                }.padding().onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                        withAnimation{
                            isShowing = false
                        }
                    }
                }
            }
            
        }
    }
}

extension View {
    func toast(isShowing: Binding<Bool>, duration: TimeInterval = 1) -> some View {
        modifier(ToastModifier(isShowing: isShowing, duration: duration))
    }
}


struct SpecificCityPage: View {
    
    
    
    @EnvironmentObject var model: ContentModel
    @State var imgSrc = "plus-circle"
    @State private var showT = false
    
    var body: some View {
        
        NavigationView{ }.navigationBarItems(leading: Text("\(model.selected)").padding(.leading,100), trailing: Button(action: {
            let url = URL(string: "https://twitter.com/intent/tweet?text=The+current+temperature+at+Los+Angeles+California+is+xxx+%C2%B0F.+The+weather+conditions+are+xxx&hashtags=CSCI571WeatherSearch")
            UIApplication.shared.open(url!)
        }, label: {Image("tw")}))
        
        
        ZStack{
            
            
            
            Image("App_background").resizable()
                .scaledToFill()
            VStack(){
                HStack{
                    Spacer()
                    Button(action: {
                                        showT = true
                                        if imgSrc == "plus-circle" {
                                            model.addToFav(curCity: model.selected)
                                            imgSrc = "close-circle"
                                            model.add = true;
                                            model.remove = false;
                                        } else {
                                            model.removeFromFav(curCity: model.selected)
                                            imgSrc = "plus-circle"
                                            model.add = false;
                                            model.remove = true;
                                        }
                                    }) {
                                        Image(imgSrc)
                                    }
                }
                
                ZStack{
                    NavigationLink(destination: SearchTableView()){
                        RoundedRectangle(cornerRadius: 15).frame(width: 360, height: 170).foregroundColor(.white).padding(.top,50).opacity(0.7)}
                    VStack{
                        
                        HStack(alignment: .center){
                            Image((model.weathers?.data?.timelines![1].intervals![0].values?.status!)!)  .resizable()
                                .frame(width: 150, height: 150)
                            VStack{
                                
                                Text("\(Int((model.weathers?.data?.timelines![2].intervals![0].values?.temperature)!))").font(.system(size: 30, weight: .heavy, design: .default)) + Text("°F").font(.system(size: 30, weight: .heavy, design: .default))
                                Text("\((model.weathers?.data?.timelines![1].intervals![0].values?.status)!)")
                                Text("\(model.selected)").font(.system(size: 15, weight: .heavy, design: .default))
                            }
                        }
                        
                    }
                    
                }
                
                SearchSecondRow()
                SearchThirdRow()
                //                    Spacer()
                //
                //                    Spacer()
                    .toast(isShowing: $showT)
                
                
            }
            
        }
        .padding(.top, -180)
        
        
        
        
        
        
        
    }
    
    
    
    
}

