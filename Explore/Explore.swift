import SwiftUI
import CoreML
import Vision
import AVFoundation

struct Explore: View {
    @State private var isImagePickerPresented = false
    @State private var isCameraPickerPresented = false
    @State private var selectedImage: UIImage?
    @State private var classificationResult: String = "Find out your bearbrick"

    var body: some View {
        VStack(spacing: 20) {
            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                    .cornerRadius(10)
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                    .foregroundColor(.gray)
            }

            Text(classificationResult)
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding()

            HStack(spacing: 20) {
                Button("Camera") {
                    checkCameraAccess { granted in
                        if granted {
                            isCameraPickerPresented = true
                        } else {
                            classificationResult = "Camera access denied. Please enable it in Settings."
                        }
                    }
                }
                .buttonStyle(.borderedProminent)

                Button("Gallery") {
                    isImagePickerPresented = true
                }
                .buttonStyle(.borderedProminent)
            }
            .sheet(isPresented: $isCameraPickerPresented) {
                CameraPicker(selectedImage: $selectedImage, onImagePicked: classifyImage)
            }
            .sheet(isPresented: $isImagePickerPresented) {
                PhotoPicker(selectedImage: $selectedImage, onImagePicked: classifyImage)
            }
        }
        .padding()
    }

    func checkCameraAccess(completion: @escaping (Bool) -> Void) {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            classificationResult = "Camera is not available on this device."
            completion(false)
            return
        }

        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            completion(true)
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                DispatchQueue.main.async {
                    completion(granted)
                }
            }
        default:
            DispatchQueue.main.async {
                completion(false)
                classificationResult = "Camera access denied. Please enable it in Settings."
            }
        }
    }

    func classifyImage() {
        guard let image = selectedImage else {
            classificationResult = "No image selected for classification."
            return
        }
        guard let ciImage = CIImage(image: image) else {
            classificationResult = "Failed to convert image for classification."
            return
        }

        do {
            let model = try VNCoreMLModel(for: MyImageClassifier3().model)
            let request = VNCoreMLRequest(model: model) { request, _ in
                if let results = request.results as? [VNClassificationObservation],
                   let topResult = results.first {
                    classificationResult = "Prediction: \(topResult.identifier)\nConfidence: \(Int(topResult.confidence * 100))%"
                } else {
                    classificationResult = "No predictions available."
                }
            }
            let handler = VNImageRequestHandler(ciImage: ciImage)
            try handler.perform([request])
        } catch {
            classificationResult = "Error loading model: \(error.localizedDescription)"
        }
    }
}

#Preview {
    Explore()
}
