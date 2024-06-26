//
//  S13C1.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/9/14.
//

import SwiftUI

struct S13C1C2C3C4: View {
    @State private var countdown = 10
    @State private var position = CGPoint(x: 100, y: 100)
    @State private var items = ["Item1","Item2","Item2","Item2","Item5"]
    var body: some View {
        VStack {
            Image(systemName: "arrowtriangle.up.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundStyle(.orange.gradient)
                // 检测点击手势
                .onTapGesture {
                    if self.countdown > 0 {
                        self.countdown -= 1
                    }
                }
                // 检测长按手势
                .onLongPressGesture {
                    self.countdown += 2
                }
            Text("\(countdown) until launch")
                .padding()
            
            Circle()
                .fill(.blue)
                .frame(width: 50, height: 50)
                .position(position)
                .gesture(
                    // 拖动手势
                    DragGesture()
                        .onChanged({ gesture in
                            self.position = gesture.location
                        })
                )
            
            List {
                ForEach(items, id: \.self) { item in
                    Text(item)
                }
                // 滑动删除
                .onDelete(perform: deleteItem)
            }
        }

    }
    
    private func deleteItem(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}

struct S13C1C2C3C4_Previews: PreviewProvider {
    static var previews: some View {
        S13C1C2C3C4()
    }
}
