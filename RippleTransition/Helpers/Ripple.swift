//
//  Ripple.swift
//  RippleTransition
//
//  Created by harsh  on 27/02/25.
//

import SwiftUI

struct Ripple: View {
    var body: some View {
		//Ripple shape
		RoundedRectangle(cornerRadius: 20)
			.fill(.blue.gradient)
			.mask(alignment: .topLeading) {
				GeometryReader {
					let size = $0.size
					// Change as per your needs
					let circleSize: CGFloat = 50
					let circleRadius: CGFloat = circleSize / 2
					let fillCircleScale: CGFloat = max(size.width / circleRadius, size.height / circleRadius) + 4
					
					ZStack(alignment: .center) {
						Circle()
							.frame(width: circleSize, height: circleSize)
						Circle()
							.frame(width: circleSize + 10, height: circleSize + 10)
							.blur(radius: 3)
						Circle()
							.frame(width: circleSize + 20, height: circleSize + 20)
							.blur(radius: 7)
						Circle()
							.opacity(0.5)
							.frame(width: circleSize + 30, height: circleSize + 30)
							.blur(radius: 7)
					}
					.frame(width: circleSize, height: circleSize)
					.compositingGroup()
					.scaleEffect(fillCircleScale, anchor: .center)
				}
			}
    }
}

#Preview {
    Ripple()
}
