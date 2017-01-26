//
//  SignatureTestViewController.swift
//  SignatureViewTest
//
//  Created by James McKowen on 1/25/17.
//  Copyright © 2017 James McKowen. All rights reserved.
//

import UIKit
import SPSignaturePad

class SignatureTestViewController : UIViewController, SPSignatureControllerDelegate {
    func userPressedBack(inController signatureController: SPSignatureController) {
        signatureController.dismiss(animated: true, completion: nil)
    }
    func userPressedDone(inController signatureController: SPSignatureController) {
        signatureController.dismiss(animated: true, completion: nil)
        print(signatureController.signatureView.getSignatureString())
    }
    @IBAction func getSignatureButtonActivated(_ sender: Any) {
        let options = SPSignaturePadOptions()
        options.initialSignature = "[{\"lx\":147,\"ly\":107,\"mx\":147,\"my\":107},{\"lx\":147,\"ly\":109,\"mx\":147,\"my\":107},{\"lx\":148,\"ly\":113,\"mx\":147,\"my\":109},{\"lx\":149,\"ly\":122,\"mx\":148,\"my\":113},{\"lx\":152,\"ly\":134,\"mx\":149,\"my\":122},{\"lx\":155,\"ly\":148,\"mx\":152,\"my\":134},{\"lx\":159,\"ly\":163,\"mx\":155,\"my\":148},{\"lx\":164,\"ly\":177,\"mx\":159,\"my\":163},{\"lx\":170,\"ly\":194,\"mx\":164,\"my\":177},{\"lx\":176,\"ly\":211,\"mx\":170,\"my\":194},{\"lx\":181,\"ly\":228,\"mx\":176,\"my\":211},{\"lx\":187,\"ly\":242,\"mx\":181,\"my\":228},{\"lx\":192,\"ly\":257,\"mx\":187,\"my\":242},{\"lx\":197,\"ly\":272,\"mx\":192,\"my\":257},{\"lx\":204,\"ly\":292,\"mx\":197,\"my\":272},{\"lx\":211,\"ly\":311,\"mx\":204,\"my\":292},{\"lx\":218,\"ly\":327,\"mx\":211,\"my\":311},{\"lx\":224,\"ly\":340,\"mx\":218,\"my\":327},{\"lx\":229,\"ly\":350,\"mx\":224,\"my\":340},{\"lx\":232,\"ly\":357,\"mx\":229,\"my\":350},{\"lx\":233,\"ly\":360,\"mx\":232,\"my\":357},{\"lx\":234,\"ly\":362,\"mx\":233,\"my\":360},{\"lx\":234,\"ly\":363,\"mx\":234,\"my\":362},{\"lx\":235,\"ly\":364,\"mx\":234,\"my\":363}]"
        options.autoScale = true
        if let signatureNavigationController = SPSignatureManager.instantiateSignatureNavigationController(withOptions: options, delegate: self) {
            self.present(signatureNavigationController, animated: true, completion: nil)
        }
    }
}
