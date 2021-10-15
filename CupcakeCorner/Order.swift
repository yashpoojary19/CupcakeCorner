//
//  Order.swift
//  CupCake
//
//  Created by Yash Poojary on 14/10/21.
//

import Foundation

class Order: ObservableObject {
    @Published var orderStruct = OrderStruct()
}

struct OrderStruct: Codable {
    static let types = ["Vanilla", "Chocolate", "Strawberry", "Rainbow"]
    
     var type = 0
     var quantity = 3
    
    
    var isSpecialRequestsOn = false
    
    var addSprinkles = false
    var addFrosting = false
    
    var name = ""
    var street = ""
    var city = ""
    var zip = ""
    
     mutating func checkIfEmpty() -> Bool {
         if name.isEmptyAndNoWhitspaces() || street.isEmptyAndNoWhitspaces() || city.isEmptyAndNoWhitspaces() || zip.isEmptyAndNoWhitspaces() {
            return true
        }
         
        return false
    }
    
    var cost: Double {
        var cost = Double(quantity) * 2
        
        cost += Double(type)
        
        
        if addSprinkles {
            cost += Double(quantity)
        }
        
        if addSprinkles {
            cost += Double(quantity) / 2
        }
        
        return cost
        
        
    }

    
    enum CodingKeys: CodingKey {
        case type, quantity, isSpecialRequestsOn, addSprinkles, addFrosting, name, street, city, zip
    }

    
}


extension String {
    mutating func isEmptyAndNoWhitspaces() -> Bool {
        
        if self.isEmpty {
            return true
        }
        
        return  self.trimmingCharacters(in: .whitespaces) == ""
    }
}
