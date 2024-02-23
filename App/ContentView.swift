//
//  ContentView.swift
//  PomodoroTimer
//
//  Created by Yerasyl Sharipov on 02.12.2022.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @State var start: Bool = false
    @State var to: CGFloat = 0
    @State var count: Int = 0
    @State var time = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    // MARK: - body
    var body: some View {
        ZStack(alignment: .center, content: {
            Image("BG")
                .resizable()
                .scaledToFit()
                .frame(width: 506,height: 900)
            ZStack(alignment: .center, content: {
                FocusCategoryButton()
                    .padding(.bottom,600)
            })
            VStack(spacing: 60,content: {
                
                ZStack(content: {
                    // MARK: - Circle1
                    Circle()
                        .trim(from: 0, to: 1)
                        .stroke(Color.gray.opacity(0.3),style: StrokeStyle(lineWidth: 6,lineCap: .round))
                        .frame(width: 248,height: 248)
                    
                    // MARK: - Circle2
                    Circle()
                        .trim(from: 0,to: self.to)
                        .stroke(Color.white,style: StrokeStyle(lineWidth: 6,lineCap: .round))
                        .frame(width: 248,height: 248)
                        .rotationEffect(.init(degrees: -90))
                    VStack(alignment: .center,spacing: 4, content: {
                        Text("\(self.count)")
                            .font(.custom("SF Pro Display", size: 44))
                            .frame(width: 200,height: 56)
                            .foregroundColor(.white)
                        Text("Of 15")
                            .font(.custom("SF Pro Display", size: 16))
                            .frame(width: 200,height: 24)
                            .foregroundColor(.white)
                    }) // MARK: - Vstack Text
                    
                }) // MARK: - Zstack
                HStack(alignment: .center,spacing: 80, content: {
                    Button(action: {
                        if self.count == 15{
                            self.count = 0
                            withAnimation(.default){
                                self.to = 0
                            }
                            
                        }
                        self.start.toggle()
                    }, label: {
                        ZStack(content: {
                            Circle()
                                .fill(Color.white.opacity(0.3))
                                .frame(width: 56,height: 56)
                            Image(systemName: self.start ? "pause.fill" : "play.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 16,height: 16)
                                .frame(width: 32,height: 32)
                                .foregroundColor(.white)
                        }) // MARK: - Zstack Circle + Image
                    }) // MARK: - Button1
                    Button(action: {
                        self.count = 0
                        withAnimation(.default){
                            self.to = 0
                        }
                    }, label: {
                        ZStack(content: {
                        Circle()
                            .fill(Color.white.opacity(0.3))
                            .frame(width: 56,height: 56)
                        Image(systemName: "stop.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16,height: 16)
                            .frame(width: 32,height: 32)
                            .foregroundColor(.white)
                    }) // MARK: - Zstack Circle + Image
                    }) // MARK: - Button2
                })// MARK: - Hstack Buttons
            }) // MARK: - Vsatck
        }) // MARK: - ZStack
        .frame(width: 506,height: 900)
        .ignoresSafeArea(.all,edges: .all)
        .onAppear(perform: {
            UNUserNotificationCenter.current().requestAuthorization(options: [.badge,.sound,.alert]) { (_, _) in
            }
        }) // MARK: - onAppear
        .onReceive(self.time) { (_) in
            if self.start{
                if self.count != 15{
                    self.count += 1
                    print("hello")
                    withAnimation(.default){
                        self.to = CGFloat(self.count) / 15.0
                    }
                }
                else{
                    self.start.toggle()
                    
                }
                
            }
            
        }// MARK: - OnReceive
        
    }

}
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
            // .previewLayout(.sizeThatFits)
                .padding()
        }
    }

