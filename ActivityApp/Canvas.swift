//
//  Canvas.swift
//  ActivityApp
//
//  Created by Jaheed Haynes on 4/16/20.
//  Copyright © 2020 Brendon Cecilio. All rights reserved.
//

import UIKit

class Canvas: UIView {
    
    private var strokeColor = UIColor.black
    private var strokeWidth: Float = 1
    
    func setStrokeWidth(width: Float) {
        self.strokeWidth = width
    }
    
    func setStrokeColor(color: UIColor) {
        self.strokeColor = color
    }
    
    func undo() {
        _ = lines.popLast()
        setNeedsDisplay()
    }
    
    func clear() {
        lines.removeAll()
        strokeColor = UIColor.black
        setNeedsDisplay()
    }
    
    func screenshot(){
        var image : UIImage?
        let currentLayer = UIApplication.shared.keyWindow!.layer
        let currentScale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(currentLayer.frame.size, false, currentScale);
        guard let currentContext = UIGraphicsGetCurrentContext() else {return}
        currentLayer.render(in: currentContext)
        image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        if let img = image, let imageData = img.jpegData(compressionQuality: 1.0) {
            let newActivity = CoreDataManager.shared.createMediaObect(imageData, videoURL: nil, title: "")
            UIImageWriteToSavedPhotosAlbum(img, nil, nil, nil)
        }
    }
    
    func showScreenshotEffect() {
        let snapshotView = UIView()
        snapshotView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(snapshotView)
        // full screen constraints
        let constraints:[NSLayoutConstraint] = [
            snapshotView.topAnchor.constraint(equalTo: self.topAnchor),
            snapshotView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            snapshotView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            snapshotView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        // white is generic color for flash
        snapshotView.backgroundColor = UIColor.white
        // Animate the alpha to 0 to simulate flash
        UIView.animate(withDuration: 0.2, animations: {
            snapshotView.alpha = 0
        }) { _ in
            // Once animation completed, removing it from view.
            snapshotView.removeFromSuperview()
        }
    }
    
    
    private var lines = [Line]()
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        lines.forEach { (line) in
            context.setStrokeColor(line.color.cgColor)
            context.setLineWidth(CGFloat(line.strokeWidth))
            context.setLineCap(.round)
            for (i, p) in line.points.enumerated() {
                if i == 0 {
                    context.move(to: p)
                } else {
                    context.addLine(to: p)
                }
            }
            context.strokePath()
        }
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append(Line.init(strokeWidth: strokeWidth, color: strokeColor, points: []))
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: nil) else { return }
        guard var lastLine = lines.popLast() else { return }
        lastLine.points.append(point)
        lines.append(lastLine)
        setNeedsDisplay()
    }
    
}
