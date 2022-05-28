//
//  String+Extension.swift
//  MoviesInfo
//
//  Created by Asadullah Behlim on 28/05/22.
//

import Foundation

extension String {
    func trimmedAndEscaped() -> String {
        
        let trimmedString = self.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmedString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
}





