//
//  CurCityView.swift
//  571hw9v2
//
//  Created by Jiliang Li on 12/6/21.
//

import SwiftUI



struct CurCityView: View {
    @EnvironmentObject var model: ContentModel
    var curTemp:Double?
    @State var showBar = true
    @State var test = true
    @State private var showT = false
    
    //    SpecificCityPage(city: model.selected)
    var body: some View {
        
        // TabView{
        //  ForEach(model.favWeather.sorted(by: >), id:\.key) {
        
        
        //key, value in
        
            NavigationView{
                        VStack{
                            VStack{
                                
                                
                                HStack() {
                                    Image(systemName: "magnifyingglass").foregroundColor(.gray)
                                    TextField("Enter City Name", text: $model.curCity, onEditingChanged: { (editingChanged) in
                                        if editingChanged {
                                            model.opcacity = 0.9
                                        }
                                    })
                                    if model.curCity != "" {
                                        Image(systemName: "clear.fill").foregroundColor(.gray)
                                    }
                                  
                                    //                            .onAppear(perform: {
                                    //                            if model.curCity != "" {
                                    //                                model.opcacity = 0.9
                                    //                            }
                                    //                        })
                                }.padding(.horizontal)
                                
                                
                                
                            }
                            
                            ZStack{
                                Image("App_background").resizable()
                                    .scaledToFill().ignoresSafeArea()
                                
                                TabView{
                                    ForEach(model.favLoc, id:\.self) { city in
                                        
                                        VStack{
                                            if (city != "Los Angeles") {
                                                Button(action: {
                                                    showT = true
                                                    model.add = false
                                                    model.remove = true
                                                        model.removeFromFav(curCity: city)
                                                      
                                                })
                                                { Image("close-circle").background(.blue.opacity(0)).padding(.top, 30).padding(.bottom, -30).padding(.leading, 200)}
                                            }
                                            ZStack{
                                                NavigationLink(destination: TableView()){
                                                    RoundedRectangle(cornerRadius: 15).frame(width: 360, height: 180).foregroundColor(.white).padding(.top,50).opacity(0.7)}.simultaneousGesture(TapGesture().onEnded{
                                                        model.selected = city
                                                        model.weathers = model.favWeather[city]
                                                    })
                                                VStack{
                                                    HStack(alignment: .center){
                                                        Image((model.favWeather[city]?.data?.timelines![1].intervals![0].values?.status!)!)  .resizable()
                                                            .frame(width: 150, height: 150)
                                                        VStack{
                                                                
                                                                Text("\(Int((model.favWeather[city]?.data?.timelines![2].intervals![0].values?.temperature)!))").font(.system(size: 30, weight: .heavy, design: .default)) + Text("°F").font(.system(size: 30, weight: .heavy, design: .default))
                                                                Text("\((model.favWeather[city]?.data?.timelines![1].intervals![0].values?.status)!)")
                                                            Text("\(city)").font(.system(size: 15, weight: .heavy, design: .default))
                                                        }
                                                    }
                                                }
                                                
                                            }
                                            
                                            
                                            
                                            Spacer()
                                            SecondRowView(city: city)
                                            Spacer()
                                            ThirdRowView(city:city)
                                            Spacer()
                                        }
                                    }
                                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                                
                                if model.curCity != "" {
                                    VStack{
                                        
                                        ScrollView(.vertical, showsIndicators: true) {
                                            LazyVStack(alignment: .leading, spacing: 10) {
                                                ForEach(model.cityList.filter({"\($0)".contains(model.curCity)}), id:\.self) { city in
                                                    NavigationLink(destination: SpecificCityPage()){
                                                        VStack(alignment: .leading, spacing: 5) {
                                                            Text("\(city)")
                                                            Divider()
                                                        }.padding(.horizontal)
                                                    } .simultaneousGesture(TapGesture().onEnded{
                                                        model.fetch = true
                                                        model.selected = city
                                                        model.getLatlon(address: model.selected)
                                                        model.opcacity = 0.0
                                                    })
                                                    
                                                }
                                            }
                                            
                                        }.frame(minWidth: 0, maxWidth: 380, minHeight: 0, maxHeight: 100)
                                            .clipShape(RoundedRectangle(cornerRadius: 15)).foregroundColor(.black).background(.white).opacity(model.opcacity)
                                        Spacer()
                                    }
                                    
                                    
                                }
                                
                            }
                        } .navigationBarTitle("Weather").navigationBarHidden(true)
                        
                .toast(isShowing: $showT)}

        
        // }
        
        // }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        
        
        
        
    }
}

struct CurCityView_Previews: PreviewProvider {
    static var previews: some View {
        CurCityView()
    }
}
