//
//  CountDownButton.swift
//  zbypt
//
//  Created by ding_qili on 16/11/3.
//  Copyright © 2016年 ding_qili. All rights reserved.
//

import UIKit

open class CountDownButton: UIButton {
    var time:DispatchSourceTimer?;
    open var defaultTitile:String?{
        didSet{
            self.setTitle(defaultTitile, for: UIControlState.normal)
        }
    }
    open var downTime:Int = 60;
    
    var isResume:Bool = false;
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override open func removeFromSuperview() {
        super.removeFromSuperview()
        time?.cancel()
        time = nil
    }
    
    func setDefalut(){
        if time != nil {
            time?.cancel()
            time = nil;
        }
        time =  DispatchSource.makeTimerSource();
        time?.scheduleRepeating(deadline: DispatchTime.now(), interval: DispatchTimeInterval.seconds(1), leeway: DispatchTimeInterval.milliseconds(downTime))
    }
    
    open func resume(){
        self.isEnabled = false;
        self.isResume = true
        var timeDown = downTime;
        setDefalut()
        time?.setEventHandler {
            timeDown -= 1;
            DispatchQueue.main.async {
                self.setTitle(String(timeDown), for: UIControlState.normal)
            }
            if timeDown == 0{
                DispatchQueue.main.async {
                    self.cancel()
                }
            }
        }
        time?.resume();
    }
    
    open func cancel(){
        self.isResume = false;
        self.isEnabled = true
        self.time?.cancel()
        self.time = nil
        self.setTitle(defaultTitile, for: UIControlState.normal)
    }
    

}
