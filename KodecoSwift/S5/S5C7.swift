//
//  S5C7.swift
//  KodecoSwift
//
//  Created by GenZhang on 2023/8/29.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct S5C7: View {
    let image: Image

    init() {
        let uiImage = UIImage(named: "CoolCat") ?? UIImage()
        let filteredUIImage = S5C7.applySepiaFilter(to: uiImage)
        image = Image(uiImage: filteredUIImage)
    }

    var body: some View {
        image
        .resizable()
        .scaledToFit()
    }

    static func applySepiaFilter(to inputImage: UIImage) -> UIImage {
        guard let ciImage = CIImage(image: inputImage) else { return inputImage }
        
        // gaussianBlur, colorInvert, photoEffectMono, pixellate, sharpenLuminance, vignette, sepiaTone, photoEffectInstant, colorMonochrome, unsharpMask, bloom
        let filter = CIFilter.sepiaTone()
        filter.inputImage = ciImage
        filter.intensity = 1.0

        // Get a CIContext
        let context = CIContext()

        // Create a CGImage from the CIImage
        guard let outputCIImage = filter.outputImage,
        let cgImage = context.createCGImage(outputCIImage, from: outputCIImage.extent) else {
            return inputImage
        }

        // Create a UIImage from the CGImage
        let outputUIImage = UIImage(cgImage: cgImage)

        return outputUIImage
    }
}

struct S5C7_Previews: PreviewProvider {
    static var previews: some View {
        S5C7()
    }
}
