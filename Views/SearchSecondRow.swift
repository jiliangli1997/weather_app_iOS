//
//  SearchSecondRow.swift
//  571hw9v2
//
//  Created by Jiliang Li on 12/8/21.
//

import SwiftUI

struct SearchSecondRow: View {
    @EnvironmentObject var model: ContentModel

    var body: some View {
        ZStack{
            HStack{
                Spacer()
                VStack{
                    Text("Humidity").font(.footnote)
                    Image("Humidity").resizable()
                        .frame(width: 40, height: 40)

                    Text("\(String(format: "%.1f", (model.weathers?.data?.timelines![2].intervals![0].values?.humidity!)!))") + Text(" %")
                        
                }.padding()
                VStack{
                    Text("Wind Speed").font(.footnote)
                    Image("WindSpeed").resizable()
                        .frame(width: 40, height: 40)
                    
                    Text("\(String(format: "%.2f", (model.weathers?.data?.timelines![2].intervals![0].values?.windSpeed!)!))") + Text(" mph")
                }.padding()
                VStack{
                    Text("Visibility").font(.footnote)
                    Image("Visibility").resizable()
                        .frame(width: 40, height: 40)
                    
                    Text("\(String(format: "%.2f", (model.weathers?.data?.timelines![2].intervals![0].values?.visibility!)!))") + Text(" mi")
                }.padding()
                VStack{
                    Text("Pressure").font(.footnote)
                    Image("Pressure").resizable()
                        .frame(width: 40, height: 40)
                    Text("\(String(format: "%.2f", (model.weathers?.data?.timelines![2].intervals![0].values?.pressureSeaLevel!)!))") + Text(" inHg")
                    
                }.padding()
                Spacer()
            }
        }
    }
}

