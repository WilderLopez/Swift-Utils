//
//  LogoVersionPictureView.swift
//  
//
//  Created by Wilder López on 8/22/23.
//

import SwiftUI

@available(iOS 13.0, macOS 10.15, *)
struct LogoVersionPictureView: View {
    let imageName: String
    var body: some View {
        VStack{
            Image(imageName)
                .resizable()
                .frame(width: 150, height: 150, alignment: .center)
                
            Text("Version \(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0")")
                .font(Font.system(size: 30))
        }
    }
}

@available(iOS 13.0, macOS 10.15, *)
struct LogoVersionPictureView_Previews: PreviewProvider {
    static var previews: some View {
        LogoVersionPictureView(imageName: "")
    }
}
