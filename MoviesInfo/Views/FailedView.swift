//
//  FailedView.swift
//  MoviesInfo
//
//  Created by Asadullah Behlim on 28/05/22.
//

import SwiftUI

struct FailedView: View {
    var body: some View {
        Image("oops")
            .resizable()
            .scaledToFit()
          //  .frame(width: <#T##CGFloat?#>, height: <#T##CGFloat?#>, alignment: <#T##Alignment#>)
    }
}

struct FailedView_Previews: PreviewProvider {
    static var previews: some View {
        FailedView()
    }
}
