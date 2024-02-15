// This file is based on SwiftDiff by Bastian Mueller. Licensed under the Apache License, Version 2.0.
// Source: https://github.com/turbolent/SwiftDiff
// Modified by Petr Kvasnikov on 03.02.2024: fixed issues related to 'Characters' and 'Substrings'.

import Foundation

extension String {

    subscript(range: Range<Int>) -> String {
        guard !range.isEmpty else {
            return ""
        }

        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        let endIndex = index(self.startIndex, offsetBy: range.upperBound - 1)
        return String(self[startIndex...endIndex])
    }

    func substring(to offset: Int) -> String {
        let index = self.index(startIndex,
                               offsetBy: max(offset, 0),
                               limitedBy: endIndex)
        return String(self[..<(index ?? endIndex)])
    }

    func substring(from offset: Int) -> String {
        let index = self.index(startIndex,
                               offsetBy: max(offset, 0),
                               limitedBy: endIndex)
        return String(self[(index ?? endIndex)...])
    }

    func substring(last count: Int) -> String {
        let index = self.index(endIndex,
                               offsetBy: min(-count, 0),
                               limitedBy: startIndex)
        return String(self[(index ?? startIndex)...])
    }

    func index(of: String, from: Int = 0) -> Int? {
        let startIndex = index(self.startIndex, offsetBy: from)

        guard let range = self.range(of: of,
                                     options: [],
                                     range: startIndex..<endIndex) else {
            return nil
        }

        return distance(from: self.startIndex,
                                   to: range.lowerBound)
    }
}
