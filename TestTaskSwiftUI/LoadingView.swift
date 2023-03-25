//
//  Loading.swift
//  TestTaskSwiftUI
//
//  Created by Антон Шарин on 24.03.2023.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(.circular)
            
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
