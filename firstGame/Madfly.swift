//
//  Madfly.swift
//  firstGame
//
//  Created by SooHwan.Cho on 2018. 5. 7..
//  Copyright © 2018년 Joshua.io. All rights reserved.
//

import SpriteKit

class MadFly:SKSpriteNode,GameSprite{
    
    var initialSize = CGSize(width: 61, height: 29)
    var textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "Enemies")
    var flyAnimation = SKAction()
    
    init(){
        super.init(texture: nil, color: .clear, size: initialSize)
        self.physicsBody = SKPhysicsBody(circleOfRadius: size.width / 2)
        self.physicsBody?.affectedByGravity = false
        createAnimations()
        self.run(flyAnimation)
        
        self.physicsBody?.categoryBitMask = PhysicsCategory.enemy.rawValue
        self.physicsBody?.collisionBitMask = ~PhysicsCategory.damagedPenguin.rawValue
    }
    
    func createAnimations(){
        let flyFrames:[SKTexture] = [textureAtlas.textureNamed("madfly"),textureAtlas.textureNamed("madfly-fly")]
        let flyAction = SKAction.animate(with: flyFrames, timePerFrame: 0.14)
        flyAnimation = SKAction.repeatForever(flyAction)
    }
    
    func onTap(){}
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
