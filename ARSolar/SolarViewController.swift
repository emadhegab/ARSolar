//
//  SolarViewController.swift
//  ARSolar
//
//  Created by Mohamed Emad Hegab on 2017-11-13.
//  Copyright © 2017 Mohamed Emad Hegab. All rights reserved.
//

import UIKit
import ARKit
class SolarViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    let sunPosition = SCNVector3(0, 0, -3)
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin, ARSCNDebugOptions.showFeaturePoints]
        self.sceneView.session.run(configuration)
        self.sceneView.autoenablesDefaultLighting = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Queue.background.after(0.1) {
            self.createSun()
        }
        Queue.background.after(0.1) {
            self.createMercury()
        }
        Queue.background.after(0.1) {
            self.createVenus()
        }
        Queue.background.after(0.1) {
            self.createEarth()
        }
        Queue.background.after(0.1) {
            self.createMars()
        }
        Queue.background.after(0.1) {
            self.createJupitar()
        }
        Queue.background.after(0.1) {
            self.createSaturn()
        }
        Queue.background.after(0.1) {
            self.createUranus()
        }
        Queue.background.after(0.1) {
            self.createNepton()
        }

    }

    func createSun() {
        let sun = SCNNode(geometry: SCNSphere(radius: 0.4))
        sun.geometry?.firstMaterial?.diffuse.contents = #imageLiteral(resourceName: "Sun Diffuse")
        sun.position = sunPosition
        self.sceneView.scene.rootNode.addChildNode(sun)
        let sunAction = SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 30))
        sun.runAction(sunAction)
    }

    func createMercury() {
        let mercuryParent = SCNNode()
        mercuryParent.position = sunPosition
        self.sceneView.scene.rootNode.addChildNode(mercuryParent)
        let mercury = planet(geometry: SCNSphere(radius: 0.05), diffuse: #imageLiteral(resourceName: "mercury"), specular: nil, emission: nil, normal: nil, position: SCNVector3(0.5, 0, -0.5))
        mercuryParent.addChildNode(mercury)
        let mercuryParentAction = SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 6))
        let venusAction = SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 6))
        mercuryParent.runAction(mercuryParentAction)
        mercury.runAction(venusAction)
    }

    func createVenus() {

        let venusParent = SCNNode()
        venusParent.position = sunPosition
        self.sceneView.scene.rootNode.addChildNode(venusParent)
        let venus = planet(geometry: SCNSphere(radius: 0.1), diffuse: #imageLiteral(resourceName: "venus_surface"), specular: nil, emission: #imageLiteral(resourceName: "venus_Atmospher"), normal: nil, position: SCNVector3(-1.0, 0, -1.0))
        venusParent.addChildNode(venus)
        let venusParentAction = SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 10))
        let venusAction = SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 7))
        venusParent.runAction(venusParentAction)
        venus.runAction(venusAction)
    }

    func createEarth() {
        let earthParent = SCNNode()
        earthParent.position = sunPosition
        self.sceneView.scene.rootNode.addChildNode(earthParent)
        let earth = planet(geometry: SCNSphere(radius: 0.2), diffuse: #imageLiteral(resourceName: "earth-day") , specular: #imageLiteral(resourceName: "earth-spec"), emission:  #imageLiteral(resourceName: "earth-cloud"), normal: #imageLiteral(resourceName: "earth_normal"), position: SCNVector3(1.6, 0, 1.6))
        earthParent.addChildNode(earth)
        let earthParentAction = SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 20))
        let earthAction = SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 10))

        earthParent.runAction(earthParentAction)

        earth.runAction(earthAction)
        createMoon(earth)
    }

    func createMoon(_ earth: SCNNode) {
        let moonParent = SCNNode()
        moonParent.position = earth.position
        earth.parent?.addChildNode(moonParent)

        let moon = planet(geometry: SCNSphere(radius: CGFloat(0.2 / 6)), diffuse: #imageLiteral(resourceName: "moon") , specular: nil, emission:  nil, normal: nil, position: SCNVector3(0.3, 0, 0))
        earth.addChildNode(moon)
        let moonParentAction = SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 4))
        let moonAction = SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 5))
        moonParent.runAction(moonParentAction)
        moon.runAction(moonAction)
    }

    func createMars() {
        let marsParent = SCNNode()
        marsParent.position = sunPosition
        self.sceneView.scene.rootNode.addChildNode(marsParent)
        let mars = planet(geometry: SCNSphere(radius: 0.19), diffuse: #imageLiteral(resourceName: "mars") , specular: nil, emission: nil, normal: nil, position: SCNVector3(2.3, 0, 2.3))
        marsParent.addChildNode(mars)
        let marsParentAction = SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 30))
        let marsAction = SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 13))

        marsParent.runAction(marsParentAction)
        mars.runAction(marsAction)
    }

    func createJupitar() {
        let jupiterParent = SCNNode()
        jupiterParent.position = sunPosition
        self.sceneView.scene.rootNode.addChildNode(jupiterParent)
        let jupiter = planet(geometry: SCNSphere(radius: 0.3), diffuse: #imageLiteral(resourceName: "jupiter") , specular: nil, emission: nil, normal: nil, position: SCNVector3(3.3, 0, 3.3))
        jupiterParent.addChildNode(jupiter)
        let jupiterParentAction = SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 40))
        let jupiterAction = SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 20))

        jupiterParent.runAction(jupiterParentAction)
        jupiter.runAction(jupiterAction)
    }

    func createSaturn() {
        let saturnParent = SCNNode()
        saturnParent.position = sunPosition
        self.sceneView.scene.rootNode.addChildNode(saturnParent)
        let saturn = planet(geometry: SCNSphere(radius: 0.25), diffuse: #imageLiteral(resourceName: "saturn") , specular: nil, emission: nil, normal: nil, position: SCNVector3(-4.3, 0, -4.3))
        saturnParent.addChildNode(saturn)
        let saturnParentAction = SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 50))
        let saturnAction = SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 30))

        saturnParent.runAction(saturnParentAction)
        saturn.runAction(saturnAction)
        createSaturnRings(saturn)
    }

    func createSaturnRings(_ saturn: SCNNode) {
        let rings = SCNNode(geometry: SCNTube(innerRadius: 0.30, outerRadius: 0.45, height: 0.001))
        rings.geometry?.firstMaterial?.diffuse.contents = #imageLiteral(resourceName: "saturnRings")
        rings.position = SCNVector3(0, 0, 0)
        rings.eulerAngles = SCNVector3(20.degreesToRadians, 0, 0)
        saturn.addChildNode(rings)
    }

    func createUranus() {
        let uranusParent = SCNNode()
        uranusParent.position = sunPosition
        self.sceneView.scene.rootNode.addChildNode(uranusParent)
        let uranus = planet(geometry: SCNSphere(radius: 0.25), diffuse: #imageLiteral(resourceName: "uranus") , specular: nil, emission: nil, normal: nil, position: SCNVector3(5.3, 0, 5.3))
        uranusParent.addChildNode(uranus)
        let uranusParentAction = SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 60))
        let uranusAction = SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 10))

        uranusParent.runAction(uranusParentAction)
        uranus.runAction(uranusAction)

    }

    func createNepton() {
        let neptunParent = SCNNode()
        neptunParent.position = sunPosition
        self.sceneView.scene.rootNode.addChildNode(neptunParent)
        let neptun = planet(geometry: SCNSphere(radius: 0.25), diffuse: #imageLiteral(resourceName: "neptune") , specular: nil, emission: nil, normal: nil, position: SCNVector3(6.5, 0, 6.6))
        neptunParent.addChildNode(neptun)
        let neptunParentAction = SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 80))
        let neptunAction = SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 10))

        neptunParent.runAction(neptunParentAction)
        neptun.runAction(neptunAction)

    }



    func planet(geometry: SCNGeometry, diffuse: UIImage, specular: UIImage?, emission: UIImage?, normal: UIImage?, position: SCNVector3) -> SCNNode{
        let planet = SCNNode(geometry: geometry)
        planet.geometry?.firstMaterial?.diffuse.contents = diffuse
        planet.geometry?.firstMaterial?.specular.contents = specular
        planet.geometry?.firstMaterial?.emission.contents = emission
        planet.geometry?.firstMaterial?.normal.contents = normal
        planet.position = position
        return planet
    }


}
extension Int {

    var degreesToRadians: Double { return Double(self) * .pi/180}
}



