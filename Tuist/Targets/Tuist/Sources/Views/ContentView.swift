//
//  ContentView.swift
//  Tuist
//
//  Created by Park Jungwoo on 2023/02/02.
//  Copyright © 2023 tuist.io. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Tuist Test")
            Image(systemName: "hand.thumbsup")
            Text("첫번째 커밋입니다.")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
