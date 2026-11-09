//
//  PalindromeCheck.swift
//  InterviewPrep
//
//  Created by Elena Rubilova on 11/5/26.
//

import SwiftUI

struct PalindromeCheck: View {
    fileprivate func checkForPalindrome(_ s: String) -> Bool {
        let chars = Array(s.removingSpecialCharacters().lowercased())
        let n = chars.count
        
        if (n <= 1) {
            return true
        }
        for i in 0...(n-1)/2 {
            if chars[i] != chars[n-i-1] {
                return false
            }
        }
        return true
    }
    
    fileprivate func isPalindrome(_ s: String) -> Bool {
        let chars = Array(s)
        var i = 0
        var j = chars.count - 1
        while i < j {
            // 1. skip non-alphanumerics on the left
            while i < j && !(chars[i].isLetter || chars[i].isNumber) {
                i = i + 1
            }
            // 2. skip non-alphanumerics on the right
            while i < j && !(chars[j].isLetter || chars[j].isNumber) {
                j = j - 1
            }
            // 3. compare lowercased; return false if different
            if chars[i].lowercased() != chars[j].lowercased() {
                return false
            }
            // 4. move both pointers
            i = i + 1
            j = j - 1
        }
        return true
    }
    
    var body: some View {
        Text(checkForPalindrome("racecar") ? "Yes" : "No")
        Text(isPalindrome("A man, a plan, a canal: Panama") ? "Yes" : "No")
    }
}

#Preview {
    PalindromeCheck()
}

extension String {
    func removingSpecialCharacters() -> String {
        return String(unicodeScalars.filter { CharacterSet.alphanumerics.contains($0) })
    }
}
