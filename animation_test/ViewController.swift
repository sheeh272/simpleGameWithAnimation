//
//  ViewController.swift
//  animation_test
//
//  Created by Andrew's Laptop on 5/19/18.
//  Copyright © 2018 Andrew's Laptop. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var gameStarted = true
    var isPlayerTurn = true
    var playerHP = 100
    var enemyHP = 100

    @IBOutlet weak var viewForLayer: UIView!
    
    @IBOutlet weak var viewForLayer2: UIView!
    
    @IBOutlet weak var playerHPslider: UISlider!
    @IBOutlet weak var enemyHPslider: UISlider!
    
    @IBOutlet weak var textField: UITextView!
    
    @IBAction func newgame(_ sender: Any) {
        playerHP = 100
        enemyHP = 100
        isPlayerTurn = true
        textField.text = " "
        self.enemyHPslider.setValue(Float(self.enemyHP), animated: true)
        self.playerHPslider.setValue(Float(self.playerHP), animated: true)
    }
    
    var layer: CALayer {
        return viewForLayer.layer
    }
    
    var layer2: CALayer {
        return viewForLayer2.layer 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayer()
        setupLayer2()
        //textField.text = "game in progress"
    }
    
    func setupLayer() {
        let myImage1 = UIImage(named: "p1")?.cgImage
        layer.contents = myImage1
    }
    
    func setupLayer2() {
        let myImage2 = UIImage(named: "p1d")?.cgImage
        layer2.contents = myImage2
    }
    

    func getI(n:String) -> Any {
        let myImage = UIImage(named: n)?.cgImage
        return myImage as Any
    }
    
    func getNextAttack(n:Int){
        if(n==0){
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.Fireblast()
            }
        }
        else if(n==1){
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.waterStrike()
            }
        }
        else if(n==2){
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.lightBlast()
            }
        }
        
    }

    
    @IBAction func attack1Anim(_ sender: Any) {
        if(gameStarted && isPlayerTurn){
            isPlayerTurn = false
            let colorKeyframeAnimation = CAKeyframeAnimation(keyPath: "contents")
            colorKeyframeAnimation.values =
                [getI(n: "p1"),getI(n: "p2"),getI(n: "p3"),getI(n: "p4"),getI(n: "p5"),getI(n: "p6"),
                    getI(n: "p7"),getI(n: "p8"),getI(n: "p9"),getI(n: "p10"),getI(n: "p9"),
            getI(n: "p8"),getI(n: "p7"),getI(n: "p6"),getI(n: "p1")]
            colorKeyframeAnimation.keyTimes = [0.66,0.133,0.2,0.266,0.33,0.4,0.466,0.533,0.6,0.66,0.733,0.8,0.866,0.933,0.99]
            colorKeyframeAnimation.repeatCount = 1
            layer.add(colorKeyframeAnimation, forKey: "stickman")
            
            let damage = Int(arc4random_uniform(5)) + 7
            enemyHP -= damage
            self.enemyHPslider.setValue(Float(self.enemyHP), animated: true)
            
            if(enemyHP<=0){
                textField.text = "player won!"
            }
            else{
                let nextEnemyAttack = Int(arc4random_uniform(3))
                getNextAttack(n: nextEnemyAttack)
            }
    
        }
    }
    
    @IBAction func lunge(_ sender: Any) {
        if(gameStarted && isPlayerTurn){
        isPlayerTurn = false
        let colorKeyframeAnimation = CAKeyframeAnimation(keyPath: "contents")
        colorKeyframeAnimation.values =
            [getI(n: "p1"),getI(n: "p6"),getI(n: "p7"),getI(n: "p8"),getI(n: "p9"),
             getI(n: "p1b"),getI(n: "p2b"),getI(n: "p3b"),getI(n: "p4b"),getI(n: "p5b"),getI(n: "p6b")]
        colorKeyframeAnimation.keyTimes = [0.09,0.18,0.27,0.36,0.45,0.54,0.63,0.72,0.81,0.9,0.99]
        colorKeyframeAnimation.repeatCount = 1
        colorKeyframeAnimation.speed = 0.8
        layer.add(colorKeyframeAnimation, forKey: "stickman")
            
        let damage = Int(arc4random_uniform(10)) + 4
        enemyHP -= damage
        self.enemyHPslider.setValue(Float(self.enemyHP), animated: true)
            
        if(enemyHP<=0){
            textField.text = "player won!"
        }
        else{
            let nextEnemyAttack = Int(arc4random_uniform(3))
            getNextAttack(n: nextEnemyAttack)
            }
        }
    }
    
    @IBAction func quickDraw(_ sender: Any) {
         if(gameStarted && isPlayerTurn){
         isPlayerTurn = false
        let colorKeyframeAnimation = CAKeyframeAnimation(keyPath: "contents")
        colorKeyframeAnimation.values = [getI(n: "p1c"),getI(n: "p2c"),getI(n: "p3c"),getI(n: "p4c"),getI(n: "p5c"),
                                         getI(n: "p6c"),getI(n: "p7c"),getI(n: "p8c"),getI(n: "p9c"),getI(n: "p10c"),
                                         getI(n: "p11c"),getI(n: "p12c"),getI(n: "p13c"),getI(n: "p14c"),getI(n: "p15c"),
                                         getI(n: "p16c"),getI(n: "p17c"),getI(n: "p18c"),getI(n: "p19c"),getI(n: "p20c"),
                                         getI(n: "p21c"),getI(n: "p22c"),getI(n: "p23c"),getI(n: "p24c"),getI(n: "p25c"),
                                         getI(n: "p26c")]
        colorKeyframeAnimation.keyTimes = [0.038,0.077,0.11,0.15,0.19,0.23,0.27,0.307,0.346,0.384,0.423,0.461,
        0.5,0.538,0.576,0.615,0.653,0.692,0.73,0.769,0.807,0.846,0.884,0.923,0.961,0.999]
         colorKeyframeAnimation.speed = 0.5
        layer.add(colorKeyframeAnimation, forKey: "stickman")
            
        let damage = Int(arc4random_uniform(16))
        enemyHP -= damage
        self.enemyHPslider.setValue(Float(self.enemyHP), animated: true)
            
        if(enemyHP<=0){
            textField.text = "player won!"
        }
        else{
            let nextEnemyAttack = Int(arc4random_uniform(3))
            getNextAttack(n: nextEnemyAttack)
            }
        }
    }
    
    func Fireblast(){
        let colorKeyframeAnimation = CAKeyframeAnimation(keyPath: "contents")
        colorKeyframeAnimation.values = [getI(n: "p1d"),getI(n: "p2d"),getI(n: "p3d"),getI(n: "p4d"),getI(n: "p5d"),
                                         getI(n: "p6d"),getI(n: "p7d"),getI(n: "p8d"),getI(n: "p9d"),getI(n: "p10d"),
                                         getI(n: "p11d"),getI(n: "p12d"),getI(n: "p13d"),getI(n: "p14d"),
                                         getI(n: "p7d"),getI(n: "p1d")]
        colorKeyframeAnimation.keyTimes = [0.0625,0.125,0.1875,0.25,0.3125,0.375,0.4375,0.5,0.5623,0.625,0.6875,
                                           0.75,0.8125,0.875,0.9375,0.99]
        layer2.add(colorKeyframeAnimation, forKey: "stickman")
        
        let damage = Int(arc4random_uniform(17))
        self.playerHP -= damage
        self.playerHPslider.setValue(Float(self.playerHP), animated: true)
        
        if(playerHP<=0){
            textField.text = "NPC won!"
        }
        else{
            isPlayerTurn = true
        }
    }
    
    func waterStrike() {
        let colorKeyframeAnimation = CAKeyframeAnimation(keyPath: "contents")
        colorKeyframeAnimation.values = [getI(n: "p1d"),getI(n: "p2d"),getI(n: "p3d"),getI(n: "p1e"),getI(n: "p2e"),
                                         getI(n: "p3e"),getI(n: "p4e"),getI(n: "p5e"),getI(n: "p6e"),getI(n: "p7e"),getI(n: "p8e")]
        colorKeyframeAnimation.keyTimes = [0.09,0.18,0.27,0.36,0.45,0.54,0.63,0.72,0.81,0.9,0.99]
        colorKeyframeAnimation.speed = 0.7
        layer2.add(colorKeyframeAnimation, forKey: "stickman")
        
        let damage = Int(arc4random_uniform(11)) + 4
        self.playerHP -= damage
        self.playerHPslider.setValue(Float(self.playerHP), animated: true)
        
        if(playerHP<=0){
            textField.text = "NPC won!"
        }
        else{
            isPlayerTurn = true
        }
    }
    
    
    func lightBlast() {
        let colorKeyframeAnimation = CAKeyframeAnimation(keyPath: "contents")
        colorKeyframeAnimation.values = [getI(n: "p1f"),getI(n: "p2f"),
                                         getI(n: "p3f"),getI(n: "p4f"),getI(n: "p5f"),getI(n: "p6f"),
                                         getI(n: "p7f"),getI(n: "p8f")]
        colorKeyframeAnimation.keyTimes = [0.125,0.25,0.375,0.5,0.625,0.75,0.875,0.99]
        colorKeyframeAnimation.speed = 0.7
        layer2.add(colorKeyframeAnimation, forKey: "stickman")
        
        let damage = Int(arc4random_uniform(5)) + 8
        self.playerHP -= damage
        self.playerHPslider.setValue(Float(self.playerHP), animated: true)

        if(playerHP<=0){
            textField.text = "NPC won!"
        }
        else{
            isPlayerTurn = true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

