import UIKit

public class SPSignaturePadOptions {
    public var initialSignature : String?
    public var autoScale = true
    public init() {
        
    }
}

public class SPSignaturePad : UIView, UIWebViewDelegate {
    var webView : UIWebView!
    var options : SPSignaturePadOptions?
    
    public func webViewDidFinishLoad(_ webView: UIWebView) {
        if let options = self.options {
            if let initialSignature = options.initialSignature {
//                print(webView.stringByEvaluatingJavaScript(from: "initialSignature=\(initialSignature)") as Any)
                webView.stringByEvaluatingJavaScript(from: "regenerateUsingString(\(initialSignature))")
            }
            webView.stringByEvaluatingJavaScript(from: "setAutoScale(\(options.autoScale))")
        }
    }
    
    public func getSignatureString() -> String {
        return webView!.stringByEvaluatingJavaScript(from: "getSignatureString()")!
    }
    
    public func regenerate(usingString signatureString : String) {
        _ = webView.stringByEvaluatingJavaScript(from: "regenerateUsingString(\(signatureString))")
    }
    
    func clearCanvas() {
        _ = webView.stringByEvaluatingJavaScript(from: "clearCanvas()")
    }
    
    init() {
        super.init(frame: CGRect.zero)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        webView = UIWebView()
        webView.scrollView.isScrollEnabled = false
        webView.scalesPageToFit = true
        webView.delegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.backgroundColor = UIColor.white
        self.addSubview(webView)
        NSLayoutConstraint.activate([webView.leftAnchor.constraint(equalTo: self.leftAnchor), webView.rightAnchor.constraint(equalTo: self.rightAnchor), webView.topAnchor.constraint(equalTo: self.topAnchor), webView.bottomAnchor.constraint(equalTo: self.bottomAnchor)])
        let url = Bundle(for: SPSignaturePad.self).url(forResource: "signaturepad", withExtension: "html")!
        webView.loadRequest(URLRequest(url: url))
    }
    
}
