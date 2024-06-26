//
//  S8C2.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/8/30.
//

import SwiftUI

struct S8C2C3C4C5C6C7C8: View {
    let options = ["Frida Kahlo", "Georgia O'Keeffe", "Mary Cassatt", "Lee Krasner", "Helen Frankenthaler"]
    let segmentOptions = ["S1", "S2", "S3"]
    @State private var selectedSegment = 0
    @State private var selectedOption = 0
    @State private var isChecked: Bool = false
    @State private var quantity: Int = 1
    @State private var selectedDate = Date()
    @State private var value: Double = 0.5
    @State private var progressValue = 0.0
    
    var body: some View {
        VStack {
            Toggle(isOn: $isChecked) {
                Text("I agree to the terms and conditions")
            }
            .toggleStyle(CheckboxToggleStyle())
            .padding()
            
            Group {
                Text("How many packets of magic beans ?")
                Stepper(value: $quantity, in: 1...10) {
                    Text("\(quantity)")
                }
                .padding(.horizontal, 100)
            }
            
            HStack {
                Image(systemName: "paintpalette")
                    .foregroundColor(.blue)
                    .padding(.trailing, 4)
                Text("Favorite artist: ")
                    .font(.body)
                Text(options[selectedOption])
                    .font(.body)
                    .padding(.leading, 4)
            }
            .padding(.horizontal, 10)
            
            Picker("Options", selection: $selectedOption) {
                ForEach(options.indices, id: \.self) { index in
                    Text(options[index])
                        .font(.headline)
                }
            }
            .pickerStyle(.wheel)
            .padding(.horizontal, 10)
            
            DatePicker("Select a date", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(.compact)
                .padding()
            
            Group {
                Slider(value: $value, in: 0...1)
                Text("Value: \(value, specifier: "%.2f")")
            }
            
            Picker("Options", selection: $selectedSegment) {
                ForEach(segmentOptions.indices, id: \.self) { index in
                    Text(segmentOptions[index])
                }
            }
            .pickerStyle(.segmented)
            .padding(.horizontal, 10)
            
            Group {
                ProgressView(value: progressValue)
                    .padding()
                Button("Download") {
                    for i in 1...100 {
                        DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) / 10.0) {
                            progressValue = Double(i) / 100.0
                        }
                    }
                }.foregroundColor(.white)
                 .frame(width: 100, height: 25)
                 .background(.blue)
                 .clipShape(Capsule())
            }
        }
    }
}

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        // 自定义样式
        HStack {
            configuration.label
            Spacer()
            Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                .resizable()
                .frame(width: 24, height: 24)
                .onTapGesture {
                    configuration.isOn.toggle()
                }
        }
    }
}

struct S8C2C3C4C5C6C7C8_Previews: PreviewProvider {
    static var previews: some View {
        S8C2C3C4C5C6C7C8()
    }
}
