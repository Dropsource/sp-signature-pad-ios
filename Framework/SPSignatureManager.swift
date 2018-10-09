import UIKit

public class SPSignatureManager {
    public class func instantiateSignatureNavigationController(withOptions options : SPSignaturePadOptions, delegate : SPSignatureControllerDelegate) -> UINavigationController? {
        guard let signatureNavigationController = UIStoryboard(name: "SPSignaturePad", bundle: Bundle(for: self)).instantiateViewController(withIdentifier: "SignatureNavigationController") as? UINavigationController, let signatureController = signatureNavigationController.childViewControllers[0] as? SPSignatureController else {
            return nil
        }
        signatureController.options = options
        signatureController.delegate = delegate
        return signatureNavigationController
    }
}
