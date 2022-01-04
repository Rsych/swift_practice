//
//  AnimatingWithAnimatableData.swift
//  Drawing
//
//  Created by Ryan J.W. Kim on 2021/10/17.
//

import SwiftUI
struct Trapezoid: Shape {
    var insetAmount: CGFloat
    
    var animatableData: CGFloat {
        get { insetAmount }
        set { self.insetAmount = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        
        return path
    }
}

struct AnimatingWithAnimatableData: View {
    // MARK: - Properties
    @State private var insetAmount: CGFloat = 50
    
    
    // MARK: - Body
    var body: some View {
        Trapezoid(insetAmount: insetAmount)
            .frame(width: 200, height: 100)
            .onTapGesture {
                withAnimation {
                    self.insetAmount = CGFloat.random(in: 10...90)
                }
            }
    }
}

struct AnimatingWithAnimatableData_Previews: PreviewProvider {
    static var previews: some View {
        AnimatingWithAnimatableData()
    }
}
