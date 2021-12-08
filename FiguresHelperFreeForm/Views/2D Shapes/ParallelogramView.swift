//
//  ParallelogramView.swift
//  FiguresHelperFreeForm
//
//  Created by Russell Gordon on 2021-12-04.
//

import SwiftUI

struct ParallelogramView: View {
    
    // MARK: Stored properties
    @State var providedBase = ""
    @State var providedHeight = ""
    @State var providedDiagonal = ""

    // MARK: Computed properties
    var b: Double? {
        guard let base = Double(providedBase),
              base > 0
        else {
            return nil
        }
        return base
    }
    
    var h: Double? {
        guard let height = Double(providedHeight),
              height > 0
        else {
            return nil
        }
        return height
    }
    
    var d: Double? {
        guard let diagonal = Double(providedDiagonal),
              diagonal > 0
        else {
            return nil
        }
        return diagonal
    }
    
    var area: Double? {
        guard let height = h, let base = b
        else {
            return nil
        }
        return base * height
    }
    
    var perimeter: Double? {
        guard let diagonal = d, let base = b
        else {
            return nil
        }
        return 2 * (diagonal + base)
    }
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading, spacing: 20) {
                
                DiagramView(image: "parallelogram",
                            horizontalPadding: 50)
                
                
                // Base
                Group {
                    
                    SectionLabelView(text: "Base", variable: "b")

                    // Input
                    TextField("Base", text: $providedBase, prompt: Text("Numeric value greater than 0"))
                        .foregroundColor(b == nil ? Color.red : Color.primary)
                    
                    // Output
                }
                
                // Height
                Group {
                    
                    SectionLabelView(text: "Height", variable: "h")

                    // Input
                    TextField("Height", text: $providedHeight, prompt: Text("Numeric value greater than 0"))
                        .foregroundColor(h == nil ? Color.red : Color.primary)
                    
                    // Output
                }

                // Diagonal
                Group {
                    
                    SectionLabelView(text: "Diagonal", variable: "c")

                    // Input
                    TextField("Diagonal", text: $providedDiagonal, prompt: Text("Numeric value greater than 0"))
                        .foregroundColor(d == nil ? Color.red : Color.primary)
                    // Output
                }

                SectionLabelView(text: "Area", variable: "a")
                
                // Output: Area
                OutputValueView(value: area, suffix: "square units")
                
                SectionLabelView(text: "Perimeter", variable: "p")
                
                // Output: Perimeter
                OutputValueView(value: perimeter, suffix: "units")
                
            }
            
        }
        .navigationTitle("Parallelogram")
        .padding()
    }
}

struct ParallelogramView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ParallelogramView()
        }
    }
}
