//
//  LoginView.swift
//  SwiftUI-LoginView
//
//  Created by Максим on 16.04.2020.
//  Copyright © 2020 Максим. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @State private var isApp = false
    @State private var isLogin = true
    
    var backgroundGradient = LinearGradient(
        gradient: Gradient(colors: [Color.init(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)), Color.init(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
    
    var customTransition: AnyTransition {
        let transition = AnyTransition.move(edge: .bottom)
          .combined(with: .opacity)
        return transition
    }
    
    var body: some View {
        ZStack {
            backgroundGradient
            VStack {
                ZStack {
                    EmptyView()
                }
                Spacer()
                
                if isApp {
                    ZStack {
                        Color.white
                        VStack {
                            RoundedRectangle(cornerRadius: 100)
                                .fill(Color.init(#colorLiteral(red: 0.7803921569, green: 0.7803921569, blue: 0.8, alpha: 1)))
                                .frame(width: 60, height: 5, alignment: .center)
                                .padding()
                        
                                LoginPageView(isLogin: $isLogin)
                                    .animation(.spring())
                                    .transition(customTransition)
                        }
                    }
                    .animation(Animation.spring())
                    .transition(customTransition)
                    .frame(height: isLogin ? 530 : 650)
                    .cornerRadius(20)
                    .shadow(radius: 10)
                }
            }
        }
        .onAppear {
            self.isApp = true
        }
        .animation(Animation.spring())
        .edgesIgnoringSafeArea(.all)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
