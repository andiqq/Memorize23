//
//  FlyingNumber.swift
//  Memorize23
//
//  Created by Dr. Andreas Plagens on 26.04.25.
//

import SwiftUI

struct FlyingNumber: View {
    
    let number: Int
    
    var body: some View {
        if number != 0 {
            Text(number, format: .number)
        }
    }
}

#Preview {
    FlyingNumber(number: 5)
}
