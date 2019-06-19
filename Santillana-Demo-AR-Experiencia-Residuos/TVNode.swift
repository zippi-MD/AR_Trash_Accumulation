//
//  TVNode.swift
//  tvModel
//
//  Created by Carlos Daniel Hernandez Chauteco on 6/18/19.
//  Copyright © 2019 chauteco. All rights reserved.
//

import SceneKit
import SpriteKit
import AVFoundation

class TVNode: SCNNode {
    private var videoPlayer: AVPlayer!
    private var videoIsPlaying: Bool
    
    override init() {
        self.videoIsPlaying = false
        super.init()
        getGeometry()
    }
    
    func playOrPause() {
        if videoIsPlaying {
            videoPlayer.pause()
            videoIsPlaying = false
        }else {
            videoPlayer.play()
            videoIsPlaying = true
        }
        changeTexture()
    }
    
    func reset(){
        videoPlayer.seek(to: CMTime.zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func getGeometry() {
        guard let scenePath = Bundle.main.path(forResource: "telepantalla", ofType: "scn", inDirectory: "art.scnassets/Models"),let videoPath = Bundle.main.path(forResource: "Media", ofType: "mp4") else { return }
        let sceneUrl = URL(fileURLWithPath: scenePath)
        let videoUrl = URL(fileURLWithPath: videoPath)
        
        videoPlayer = AVPlayer(url: videoUrl)
        
        guard let scene = try? SCNScene(url: sceneUrl, options: nil) else { return }
        for sceneChild in scene.rootNode.childNodes{
            if sceneChild.name == "Tele" {
                self.geometry = sceneChild.geometry
                self.scale = SCNVector3(0.2, 0.2, 0.2)
                guard let screen = sceneChild.childNode(withName: "planeCine", recursively: true) else { return }
                let videoNode = SKVideoNode(avPlayer: videoPlayer)
                let videoScene = SKScene(size: CGSize(width: 1280, height: 720 ))
                videoScene.addChild(videoNode)
                screen.geometry?.firstMaterial?.diffuse.contents = videoScene
                
                videoNode.size.width = 1288
                videoNode.size.height = 720 / 2
                
                videoNode.position = CGPoint(x: 1288 / 2, y: 720 / 2)
                
                for child in sceneChild.childNodes{
                    self.addChildNode(child)
                }
            }
        }
        
        self.physicsBody = .static()
    }
    
    private func changeTexture(){
        guard let playButton = self.childNode(withName: "Play", recursively: true) else { return }
        if videoIsPlaying {
            guard let image = UIImage(named: "pausa") else { return }
            playButton.geometry?.firstMaterial?.diffuse.contents = image
        }else{
            guard let image = UIImage(named: "reproducir") else { return }
            playButton.geometry?.firstMaterial?.diffuse.contents = image
        }
    }
}
