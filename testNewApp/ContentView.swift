//
//  ContentView.swift
//  testNewApp
//
//  Created by asmaa gamal  on 16/02/2024.
//
import SwiftUI
import CoreImage
struct ContentView: View {
    // Define CIContext and CIImage properties
    let context = CIContext()
    let image: UIImage? = UIImage(named: "Image")
    let ciImage: CIImage? = CIImage(image: UIImage(named: "Image") ?? UIImage())

    var body: some View {
        VStack {
            // Use a ZStack to overlay the filtered image on top of the original image
            VStack {
                // Display the original image
                
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                }

                // Apply Core Image filter and display the filtered image
                if let ciImage = ciImage {
                    // Apply a filter (e.g., grayscale)
                    let filteredImage = applyFilter(to: ciImage)

                    // Convert CIImage to UIImage for displaying in SwiftUI
                    if let uiImage = convertCIImageToUIImage(ciImage: filteredImage) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFit()
                            .opacity(0.5) // Adjust opacity as needed
                    }
                }
            }
            .padding()

            Text("Hello, world!")
        }
        .padding()
    }

    // Function to apply Core Image filter
    private func applyFilter(to image: CIImage) -> CIImage {
        let filter = CIFilter(name: "CIColorControls")!
        filter.setValue(image, forKey: kCIInputImageKey)
        // Set filter parameters (e.g., brightness, contrast, saturation)
        filter.setValue(0.0, forKey: kCIInputBrightnessKey)
        filter.setValue(0.80, forKey: kCIInputContrastKey)
        filter.setValue(1.0, forKey: kCIInputSaturationKey)

        return filter.outputImage!
    }

    // Function to convert CIImage to UIImage
    private func convertCIImageToUIImage(ciImage: CIImage) -> UIImage? {
        let cgImage = context.createCGImage(ciImage, from: ciImage.extent)
        return cgImage.map { UIImage(cgImage: $0) }
    }
}

