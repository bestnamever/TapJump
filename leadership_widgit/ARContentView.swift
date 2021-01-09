//
//  ContentView.swift
//  ARtapjump
//
//  Created by Yu Hong on 2021/1/5.
//
import SwiftUI
import RealityKit
import SceneKit
import ARKit


private let kBoxWidth: CGFloat = 0.2
struct ARContentView : View {
    var body: some View {
        return ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
//
//        // Load the "Box" scene from the "Experience" Reality File
//        let boxAnchor = try! Experience.loadBox()
//        let blocks = try! BlockStops.loadBox()

        // Add the box anchor to the scene
//        let anchor = try! BlockStops.loadBox()
//        let anchor2 = try! Circlestops.loadBox()
//        let anchor3 = try! Experience.loadBox()
//
//        anchor2.setPosition(SIMD3<Float>(6, 6, 0), relativeTo: anchor)
//
//
//        arView.scene.anchors.append(anchor)
//
//
//        arView.scene.anchors.append(anchor2)
//
//        arView.scene.anchors.append(anchor3)
        let anchor = try! BlockStops.loadBox()
        
        arView.scene.anchors.append(anchor)
        
        updateUIView(arView, context: context)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        let box = try! Experience.loadBox()

        uiView.scene.anchors.append(box)
        
    }
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ARContentView()
    }
}
#endif
