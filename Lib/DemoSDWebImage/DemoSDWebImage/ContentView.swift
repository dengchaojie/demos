//
//  ContentView.swift
//  DemoSDWebImage
//
//  Created by hrt03 on 2019/11/14.
//  Copyright © 2019 dengchaojie. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

//Image.init("icon-1024")
struct ContentView: View {
    var body: some View {
//        Text("Hello World")
        WebImage.init(url:
            URL.init(string: "https://nokiatech.github.io/heif/content/images/ski_jump_1440x960.heic"))
            .onSuccess { image, cacheType in
                
                
        }
            
//        .resizable()
//        .placeholder(Image.init(systemName: "photo"))

//        .placeholder{
//            Rectangle().foregroundColor(.gray)
//        }
//        .indicator(.activity)
//        .transition(.fade)
//        .animation(.easeInOut(duration: 0.5))
//        .scaledToFit()
//        .frame(width: 300, height: 300, alignment: .center)
    
    
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
