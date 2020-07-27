

import Foundation
import SceneKit
//stores remote transformations for an entry
class RemoteTransformation{
    var scale:Double = 1.0;
    var x=0.0;
    var y=0.0;
    var z=0.0;
    var xAng=0.0;
    var yAng=0.0;
    var zAng=0.0;
    init(){
    }
    //sets the scale of the model
    func setScale(scale:Double){
        self.scale=scale;
    }
    //set location
    func setLocation(x:Double){
        self.x=x;
    }
    func setLocation(y:Double){
        self.y=y;
    }
    func setLocation(z:Double){
        self.z=z;
    }
    func getScale() -> SCNVector3{
        return SCNVector3(self.scale,self.scale,self.scale);
    }
    func setRotation(xAng:Double){
        self.xAng=xAng;
    }
    func setRotation(yAng:Double){
        self.yAng=yAng;
    }
    func setRotation(zAng:Double){
        self.zAng=zAng;
    }
    func getRotation()->SCNVector3{
        return SCNVector3(self.xAng,self.yAng,self.zAng);
    }
    //default position is in front of and slightly below camera
    //then add transformations from there
    func getPosition() -> SCNVector3 {
        return SCNVector3(0+self.x,-2+self.y,-5+self.z);
    }
    
}
