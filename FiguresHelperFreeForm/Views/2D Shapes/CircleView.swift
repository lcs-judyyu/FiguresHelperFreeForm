//
//  CircleView.swift
//  FiguresHelperFreeForm
//
//  Created by Russell Gordon on 2021-12-04.
//

import SwiftUI

struct CircleView: View {
    
    // MARK: Stored properties
    @State var providedRadius = ""
    
    // MARK: Computed properties
    //check the given input and return DOuble if possible, if not, return nil
    var radius: Double? {
        // ensure that we can change the input to a Double
        // ensure that the Double value is more than 0
        // with a guard statement, welist things we wish to be true, and provide actions to carry out when they are not true
        guard let radius = Double(providedRadius),
              radius > 0
        else {
            //when the tests are failed (no valid radius
            return nil
        }
        //radius is valid
        return radius
    }
    
    var area: Double {
        
        guard let radius = radius,
        else {
     return nil
 }
        return Double.pi * radius * radius
    }
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading, spacing: 20) {
                
                DiagramView(image: "circle",
                            horizontalPadding: 50)
                
                SectionLabelView(text: "Radius", variable: "r")

                // Input: Radius
                TextField("Radius", text: $providedRadius, prompt: Text("Numeric value greater than 0"))
                
                // Output: Radius
                // SliderValueView(value: radius)
                
                SectionLabelView(text: "Area", variable: "")
                
                // Output: Area
                OutputValueView(value: area, suffix: "square units")
                
            }
            
        }
        .navigationTitle("Circle")
        .padding()
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CircleView()
        }
    }
}
