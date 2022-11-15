




import SwiftUI
import Combine





struct ClockView: View {
    @ObservedObject var viewModel: ViewModel = ViewModel()
    @State var time: Time = Time(hour: 0, minute: 0, second: 0)
    @State var date: Date = Date()
    var body: some View { GeometryReader { geometry in clockView(geometry) } }
}





extension ClockView {
    
    // MARK: clockView
    private func clockView(_ geometry: GeometryProxy) -> some View {
        return VStack {
            
            Text("Richfield, MN")
                .font(Font.system(size: geometry.size.width / 10, weight: Font.Weight.bold, design: Font.Design.rounded))
                .padding(Edge.Set.top)
            
            clockFace(geometry)
            
            Text(timeFormatter.string(from: date))
                .font(Font.system(size: geometry.size.width / 10, weight: Font.Weight.bold, design: Font.Design.rounded))
            Text(dateFormatter.string(from: date))
                .font(Font.system(size: geometry.size.width / 18, weight: Font.Weight.light, design: Font.Design.rounded))
                .foregroundColor(Color.secondary)
        }
        .onReceive(viewModel.timer) { date in
            setupTime(date)
        }
    }
    // MARK: clockView
    
    // MARK: setupTime
    private func setupTime(_ date: Publishers.Autoconnect<Timer.TimerPublisher>.Output) {
        let calender: Calendar = Calendar.current
        let _time: Time = Time(
            hour: calender.component(Calendar.Component.hour, from: date),
            minute: calender.component(Calendar.Component.minute, from: date),
            second: calender.component(Calendar.Component.second, from: date))
        time = _time
        self.date = date
    }
    // MARK: setupTime
    
    // MARK: clockface
    private func clockFace(_ geometry: GeometryProxy) -> some View {
        return ZStack {
            
            Circle()
                .stroke(Color.black, lineWidth: 5)
                .padding()
                .padding()
            
            
            MinuteMarker(geometry: geometry)
            HourMarker(geometry: geometry)
            
            HourPointer(geometry: geometry)
                .rotationEffect(Angle(degrees: Double(time.hour * 30)))
            MinutePointer(geometry: geometry)
                .rotationEffect(Angle(degrees: Double(time.minute * 6)))
            SecondPointer(geometry: geometry)
                .rotationEffect(Angle(degrees: Double(time.second * 6)))
            CenterCircle(geometry: geometry)
        }
        .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.width)
    }
    // MARK: clockface
    
    
    // MARK: dateFormatter
    private var dateFormatter: DateFormatter {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    }
    // MARK: dateFormatter
    
    
    // MARK: timeFormatter
    private var timeFormatter: DateFormatter {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss a"
        return formatter
    }
    // MARK: timeFormatter
    
}






extension ClockView {
    class ViewModel: ObservableObject {
        @Published var timer: Publishers.Autoconnect<Timer.TimerPublisher> = Timer.TimerPublisher(interval: 1, runLoop: RunLoop.main, mode: RunLoop.Mode.common)
            .autoconnect()
    }
    
    struct Time {
        let hour, minute, second: Int
    }
}





struct ClockView_Previews: PreviewProvider {
    static var previews: some View { ClockView() }
}





