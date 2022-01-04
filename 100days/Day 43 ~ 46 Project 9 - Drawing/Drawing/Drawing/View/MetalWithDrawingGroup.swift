//
//  MetalWithDrawingGroup.swift
//  Drawing
//
//  Created by Ryan J.W. Kim on 2021/10/15.
//

import SwiftUI

struct ColorCyclingCircle: View {
    var amount = 0.0
    var steps = 100

    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Circle()
                    .inset(by: CGFloat(value))
                    .strokeBorder(LinearGradient(gradient: Gradient(colors: [
                        self.color(for: value, brightness: 1),
                        self.color(for: value, brightness: 0.5)
                    ]), startPoint: .top, endPoint: .bottom), lineWidth: 2)
                // As we increase complexity it will struggle to run
                // So we need to use low-level metal
            }
        }
        .drawingGroup() //: enable metal
    }

    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(self.steps) + self.amount

        if targetHue > 1 {
            targetHue -= 1
        }

        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct MetalWithDrawingGroup: View {
    // MARK: - Properties
    @State private var colorCycle = 0.0
    
    // MARK: - Body
    var body: some View {
        VStack{
            ColorCyclingCircle(amount: self.colorCycle)
                .frame(width: 300, height: 300)
            
            Slider(value: $colorCycle)
        }
    }
}

struct MetalWithDrawingGroup_Previews: PreviewProvider {
    static var previews: some View {
        MetalWithDrawingGroup()
    }
}
