//
//  ViewModelBase.swift
//  MoviesInfo
//
//  Created by Asadullah Behlim on 28/05/22.
//

import Foundation

enum LoadingState {
   case loading, success, failed, none
}

class ViewModelBase: ObservableObject {
    @Published var loadingState: LoadingState = .none
}
