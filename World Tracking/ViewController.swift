//
//  ViewController.swift
//  World Tracking
//
//  Created by Muhammad Hijazi on 06/12/2017.
//  Copyright © 2017 Muhammad Hijazi. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {

  @IBOutlet weak var sceneView: ARSCNView!
  
  override func prefersHomeIndicatorAutoHidden() -> Bool {
    return true
  }
  
  let configuration = ARWorldTrackingConfiguration()
  
  override func viewDidLoad() {
    super.viewDidLoad()

    sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
    
    sceneView.session.run(configuration)
    sceneView.autoenablesDefaultLighting = true
    
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func add(_ sender: Any) {

//    addGeometryAtRandomPlace()
//    addShapeGeometry()
//    addRelativeItems()
//    addHouse()
    
    addPlaneWithRotation()
    
  }
  
  func addPlaneWithRotation(){
    
    let plane = SCNNode(geometry: SCNPlane(width: 0.3, height: 0.3))
    plane.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
    plane.position = SCNVector3(0,0,-0.3)
    
    plane.eulerAngles = SCNVector3(0,90.degreesToRadians,0)
    
    sceneView.scene.rootNode.addChildNode(plane)
    
  }
  
  func addPyramidWithRotation(){
    
    let pyramid = SCNNode(geometry: SCNPyramid(width: 0.1, height: 0.1, length: 0.1))
    pyramid.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
    pyramid.position = SCNVector3(0,0,-0.3)
    
    pyramid.eulerAngles = SCNVector3(180.degreesToRadians,0,0)
   
    sceneView.scene.rootNode.addChildNode(pyramid)
    
    
  }
  
  func addHouse(){
    
    let boxNode = SCNNode(geometry: SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0))
    boxNode.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
    boxNode.position = SCNVector3(0,0,-0.3)
    
    let pyramidNode = SCNNode(geometry: SCNPyramid(width: 0.1, height: 0.1, length: 0.1))
    pyramidNode.geometry?.firstMaterial?.diffuse.contents = UIColor.red
    pyramidNode.position = SCNVector3(0,0.05,0)
    
    let planeNode = SCNNode(geometry: SCNPlane(width: 0.03, height: 0.06))
    planeNode.geometry?.firstMaterial?.diffuse.contents = UIColor.brown
    planeNode.position = SCNVector3(0,-0.02,0.05001)

    
    
    sceneView.scene.rootNode.addChildNode(boxNode)
    boxNode.addChildNode(pyramidNode)
    boxNode.addChildNode(planeNode)
    
    
    
  }
  
  func addRelativeItems(){
    
    let cylinderNode = SCNNode(geometry: SCNCylinder(radius: 0.05, height: 0.05))
    cylinderNode.geometry?.firstMaterial?.diffuse.contents = UIColor.red
    cylinderNode.position = SCNVector3(-0.1, 0.3, -0.2)
    
    let pyramidNode = SCNNode(geometry: SCNPyramid(width: 0.1, height: 0.1, length: 0.1))
    pyramidNode.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
    pyramidNode.geometry?.firstMaterial?.specular.contents = UIColor.white
    pyramidNode.position = SCNVector3(0, 0.1, 0)
    
    sceneView.scene.rootNode.addChildNode(cylinderNode)
    
    cylinderNode.addChildNode(pyramidNode)
    
//    sceneView.scene.rootNode.addChildNode(cylinder)
    
    
    
  }
  
  func addText(text: String){
    
    let node = SCNNode()
    
    node.geometry = SCNText(string: text, extrusionDepth: 0.2)
    
    node.geometry?.firstMaterial?.specular.contents = UIColor.white
    node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
    
    // x, y, z
    node.position = SCNVector3(0,0, -2)
    
    sceneView.scene.rootNode.addChildNode(node)
    
  }
  
  func addShapeGeometry(){
    
    let node = SCNNode()
    
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 0, y: 0))
    path.addLine(to: CGPoint(x: 0, y: 0.2))
    path.addLine(to: CGPoint(x: 0.2, y: 0.3))
    path.addLine(to: CGPoint(x: 0.4, y: 0.2))
    path.addLine(to: CGPoint(x: 0.4, y: 0.0))
    
    node.geometry = SCNShape(path: path, extrusionDepth: 0.2)

    node.geometry?.firstMaterial?.specular.contents = UIColor.white
    node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue

    // x, y, z
    node.position = SCNVector3(0,0, -0.3)
    
    sceneView.scene.rootNode.addChildNode(node)
    
  }
  
  func addGeometryAtRandomPlace(){
    
    // no shade, size, color
    let node = SCNNode()
    
    //    node.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.03)
    //    node.geometry = SCNCapsule(capRadius: 0.1, height: 0.2)
    //    node.geometry = SCNCylinder(radius: 0.01, height: 0.1)
    //    node.geometry = SCNCone(topRadius: 0, bottomRadius: 0.05, height: 0.1)
    //    node.geometry = SCNSphere(radius: 0.05)
    //    node.geometry = SCNTube(innerRadius: 0.1, outerRadius: 0.15, height: 0.3)
    //    node.geometry = SCNTorus(ringRadius: 0.3, pipeRadius: 0.01)
    //    node.geometry = SCNPlane(width: 0.1, height: 0.1)
    node.geometry = SCNPyramid(width: 0.1, height: 0.1, length: 0.1)
    
    node.geometry?.firstMaterial?.specular.contents = UIColor.white
    node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
    
    let x = randomNumbers(firstNum: -0.3, secondNum: 0.3)
    let y = randomNumbers(firstNum: -0.3, secondNum: 0.3)
    let z = randomNumbers(firstNum: -0.3, secondNum: 0.3)
    
    // x, y, z
    node.position = SCNVector3(x,y,z)
    
    sceneView.scene.rootNode.addChildNode(node)
    
  }
  
  @IBAction func reset(_ sender: Any) {
  
    restartSession()
    
  }
  
  func restartSession(){
    sceneView.session.pause()
    
    self.sceneView.scene.rootNode.enumerateChildNodes { (node, _) in
      
      node.removeFromParentNode()
      
    }
    
    sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
    
  }
  
  func randomNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat {
    
    
    return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    
    
  }
  
  
}


extension Int {
  
  var degreesToRadians: Double { return Double(self) * .pi / 180 }
  
}


