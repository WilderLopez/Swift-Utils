//
//  BottomCustomAlerts.swift
//  SafeLinks
//
//  Created by Wilder López on 8/22/23.
//

import SwiftUI

///Usage of bottom alerts
struct UsageOfCustomAlerts: View {
    @State var showAlert = false
    var body: some View {
        HStack{
            Spacer()
            Button("Tap me") {
                showAlert = true
            }
            Spacer()
        }
        //MARK: Bottom Custom Alert ⭐️
        .bottomCustomAlert(text: "Hola mundo cruel", isPresented: $showAlert)
        
            
    }
}

struct UsageOfCustomAlerts_Previews: PreviewProvider {
    static var previews: some View {
        UsageOfCustomAlerts()    }
}

struct BottomCustomAlertModifier: ViewModifier {
    let alertText: String
    @Binding var isPresented : Bool
    let backgroundColor : Color
    let foregroundColor : Color
    let cornerRadius : CGFloat
    
    
    func body(content: Content) -> some View {
        content
            .overlay (
                Group {
                    if isPresented {
                        HStack{
                            Text(alertText)
                                .bold()
                                .multilineTextAlignment(.center)
                                .foregroundColor(foregroundColor)
                        }
                        .padding()
                            .background(backgroundColor)
                            .cornerRadius(cornerRadius)
                            .shadow(radius: 8)
                            .transition(.move(edge: .bottom))
                            .onAppear{
                                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
                                    dismissAlert()
                                }
                            }
                    }else {
                        EmptyView()
                    }
                }.animation(.easeIn(duration: 0.1), value: isPresented)
                    .offset(y: UIScreen.main.bounds.height/2 - 100)
                    .onTapGesture {
                        dismissAlert()
                    }
            )
    }
    
    internal func dismissAlert() {
        withAnimation(.easeOut(duration: 0.1)) {
            isPresented = false
        }
    }
}

extension View {
    func bottomCustomAlert(text: String, isPresented: Binding<Bool>, backgroundColor: Color = .accentColor, foregroundColor: Color = .white, cornerRadius: CGFloat = 10) -> some View {
        return self.modifier(BottomCustomAlertModifier(alertText: text, isPresented: isPresented, backgroundColor: backgroundColor, foregroundColor: foregroundColor, cornerRadius: cornerRadius))
    }
}
