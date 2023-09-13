//
//  HeaxaShape.swift
//  SloatMachineIOS
//
//  Created by Bhavnesh Sharma on 12/09/23.
//

import SwiftUI

struct HeaxaShape: Shape {
    func path(in rect: CGRect) -> Path {
        let commanPoint = 20.0
        return Path {Path in
            let p1 = CGPoint(x: 0, y: commanPoint)
            let p2 = CGPoint(x: 0, y: rect.height - commanPoint)
            let p3 = CGPoint(x: rect.width/2, y: rect.height)
            let p4 = CGPoint(x: rect.width, y: rect.height - commanPoint)
            let p5 = CGPoint(x: rect.width, y: commanPoint)
            let p6 = CGPoint(x: rect.width/2, y: 0)
            
            Path .move(to: p6)
            
            Path.addArc(tangent1End: p1, tangent2End: p2, radius: 15)
            Path.addArc(tangent1End: p2, tangent2End: p3, radius: 15)
            Path.addArc(tangent1End: p3, tangent2End: p4, radius: 15)
            Path.addArc(tangent1End: p4, tangent2End: p5, radius: 15)
            Path.addArc(tangent1End: p5, tangent2End: p6, radius: 15)
            Path.addArc(tangent1End: p6, tangent2End: p1, radius: 15)
        }
    }
}

struct HeaxaShape_Previews: PreviewProvider {
    static var previews: some View {
        HeaxaShape()
            .frame(width: 100, height: 120, alignment: .center)
    }
}
