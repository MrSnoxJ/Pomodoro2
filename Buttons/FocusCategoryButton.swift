//
//  FocusCategoryButton.swift
//  PomodoroTimer
//
//  Created by Yerasyl Sharipov on 02.12.2022.
//

import SwiftUI

struct FocusCategoryButton: View {
    // MARK: - Properties
    @State private var isShowing: Bool = false
    // MARK: - body
    var body: some View {
        Button(action: {
            
        }, label: {
            HStack(alignment: .center,spacing: 4, content:{
                
                Image(systemName: "pencil")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 12,height: 12)
                    .frame(width: 24,height: 24)
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.leading)
                    .padding(.top,6)
                    .padding(.bottom,6)
                
                Text("Focus Category")
                    .font(.custom("SF Pro Display", size: 16))
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .padding(.trailing)
                    .padding(.top,6)
                    .padding(.bottom,6)
                
                
            })
            .background(Color.gray.opacity(0.3))
            
        }).clipShape(Capsule())
        
        
    }
}


struct FocusCategoryButton_Previews: PreviewProvider {
    static var previews: some View {
        FocusCategoryButton()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
