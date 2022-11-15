




import SwiftUI





struct CircularButtonStyle: ButtonStyle {
    let buttonColor: Color
    let geometry: GeometryProxy
    
    func makeBody(configuration: Configuration) -> some View {
        return configuration
            .label
            .padding()
            .frame(maxWidth: geometry.size.width / 4.5, maxHeight: geometry.size.width / 4.5)
            .background {
                ZStack {
                    Circle()
                        .fill(configuration.isPressed ? buttonColor.opacity(0.75): buttonColor)
                    Circle()
                        .stroke(Color.white, lineWidth: 3)
                        .frame(maxWidth: geometry.size.width / 3, maxHeight: geometry.size.width / 3)
                        .padding(5)
                }
            }
            .foregroundColor(Color.white)
    }
}





