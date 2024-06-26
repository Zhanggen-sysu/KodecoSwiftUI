//
//  Chap8.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/8/29.
//

import SwiftUI

struct S1C8: View {
    let tasks = ["Task 1", "Task 2", "Task 3", "Task 4", "Task 5"]

    var body: some View {
        List(tasks, id: \.self) { task in
          Text(task)
        }
    }
}

struct S1C8_Previews: PreviewProvider {
    static var previews: some View {
        S1C8()
    }
}
