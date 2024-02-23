//
//  PauseButton.swift
//  PomodoroTimer
//
//  Created by Yerasyl Sharipov on 03.12.2022.
//

import SwiftUI
struct PauseButton: View {
    // MARK: - Properties
    @State var start = false
    @State var to : CGFloat = 0
    @State var count = 0
    @State var time = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var nowDate = Date()
    var futureDate = Date.distantFuture
    
    // MARK: - body
    var body: some View {
        Home()
    }
}
// MARK: - Preview
struct PauseButton_Previews: PreviewProvider {
    static var previews: some View {
        PauseButton()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
struct Home : View {
    
    @State var start = false
    @State var to : CGFloat = 0
    @State var count = 0
    @State var time = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View{
        
        ZStack{
            
            VStack{
                ZStack{
                    Circle()
                        .trim(from: 0, to: 1)
                        .stroke(Color.gray.opacity(0.3), style: StrokeStyle(lineWidth: 6, lineCap: .round))
                        .frame(width: 248, height: 248)
                    
                    Circle()
                        .trim(from: 0, to: self.to)
                        .stroke(Color.white, style: StrokeStyle(lineWidth: 6, lineCap: .round))
                        .frame(width: 248, height: 248)
                        .rotationEffect(.init(degrees: -90))
                    VStack{
                        
                        Text("\(self.count)")
                            .font(.system(size: 65))
                            .fontWeight(.bold)
                        
                        Text("Of 15")
                            .font(.title)
                            .padding(.top)
                    }
                }
                
                HStack(spacing: 20){
                    Button(action: {
                        
                        if self.count == 15{
                            
                            self.count = 0
                            withAnimation(.default){
                                
                                self.to = 0
                            }
                        }
                        self.start.toggle()
                        
                    }) {
                        
                        HStack(spacing: 15){
                            
                            Image(systemName: self.start ? "pause.fill" : "play.fill")
                                .foregroundColor(.white)
                            
                            Text(self.start ? "Pause" : "Play")
                                .foregroundColor(.white)
                        }
                        .padding(.vertical)
                        .frame(width: (UIScreen.main.bounds.width / 2) - 55)
                        .background(Color.red)
                        .clipShape(Capsule())
                        .shadow(radius: 6)
                    }
                    
                    Button(action: {
                        
                        self.count = 0
                        
                        withAnimation(.default){
                            
                            self.to = 0
                        }
                        
                    }) {
                        
                        HStack(spacing: 15){
                            
                            Image(systemName: "arrow.clockwise")
                                .foregroundColor(.red)
                            
                            Text("Restart")
                                .foregroundColor(.red)
                            
                        }
                        .padding(.vertical)
                        .frame(width: (UIScreen.main.bounds.width / 2) - 55)
                        .background(
                            
                            Capsule()
                                .stroke(Color.red, lineWidth: 2)
                        )
                        .shadow(radius: 6)
                    }
                }
                .padding(.top, 55)
            }
            
        }
        .frame(width: 506,height: 900)
        .ignoresSafeArea(.all)
        
        
        .onAppear(perform: {
            
            UNUserNotificationCenter.current().requestAuthorization(options: [.badge,.sound,.alert]) { (_, _) in
            }
        })
        .onReceive(self.time) { (_) in
            
            if self.start{
                
                if self.count != 15{
                    
                    self.count += 1
                    print("hello")
                    
                    withAnimation(.default){
                        
                        self.to = CGFloat(self.count) / 15
                    }
                }
                else{
                    
                    self.start.toggle()
                    self.Notify()
                }
                
            }
            
        }
    }
    
    func Notify(){
        
        let content = UNMutableNotificationContent()
        content.title = "Message"
        content.body = "Timer Is Completed Successfully In Background !!!"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        
        let req = UNNotificationRequest(identifier: "MSG", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(req, withCompletionHandler: nil)
    }
}
