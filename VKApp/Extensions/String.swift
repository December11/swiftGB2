//
//  String.swift
//  VKApp
//
//  Created by 👩🏻‍🎨 📱 december11 on 04.01.2022.
//

import Foundation

extension String {
    
    func getWordsCount() -> Int {
        var temp = self.count > 0 ? 1 : 0
        for symbol in self {
            if symbol == " " {
                temp += 1
            }
        }
        return temp
    }

    func getAcronym() -> String? {
        guard
            self.getWordsCount() != 0
        else { return nil }
        
        var abbrevation = ""
        if self.getWordsCount() == 1 {
            abbrevation += self.prefix(1)
            return abbrevation
        } else {
            let temp = self.split(separator: " ")
            for substring in temp
            where abbrevation.count < 2 {
                abbrevation += substring.prefix(1)
            }
        }
        return abbrevation.uppercased()
    }
}
