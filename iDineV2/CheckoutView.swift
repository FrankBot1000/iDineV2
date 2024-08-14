//
//  CheckoutView.swift
//  iDineV2
//
//  Created by Super Grover on 2024-08-14.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    @State private var paymentType          = "Cash"
    @State private var addLoyaltyDetails    = false
    @State private var loyaltyNumber        = ""
    @State private var tipAmount            = 15
    @State private var showingPaymentAlert  = false
    @State private var myPickUpTime: PickUpTime = .now
    
    let paymentTypes    = ["Cash", "Credit Card", "iDine Points"]
    let tipAmounts      = [10, 15, 20, 25, 0]
    
    enum PickUpTime: Int, CaseIterable {
        case now, tonight, tomorrowMorning
        
        var name: String {
            switch self {
            case .now:
                return "Now"
            case .tonight:
                return "Tonight"
            case .tomorrowMorning:
                return "Tomorrow Morning"
            }
        }
    }
    
    var totalPrice: String {
        let total       = Double(order.total)
        let tipValue    = total / 100 * Double(tipAmount)
        return (total + tipValue).formatted(.currency(code: "USD"))
    }
    
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(paymentTypes, id:  \.self) {
                        Text($0)
                    }
                }
                
                Toggle("Add iDine loyalty card", isOn: $addLoyaltyDetails.animation())
                
                if addLoyaltyDetails {
                    TextField("Enter your iDine ID", text: $loyaltyNumber)
                }
            }
            
            Section("Add a tip?") {
                Picker("Percentage:", selection: $tipAmount) {
                    ForEach(tipAmounts, id: \.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section("Pick up Time") {
                Picker("When to Pick Up", selection: $myPickUpTime) {
                    ForEach(PickUpTime.allCases, id: \.self) {
                        Text("\($0.name)")
                    }
                }
            }
            
            Section("Total: \(totalPrice)") {
                Button("Confirm order") {
                    showingPaymentAlert.toggle()
                }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Order confirmed", isPresented: $showingPaymentAlert) {
            // Add buttons here
        } message: {
            Text("Your total was \(totalPrice) - thank you!\nPick UP Time: \(myPickUpTime.name)")
        }
    }
}

#Preview {
    CheckoutView()
        .environmentObject(Order())
}
