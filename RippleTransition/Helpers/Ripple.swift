//
//  Ripple.swift
//  RippleTransition
//
//  Created by harsh  on 27/02/25.
//

import SwiftUI

extension AnyTransition {
	static func ripple(location: CGPoint) -> AnyTransition {
		.modifier(
			active: Ripple(location: location, isIdentity: false),
			identity: Ripple(location: location, isIdentity: true)
		)
	}
}
	
fileprivate struct Ripple: ViewModifier {
	var location: CGPoint
	var isIdentity: Bool
	func body(content: Content) -> some View {
		content
			.mask(alignment: .topLeading) {
				MaskShape()
					.ignoresSafeArea()
			}
	}
	
	private func MaskShape() -> some View {
		GeometryReader {
			let size = $0.size
			let progress: CGFloat = isIdentity ? 1 : 0
				// Change as per your needs
			let circleSize: CGFloat = 50
			let circleRadius: CGFloat = circleSize / 2
			let fillCircleScale: CGFloat = max(size.width / circleRadius, size.height / circleRadius) + 4
			
			let defaultScale: CGFloat = isIdentity ? 1 : 0
			
			
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
			.scaleEffect(defaultScale + (fillCircleScale * progress), anchor: .center)
			.offset(x: location.x - circleRadius, y: location.y - circleRadius)
		}
	}
}


