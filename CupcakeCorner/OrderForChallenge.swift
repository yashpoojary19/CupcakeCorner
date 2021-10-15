//
//  OrderForChallenge.swift
//  CupcakeCorner
//
//  Created by Yash Poojary on 14/10/21.
//

import Foundation



class MyOrder: ObservableObject {
    @Published var orderStruct = OrderStruct()
}


struct OrderStruct: Codable {
    
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
        var type = 0
        var quantity = 3
    
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
     var addSprinkles = false
    
     var name = ""
     var streetAddress = ""
     var city = ""
      var zip = ""
    
    var hasValidAddress: Bool {
        if name.isEmptyOrWhitespace() || streetAddress.isEmptyOrWhitespace() || city.isEmptyOrWhitespace() || zip.isEmptyOrWhitespace() {
            return true
        }
        
        return false
    }
    
    var cost: Double {
        var cost = Double(quantity) * 2
        cost += Double(type) / 2
        
        if extraFrosting {
            cost += Double(quantity)
        }
        
        if addSprinkles {
            cost += Double(quantity) / 2
        }
        
        return cost
    }
    
    
    enum CodingKeys: CodingKey {
        case type, quantity, extraFrosting, addSprinkles, name, streetAddress, city, zip
    }
    
    init() {
        
    }
   
    
}







