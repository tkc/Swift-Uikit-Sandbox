import UIKit

class BubbleModalViewController: UIViewController {
    private var closeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        prepaeView()
    }
}

extension BubbleModalViewController {
    func prepaeView(){
        self.view.backgroundColor = AppColors.grayLightn
        closeButton = UIButton()
        closeButton.frame = CGRectMake(0,0,120,120)
        closeButton.backgroundColor = AppColors.grayLightn
        closeButton.layer.masksToBounds = true
        closeButton.setTitle("close", forState: UIControlState.Normal)
        closeButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Highlighted)
        closeButton.layer.cornerRadius = 60.0
        closeButton.addTarget(self, action: #selector(BubbleModalViewController.close(_:)), forControlEvents: .TouchUpInside)
        closeButton.layer.position = CGPoint(x: self.view.frame.width/2, y:self.view.frame.height-100)
        self.view.addSubview(closeButton)
    }
   
    internal func close(sender: UIButton){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
