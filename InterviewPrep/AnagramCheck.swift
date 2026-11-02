//
//  AnagramCheck.swift
//  InterviewPrep
//
//  Created by Elena Rubilova on 11/2/26.
//
import SwiftUI

fileprivate func anagramCheck1(_ s: String, _ t: String) -> Bool {
    var isAnagram = true
    guard s.count == t.count else { return false }
    var array = Array(s)
    for char in t {
        if let index = array.firstIndex(of: char) {
            array.remove(at: index)
        } else {
            isAnagram = false
            break
        }
    }
    return isAnagram
}

fileprivate func anagramCheck2(_ s: String, _ t: String) -> Bool {
    guard s.count == t.count else { return false }
    let arrayS = s.sorted()
    let arrayT = t.sorted()
    return arrayS == arrayT
}

fileprivate func isAnagram(_ s: String, _ t: String) -> Bool {
    guard s.count == t.count else { return false }
    return s.sorted() == t.sorted()
}

struct AnagramCheck: View {
    
    var s = "listen"
    var t = "silent"

    var s1 = "aab"
    var t1 = "abb"
    
    var body: some View {
        VStack {
            Text(verbatim: String(anagramCheck1("listen", "silent")))
            Text(verbatim: String(anagramCheck2(s1, t1)))
        }
    }
}

#Preview {
    AnagramCheck()
}

