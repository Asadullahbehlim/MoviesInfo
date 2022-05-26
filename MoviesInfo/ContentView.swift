//
//  ContentView.swift
//  MoviesInfo
//
//  Created by Asadullah Behlim on 24/05/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear {
                HTTPClient().getMoviesBy(search: "Batman") {
                    Result in
                    switch Result {
                    case.success(let movies) :
                        print(movies!)
                    case.failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
