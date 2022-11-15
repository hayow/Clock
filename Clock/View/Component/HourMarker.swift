




import SwiftUI





struct HourMarker: View {
    
    let geometry: GeometryProxy
    var body: some View {
        ZStack {
            ForEach(0..<12) { marker in
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.black, lineWidth: 3)
                        .frame(maxWidth: geometry.size.width / 40, maxHeight: geometry.size.width / 10)
                        .offset(y: geometry.frame(in: CoordinateSpace.global).midX / 1.5)
                }
                .rotationEffect(Angle(degrees: Double(marker * 30)))
            }
        }
    }
}





struct HourMarker_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader {
            geometry in HourMarker(geometry: geometry)
                .position(x: geometry.frame(in: CoordinateSpace.global).midX, y: geometry.frame(in: CoordinateSpace.global).midX)
        }
    }
}





