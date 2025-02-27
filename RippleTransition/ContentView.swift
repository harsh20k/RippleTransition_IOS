//
//  ContentView.swift
//  RippleTransition
//
//  Created by harsh  on 27/02/25.
//

import SwiftUI

struct ContentView: View {
	// View Properties
	@State private var count: Int = 0
	@State private var rippleLocation : CGPoint = .zero
	
    var body: some View {
		NavigationStack {
			VStack {
				GeometryReader {
					let size = $0.size
					ForEach(0...1, id: \.self) { index in
						if count == index {
							ImageView(index, size: size)
						}
					}
				}
				.frame(width: 350, height: 500)
				.coordinateSpace(name: "VIEW")
				.onTapGesture(count: 1, coordinateSpace: .named("VIEW")) { location in
					rippleLocation = location
					withAnimation(.linear(duration: 1)) {
						count = (count + 1) % 2
					}
				}
			}
			.navigationTitle("Ripple Transition")
		}
    }
	
	// Image View
	private func ImageView(_ index: Int, size: CGSize) -> some View {
		Image("pic\(index + 4)")
			.resizable()
			.aspectRatio(contentMode: .fill)
			.frame(width: size.width, height: size.height)
			.clipShape(.rect(cornerRadius: 30))
		
	}
}

#Preview {
    ContentView()
}
