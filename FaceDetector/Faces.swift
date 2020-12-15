//
//  Faces.swift
//  FaceDetector
//
//  Created by Shailesh Patel on 14/12/2020.
//

import Foundation
import UIKit
import Vision

extension UIImage {
    func detectFaces(completion: @escaping ([VNFaceObservation]?) -> ()) {
        guard let image = self.cgImage else { return completion(nil) }
        let request = VNDetectFaceRectanglesRequest()
        
        DispatchQueue.global().async {
            let handler = VNImageRequestHandler(cgImage: image, orientation: self.cgImageOrientation)
            
            try? handler.perform([request])
            
            guard let observations = request.results as? [VNFaceObservation] else {
                return completion(nil)
            }
            
            completion(observations)
        }
    }
}
