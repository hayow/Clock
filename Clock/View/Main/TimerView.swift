




import SwiftUI





struct TimerView: View {
    @StateObject var viewModel: ViewModel = ViewModel()
    var body: some View {
        
        GeometryReader { geometry in timerView(geometry) }
        
    }
}





extension TimerView {
    
    // MARK: buttonsSection
    private func buttonsSection(_ geometry: GeometryProxy) -> some View {
        return HStack {
            Button {
                viewModel.timerIsActive.toggle()
            } label: {
                Text("cancel")
            }
            .buttonStyle(CircularButtonStyle(buttonColor: Color.red, geometry: geometry))
            .disabled(!viewModel.timerIsActive)
            .opacity(!viewModel.timerIsActive ? 0.50: 1)
            
            Spacer()
            
            Button {
                viewModel.timerIsActive.toggle()
            } label: {
                Text("reset")
            }
            .buttonStyle(CircularButtonStyle(buttonColor: Color.orange, geometry: geometry))
            .disabled(viewModel.timerIsActive)
            .opacity(viewModel.timerIsActive ? 0.50: 1)
            
            Spacer()
            
            Button {
                viewModel.timerIsActive.toggle()
            } label: {
                Text("start")
            }
            .buttonStyle(CircularButtonStyle(buttonColor: Color.green, geometry: geometry))
            .disabled(viewModel.timerIsActive)
            .opacity(viewModel.timerIsActive ? 0.50: 1)
        }
        .padding()
    }
    // MARK: buttonsSection
    
    
    // MARK: pickersSection
    private func pickersSection(_ geometry: GeometryProxy) -> some View {
        return HStack {
            Picker(selection: .constant(0)) {
                ForEach(0..<25) { hour in
                    HStack {
                        Text("\(hour)")
                            .fontWeight(Font.Weight.bold)
                        Text("h")
                            .fontWeight(Font.Weight.light)
                            .foregroundColor(Color.secondary)
                    }
                    .tag(hour)
                }
            } label: {
                
            }
            .pickerStyle(WheelPickerStyle())
            Divider()
            
            Picker(selection: .constant(0)) {
                ForEach(0..<60) { minute in
                    HStack {
                        Text("\(minute)")
                            .fontWeight(Font.Weight.bold)
                        Text("m")
                            .fontWeight(Font.Weight.light)
                            .foregroundColor(Color.secondary)
                    }
                    .tag(minute)
                }
            } label: {
                
            }
            .pickerStyle(WheelPickerStyle())
            Divider()
            
            Picker(selection: .constant(0)) {
                ForEach(0..<50) { second in
                    HStack {
                        Text("\(second)")
                            .fontWeight(Font.Weight.bold)
                        Text("m")
                            .fontWeight(Font.Weight.light)
                            .foregroundColor(Color.secondary)
                    }
                    .tag(second)
                }
            } label: {
                
            }
            .pickerStyle(WheelPickerStyle())
        }
        .frame(maxHeight: geometry.size.width / 2)
        .padding()
    }
    // MARK: pickersSection
    
    
    // MARK: timerView
    private func timerView(_ geometry: GeometryProxy) -> some View {
        return VStack {
            Spacer()
            if viewModel.timerIsActive == false {
                VStack {
                    Text("SET TIMER")
                        .font(Font.largeTitle)
                    Text("00: 00: 00")
                        .font(Font.system(size: geometry.size.width / 7, design: Font.Design.rounded))
                        .fontWeight(Font.Weight.bold)
                }
                Divider()
                    .padding()
            }
            if viewModel.timerIsActive {
                Text("00: 00: 00")
                    .font(Font.system(size: geometry.size.width / 7, design: Font.Design.rounded))
                    .fontWeight(Font.Weight.bold)
                Spacer()
            } else {
                pickersSection(geometry)
            }
            Divider()
                .padding()
            buttonsSection(geometry)
            
            Spacer()
        }
    }
    // MARK: timerView
    
    
}





extension TimerView {
    class ViewModel: ObservableObject {
        @Published var timerIsActive: Bool = false
    }
}





struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}





