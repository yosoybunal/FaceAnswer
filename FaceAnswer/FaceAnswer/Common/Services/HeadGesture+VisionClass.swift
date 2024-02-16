//
//  HeadGesture+VisionClass.swift
//  FaceAnswer
//
//  Created by Berkay Unal on 31.01.2024.
//

import UIKit
import AVFoundation
import Vision

class HeadGesture: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
  
  // Vision variables
  var sequenceHandler = VNSequenceRequestHandler()
  let faceDetectionRequest: VNDetectFaceRectanglesRequest = {
    let request = VNDetectFaceRectanglesRequest()
    return request
  }()
  
  // AVCapture variables
  let captureSession = AVCaptureSession()
  let videoOutput = AVCaptureVideoDataOutput()
  var previewLayer: AVCaptureVideoPreviewLayer?
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  func setupCamera() {
    guard let captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front) else { return }
    let deviceInput: AVCaptureDeviceInput
    
    do {
      deviceInput = try AVCaptureDeviceInput(device: captureDevice)
    } catch {
      print(error)
      return
    }
    
    if (captureSession.canAddInput(deviceInput)) {
      captureSession.addInput(deviceInput)
    } else {
      print("Failed to add AVCaptureDeviceInput to AVCaptureSession.")
      return
    }
    
    if (captureSession.canAddOutput(videoOutput)) {
      captureSession.addOutput(videoOutput)
      
      let videoQueue = DispatchQueue(label: "videoQueue")
      videoOutput.setSampleBufferDelegate(self, queue: videoQueue)
      videoOutput.alwaysDiscardsLateVideoFrames = true
    } else {
      print("Failed to add AVCaptureVideoDataOutput to AVCaptureSession.")
      return
    }
    
    previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
    previewLayer?.videoGravity = .resizeAspectFill
    previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
    previewLayer?.videoGravity = .resizeAspectFill
    
    let newWidth: CGFloat = 300.0
    let newHeight: CGFloat = 300.0
    previewLayer?.frame = CGRect(x: view.layer.frame.midX - 150, y: view.layer.frame.midY - 150, width: newWidth, height: newHeight)
    view.layer.insertSublayer(previewLayer!, at: 0)
    
    captureSession.startRunning()
  }
  
  func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
    processSampleBuffer(sampleBuffer: sampleBuffer)
  }
  
  func processSampleBuffer(sampleBuffer: CMSampleBuffer) {
    guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {
      return
    }
    
    do {
      try sequenceHandler.perform([faceDetectionRequest], on: pixelBuffer)
      guard let faceObservation = faceDetectionRequest.results?.first as? VNFaceObservation else {
        return
      }
      let yaw = faceObservation.yaw
      if let yaw = yaw?.decimalValue {
        if yaw < -0.3 {
          // Head movement to the right (true)
          handleHeadMovement(answer: true)
        } else if yaw > 0.3 {
          // Head movement to the left (false)
          handleHeadMovement(answer: false)
        }
      }
    } catch {
      print("Error processing sample buffer: \(error)")
    }
  }
  
  func restartTracking() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
      if !self.captureSession.outputs.contains(self.videoOutput) {
        self.captureSession.addOutput(self.videoOutput)
      }
    }
  }
  
  func handleHeadMovement(answer: Bool) {
  }
  
  deinit {
  }
}
