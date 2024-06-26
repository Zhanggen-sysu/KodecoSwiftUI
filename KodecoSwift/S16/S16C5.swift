//
//  S16C5.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/9/18.
//

import SwiftUI
import AVFoundation
import Photos

struct CameraPreview: UIViewRepresentable {
    @Binding var session: AVCaptureSession
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        let previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer)
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        if let layer = uiView.layer.sublayers?.first as? AVCaptureVideoPreviewLayer {
            layer.session = session
            layer.frame = uiView.bounds
        }
    }
}

class Recorder: NSObject, AVCaptureFileOutputRecordingDelegate, ObservableObject {
    @Published var session = AVCaptureSession()
    @Published var isRecording = false
    private let movieOutput = AVCaptureMovieFileOutput()
    
    override init() {
        super.init()
        
    }
    
    private func addAudioInput() {
        guard let device = AVCaptureDevice.default(for: .audio) else {
            return
        }
        guard let input = try? AVCaptureDeviceInput(device: device) else {
            return
        }
        if session.canAddInput(input) {
            session.addInput(input)
        }
    }
    
    private func addVideoInput() {
        guard let device = AVCaptureDevice.default(for: .video) else {
            return
        }
        guard let input = try? AVCaptureDeviceInput(device: device) else {
            return
        }
        if session.canAddInput(input) {
            session.addInput(input)
        }
    }
    
    func startRecording() {
        guard let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("video.mp4") else {
            return
        }
        if movieOutput.isRecording == false {
            if FileManager.default.fileExists(atPath: url.path) {
                try? FileManager.default.removeItem(at: url)
            }
            movieOutput.startRecording(to: url, recordingDelegate: self)
            isRecording = true
        }
    }
    
    func stopRecording() {
        if movieOutput.isRecording {
            movieOutput.stopRecording()
            isRecording = false
        }
    }
    
    func fileOutput(_ output: AVCaptureFileOutput, didStartRecordingTo fileURL: URL, from connections: [AVCaptureConnection]) {
        
    }
    
    func fileOutput(_ output: AVCaptureFileOutput, didFinishRecordingTo outputFileURL: URL, from connections: [AVCaptureConnection], error: Error?) {
        if let error = error {
            print("Error recording: \(error.localizedDescription)")
            return
        }
        
        PHPhotoLibrary.shared().performChanges({
            PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: outputFileURL)
        }) { saved, error in
            if saved {
                print("Successfully saved video to Photos.")
            } else if let error = error {
                print("Error saving video to Photos: \(error.localizedDescription)")
            }
            
        }
    }
}


// 录制音视频
struct S16C5: View {
    
    @StateObject private var recorder = Recorder()
    
    var body: some View {
        VStack {
            CameraPreview(session: $recorder.session).frame(height: 400)
            HStack {
                Button {
                    recorder.startRecording()
                } label: {
                    Text("Start Recording")
                        .padding()
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .disabled(recorder.isRecording)
                
                Button {
                    recorder.stopRecording()
                } label: {
                    Text("Stop Recording")
                        .padding()
                        .background(.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                if recorder.isRecording {
                    Text("Recording...")
                        .foregroundColor(.red)
                }
            }
        }
    }
}

struct S16C5_Previews: PreviewProvider {
    static var previews: some View {
        S16C5()
    }
}
