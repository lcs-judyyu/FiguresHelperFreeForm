//
//  SphereView.swift
//  FiguresHelperFreeForm
//
//  Created by Russell Gordon on 2021-12-04.
//

import SwiftUI

struct SphereView: View {
    
    // MARK: Stored properties
    @State var providedRadius = ""
    
    // MARK: Computed properties
    var radius: Double? {
        guard let radius = Double(providedRadius),
              radius > 0
        else {
            //when the tests are failed (no valid radius
            return nil
        }
        //radius is valid
        return radius
    }
    
    var surfaceArea: Double? {
        guard let radius = radius
        else {
            return nil
        }
        return 4 * Double.pi * radius * radius
    }
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading, spacing: 20) {
                
                DiagramView(image: "sphere",
                            horizontalPadding: 50)
                
                SectionLabelView(text: "Radius", variable: "r")

                // Input: Radius
                TextField("Radius", text: $providedRadius, prompt: Text("Numeric value greater than 0"))
                    .foregroundColor(radius == nil ? Color.red : Color.primary)
                
                // Output: Radius
                
                SectionLabelView(text: "Surface Area", variable: "")
                
                // Output: Area
                OutputValueView(value: surfaceArea, suffix: "squared units")
                
            }
            
        }
        .navigationTitle("Sphere")
        .padding()
    }
}

struct SphereView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SphereView()
        }
    }
}
