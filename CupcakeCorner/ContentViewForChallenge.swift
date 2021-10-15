//
//  ContentView.swift
//  Project10
//
//  Created by Paul Hudson on 17/02/2020.
//  Copyright © 2020 Paul Hudson. All rights reserved.
//

import SwiftUI

struct ContentView1: View {
    @ObservedObject var order = MyOrder()

    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.orderStruct.type) {
                        ForEach(0..<OrderStruct.types.count, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }

                    Stepper(value: $order.orderStruct.quantity, in: 3...20) {
                        Text("Number of cakes: \(order.quantity)")
                    }
                }

                Section {
                    Toggle(isOn: $order.orderStruct.specialRequestEnabled.animation()) {
                        Text("Any special requests?")
                    }

                    if order.orderStruct.specialRequestEnabled {
                        Toggle(isOn: $order.orderStruct.extraFrosting) {
                            Text("Add extra frosting")
                        }

                        Toggle(isOn: $order.orderStruct.addSprinkles) {
                            Text("Add extra sprinkles")
                        }
                    }
                }

                Section {
                    NavigationLink(destination: AddressView(order: order.MyOrder)) {
                        Text("Delivery details")
                    }
                }
            }
            .navigationBarTitle("Cupcake Corner")
        }
    }
}

struct ContentView1_Previews: PreviewProvider {
    static var previews: some View {
        ContentView1()
    }
}
