//
//  QRViewController.swift
//  fate
//
//  Created by xieyang on 16/1/7.
//  Copyright © 2016年 xieyang. All rights reserved.
//

import UIKit
import AVFoundation

class QRViewController: UIViewController , AVCaptureMetadataOutputObjectsDelegate, UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
    
    
    let device = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
    let session = AVCaptureSession()
    var layer: AVCaptureVideoPreviewLayer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let width = self.view.frame.width
        let height = self.view.frame.height
        self.title = "二维码扫描"
        self.view.backgroundColor = UIColor.grayColor()
        
        let labIntroudction = UILabel(frame:CGRectMake(15, 80, width-30, 50))
        labIntroudction.backgroundColor = UIColor.clearColor()
        labIntroudction.numberOfLines = 2
        labIntroudction.textColor = UIColor.whiteColor()
        labIntroudction.text = "将二维码图像置于矩形方框内，离手机摄像头10CM左右，系统会自动识别。"
        self.view.addSubview(labIntroudction)
        let imageView = UIImageView(frame:CGRectMake(10, 140, width-20, width-20))
        imageView.image = UIImage(named:"pick_bg")
        self.view.addSubview(imageView)
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.Default
        let item0 = UIBarButtonItem(image:(UIImage(named:"ocrBack.png")), style:(UIBarButtonItemStyle.Plain), target:self, action:(Selector("backClick")))
        
        
//        let item3 = UIBarButtonItem(image: UIImage(named: "")), style: (UIBarButtonItemStyle.Bordered), target: self, action: Selector("backClick")
        
        let item1 = UIBarButtonItem(image:(UIImage(named:"ocr_flash-off.png")), style:(UIBarButtonItemStyle.Plain), target:self, action:(Selector("turnTorchOn")))
        let item2 = UIBarButtonItem(image:(UIImage(named:"ocr_albums.png")), style:UIBarButtonItemStyle.Plain, target:self, action:(Selector("pickPicture")))
        
//        UIBarButtonItemStyle.Bordered
        
        let flexibleSpaceItem = UIBarButtonItem(barButtonSystemItem : (UIBarButtonSystemItem.FlexibleSpace), target: self, action: nil)
        toolBar.items = [item0,flexibleSpaceItem,item2,flexibleSpaceItem, item1]
        toolBar.frame = CGRectMake(0, height-44, width, 44)
        self.view.addSubview(toolBar)
    }
    
    func backClick(){
        
        self.dismissViewControllerAnimated(false, completion: nil)
        
    }
    func turnTorchOn(){
        self.session.stopRunning()
        viewWillAppear(true)
    }
    
    func pickPicture(){
        //判断设置是否支持图片库
        if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary){
            //初始化图片控制器
            let picker = UIImagePickerController()
            //设置代理
            picker.delegate = self
            //指定图片控制器类型
            picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            //弹出控制器，显示界面
            self.presentViewController(picker, animated: true, completion: {
                () -> Void in
            })
        }else{
            print("读取相册错误")
        }
    }
    
    //选择图片成功后代理
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject]) {
            
            //获取选择的原图
            let image = info[UIImagePickerControllerOriginalImage] as! UIImage
            
            //二维码读取
            let ciImage:CIImage=CIImage(image:image)!
            let context = CIContext(options: nil)
            let detector:CIDetector=CIDetector(ofType: CIDetectorTypeQRCode,
                context: context, options: [CIDetectorAccuracy:CIDetectorAccuracyHigh])
            let features=detector.featuresInImage(ciImage)
            print("扫描到二维码个数：\(features.count)")
            //遍历所有的二维码，并框出
            for feature in features as! [CIQRCodeFeature] {
                print(feature.messageString)
            }
            
            //图片控制器退出
            picker.dismissViewControllerAnimated(true, completion: {
                () -> Void in
                self.dismissViewControllerAnimated(false, completion: nil)
            })
    }
    
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.setupCamera()
        self.session.startRunning()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    func setupCamera(){
        self.session.sessionPreset = AVCaptureSessionPresetHigh
        
        let input = try?AVCaptureDeviceInput(device: device)
        
        if session.canAddInput(input) {
            session.addInput(input)
        }
        
        let width = self.view.frame.width-40
        
        layer = AVCaptureVideoPreviewLayer(session: session)
        layer!.videoGravity = AVLayerVideoGravityResizeAspectFill
        layer!.frame = CGRectMake(20,150,width,width);
        self.view.layer.insertSublayer(self.layer!, atIndex: 0)
        let output = AVCaptureMetadataOutput()
        output.setMetadataObjectsDelegate(self, queue: dispatch_get_main_queue())
        if session.canAddOutput(output) {
            session.addOutput(output)
            output.metadataObjectTypes = [AVMetadataObjectTypeQRCode];
        }
        
        session.startRunning()
    }
    
    func captureOutput(captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [AnyObject]!, fromConnection connection: AVCaptureConnection!){
        var stringValue:String!
        if metadataObjects.count > 0 {
            let metadataObject = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
            stringValue = metadataObject.stringValue
        }
        
        stringValue = String(stringValue!)
        
        self.session.stopRunning()
        
        
        let alertAction = UIAlertAction(title: "确认", style: UIAlertActionStyle.Default){
            (action: UIAlertAction!) -> Void in
            self.viewWillAppear(true)
        }

        //
        let alert: UIAlertController = UIAlertController(title: "二维码", message: "扫到的二维码内容为:\(stringValue)", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(alertAction)
        
        self.presentViewController(alert, animated: true, completion: nil)
        

    }

}
