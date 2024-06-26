//
//  S3C8.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/8/29.
//

import SwiftUI

class TaskManager: ObservableObject {
  @Published var tasks = [String]()

  func addTask(_ task: String) {
    tasks.append(task)
  }
}

struct TaskListView: View {
    @EnvironmentObject var taskManager: TaskManager
    @State private var newTask = ""

    var body: some View {
        NavigationStack {
            VStack {
                TextField("New task", text: $newTask).onSubmit {
                    if !newTask.isEmpty {
                        taskManager.addTask(newTask)
                        newTask = ""
                    }
                }
                .padding()
                List(taskManager.tasks, id: \.self) { task in
                    Text(task)
                }
            }
            .navigationTitle("Task List")
        }
    }
}

struct S3C8: View {
    @StateObject var taskManager = TaskManager()

    var body: some View {
        TaskListView()
            .environmentObject(taskManager)
    }
}

struct S3C8_Previews: PreviewProvider {
    static var previews: some View {
        S3C8()
    }
}
