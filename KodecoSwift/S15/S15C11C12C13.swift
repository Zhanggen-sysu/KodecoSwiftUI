//
//  S15C11.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/9/15.
//

import SwiftUI

enum MyError: LocalizedError {
    case someError
    
    var errorDescription: String? {
        switch self {
        case .someError:
            return "Something went wrong"
        }
    }
    
    var recoverySuggestion: String? {
        switch self {
        case .someError:
            return "Please try again"
        }
    }
}

struct S15C11C12C13: View {
    @State private var error: MyError? = nil
    @State private var showAlert = false
    @State private var isShowingDialog = false
    var body: some View {
        VStack {
            Button("Show Alert") {
                error = MyError.someError
                showAlert = true
            }
    //        .alert("This is an important Message", isPresented: $showAlert) {
            // 提示框
            .alert(isPresented: $showAlert, error: error) { _ in
                Button("OK") {
                    showAlert = false
                }
            } message: { error in
                Text(error.recoverySuggestion ?? "Try again later")
            }
            Button("Empty Trash") {
                isShowingDialog = true
            }
            // 底部弹窗选择栏
            .confirmationDialog(
                "Are you sure you want to empty the trash ?",
                isPresented: $isShowingDialog,
                titleVisibility: .visible
            ) {
                Button("Empty trash", role: .destructive) {
                    
                }
                Button("Cancel", role: .cancel) {
                    isShowingDialog = false
                }
            }
        }
    }
}

struct S15C11C12C13_Previews: PreviewProvider {
    static var previews: some View {
        S15C11C12C13()
    }
}
