//
//  ThirdRowView.swift
//  571hw9v2
//
//  Created by Jiliang Li on 12/8/21.
//

import SwiftUI

struct ThirdRowView: View {
    @EnvironmentObject var model: ContentModel
    var city : String
    var body: some View {
        ZStack{ if model.favWeather[city] != nil {
            
            ScrollView(.vertical, showsIndicators: true) {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(0 ..< (model.favWeather[city]?.data?.timelines![1].intervals!.count)!) { i in
                       
                            VStack(alignment: .leading, spacing: 5) {
                                HStack{
                                    Text("\(model.date[i])")
                                    Spacer()
                                    Image((model.favWeather[city]?.data?.timelines![1].intervals![i].values?.status!)!)  .resizable()
                                        .frame(width: 30, height: 30)
                                    Spacer()
                                    Text("\((model.favWeather[city]?.data?.timelines![1].intervals![i].values?.sunriseformat!)!)")
                                    Spacer()
                                    Image("sun-rise") .resizable()
                                        .frame(width: 30, height: 30)
                                    Text("\((model.favWeather[city]?.data?.timelines![1].intervals![i].values?.sunsetformat!)!)")
                                    Spacer()
                                    Image("sun-set") .resizable()
                                        .frame(width: 30, height: 30)
                                }
                                
                                Divider()
                            }.padding(.horizontal)
                        
                    }
                }
                
            }.frame(minWidth: 0, maxWidth: 380, minHeight: 0, maxHeight: 200).foregroundColor(.black).background(.white)}
        }
    }
}


