//
//  GradientButton.swift
//
//  Created by Alexander Suhodolov on 12/05/2023.
//

import Foundation
import SwiftUI


public struct GradientButtonStyle: ButtonStyle {
    private let gradient: Gradient
    
    public init(gradient: Gradient) {
        self.gradient = gradient
    }
    
    public func makeBody(configuration: Self.Configuration) -> some View {
        GeometryReader { geometry in
            configuration.label
                .frame(height: geometry.size.height)
                .background(
                    LinearGradient(
                        gradient: gradient,
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .clipShape(Capsule())
        }
    }
}
