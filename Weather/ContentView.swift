//
//  ContentView.swift
//  Weather
//
//  Created by irfan on 29/12/2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var weatherVM = WeatherViewModel()
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weatherVM.title)
                        .bold()
                        .font(.largeTitle)
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                                
                VStack {
                    HStack {
                        Text(weatherVM.temp)
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding()
                    }
                    
                    HStack {
                        Text(weatherVM.descriptionText)
                            .font(.system(size: 44))
                            .fontWeight(.light)
                            .padding()
                    }
                }
                .frame(maxWidth: .infinity)
                
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Spacer()
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather now")
                        .bold()
                        .padding(.bottom)
                    
                    HStack {
                        WeatherRow(logo: "thermometer", name: "Min temp", value: weatherVM.tempMin)
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "Max temp", value: weatherVM.tempMax)
                        Spacer()
                    }
                    
                    HStack {
                        WeatherRow(logo: "humidity", name: "Humidity", value: "\(weatherVM.humidity)")
                        Spacer()
                        WeatherRow(logo: "wind", name: "Wind speed", value: "\(weatherVM.windSpeed)")
                            .padding(.leading)
                        Spacer()
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(.black)
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(red: 233/255, green: 235/255, blue: 236/255))
        .preferredColorScheme(.light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
