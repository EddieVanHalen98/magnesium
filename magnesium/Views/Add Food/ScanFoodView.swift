//
//  ScannerView.swift
//  magnesium
//
//  Created by James Saeed on 28/12/2019.
//  Copyright © 2019 James Saeed. All rights reserved.
//

import AVFoundation
import UIKit
import SwiftUI

struct ScanFoodView: View {
    
    @ObservedObject var model = ScanFoodViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScannerView(barcode: $model.barcode)
            ScannerDetailView(barcode: $model.barcode, barcodeResult: $model.barcodeResult)
        }.navigationBarTitle("Scan", displayMode: .inline)
    }
}

private struct ScannerDetailView: View {
    
    @Binding var barcode: String?
    @Binding var barcodeResult: FoodItem?
    
    var body: some View {
        ZStack() {
            RoundedRectangle(cornerRadius: 32)
                .frame(height: 200)
                .offset(x: 0, y: 48)
                .foregroundColor(.white)
                .opacity(0.9)
            VStack(alignment: .center, spacing: 16) {
                Text(barcode ?? "Nothing to scan")
                Text(barcodeResult?.label ?? "Nothing to scan")
                    .font(.system(size: 24, weight: .semibold, design: .rounded))
                    .foregroundColor(.black)
                Button(action: {
                    // continue
                }) {
                    Text("Continue")
                }
            }.padding(.top, 64)
        }
    }
}
 
struct ScannerView: UIViewControllerRepresentable {
    
    @Binding var barcode: String?
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> ScannerViewController {
        let vc = ScannerViewController()
        
        vc.captureSession = AVCaptureSession()

        let videoCaptureDevice = AVCaptureDevice.default(for: .video)
        let videoInput = try! AVCaptureDeviceInput(device: videoCaptureDevice!)
        
        vc.captureSession.addInput(videoInput)

        let metadataOutput = AVCaptureMetadataOutput()
        vc.captureSession.addOutput(metadataOutput)
        metadataOutput.setMetadataObjectsDelegate(context.coordinator, queue: DispatchQueue.main)
        metadataOutput.metadataObjectTypes = [.qr, .ean13, .code128]
        
        vc.previewLayer = AVCaptureVideoPreviewLayer(session: vc.captureSession)
        vc.previewLayer.frame = vc.view.layer.bounds
        vc.previewLayer.videoGravity = .resizeAspectFill
        vc.view.layer.addSublayer(vc.previewLayer)

        vc.captureSession.startRunning()
        
        return vc
    }
    
    func updateUIViewController(_ uiViewController: ScannerViewController, context: Context) {
        
    }
    
    class Coordinator: NSObject, AVCaptureMetadataOutputObjectsDelegate {
        
        var parent: ScannerView
        
        init(_ scannerView: ScannerView) {
            self.parent = scannerView
        }

        func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
            if let metadataObject = metadataObjects.first {
                guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
                guard let stringValue = readableObject.stringValue else { return }
                
                parent.barcode = stringValue
            }
        }
    }
}

final class ScannerViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if (captureSession?.isRunning == false) {
            captureSession.startRunning()
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        if (captureSession?.isRunning == true) {
            captureSession.stopRunning()
        }
    }
}
