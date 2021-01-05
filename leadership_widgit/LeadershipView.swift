//
//  LeadershipView.swift
//  leadership_widgit
//
//  Created by Yu Hong on 2020/12/14.
//

import SwiftUI

struct LeadershipView: View {
    
    let leadership : Leadership

    var body: some View {
        Text(leadership.score)
            .font(.title)
            .padding()
            .background(Color.white)
            .clipShape(Circle())
    }
}

