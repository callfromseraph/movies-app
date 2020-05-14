//
//  PluralForm.swift
//  movies-app
//
//  Created by David Petrosyan on 2/12/20.
//  Copyright © 2020 David Petrosyan. All rights reserved.
//

import Foundation

class PluralForm {
    
    var rules: [(rule: String, template: String)] = []
    
    static func pluralize(number: Int, forms: [String]) -> String {
        return number % 10 == 1 && number % 100 != 11 ? forms[0] :
            (number % 10 >= 2 && number % 10 <= 4 && (number % 100 < 10 || number % 100 >= 20) ? forms[1] : forms[2])
    }
    
    private class func regexReplace(input: String, pattern: String, template: String) -> String {
        let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        let range = NSRange(location: 0, length: input.count)
        let output = regex?.stringByReplacingMatches(in: input, options: [], range: range, withTemplate: template)
        return output ?? ""
    }
    
    public class func add(rule: String, with template: String) {
        self.add(rule: rule, with: template)
    }
    
    private func add(rule: String, with template: String) {
        rules.insert((rule: rule, template: template), at: 0)
    }
    
    public class func apply(word: String) -> String {

        for pair in sharedInstance.rules {
            let newValue = regexReplace(input: word, pattern: pair.rule, template: pair.template)
            if newValue != word {
                return newValue
            }
        }

        return word
    }
    
    class var sharedInstance: PluralForm {
        return PluralForm()
    }
}

extension String {
    public func pluralize(count: Int = 2, with: String = "") -> String {
        guard !(count == 1) else { return self }
        guard with.length != 0 else { return PluralForm.apply(word: self) }
        return with
    }

    // Workaround to allow us to use `count` as an argument name in pluralize() above.
    private var length: Int {
        return self.count
    }
}
