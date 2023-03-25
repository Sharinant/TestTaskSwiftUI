//
//  CoordinatorView.swift
//  TestTaskSwiftUI
//
//  Created by Антон Шарин on 22.03.2023.
//

import SwiftUI

struct CoordinatorView: View {
    
    @StateObject private var coordinator = AppCoordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.buildView(page: .signIn)
                .navigationDestination(for: Pages.self) { page in
                    coordinator.buildView(page: page)
                }
        }.environmentObject(coordinator)
    }
}

struct CoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        CoordinatorView()
    }
}
