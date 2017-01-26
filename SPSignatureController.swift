//
//  ViewController.swift
//  SignatureViewTest
//
//  Created by James McKowen on 1/24/17.
//  Copyright © 2017 James McKowen. All rights reserved.
//

import UIKit

public protocol SPSignatureControllerDelegate {
    func userPressedDone(inController signatureController : SPSignatureController)
    func userPressedBack(inController signatureController : SPSignatureController)
}

public class SPSignatureController: UIViewController {
    var options : SPSignaturePadOptions?
    override public func viewDidLoad() {
        self.signatureView.options = options
    }
    var delegate : SPSignatureControllerDelegate?
    @IBOutlet public weak var signatureView: SPSignaturePad!
    @IBAction func printJSONStringButtonActivated(_ sender: Any) {
        self.signatureView.clearCanvas()
    }
    @IBAction func backButtonActivated(_ sender: Any) {
        self.delegate?.userPressedBack(inController: self)
    }
    @IBAction func doneButtonActivated(_ sender: Any) {
        self.delegate?.userPressedDone(inController: self)
    }
}
