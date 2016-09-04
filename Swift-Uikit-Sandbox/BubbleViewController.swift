
import UIKit
import SnapKit
import BubbleTransition

class BubbleViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    private var transitionButton: UIButton!
    
    let transition = BubbleTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepaeView()
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .Present
        transition.startingPoint = transitionButton.center
        transition.bubbleColor = transitionButton.backgroundColor!
        return transition
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .Dismiss
        transition.startingPoint = transitionButton.center
        transition.bubbleColor = transitionButton.backgroundColor!
        return transition
    }
}

extension BubbleViewController {
    
    func prepaeView(){
        self.view.backgroundColor = AppColors.white
        transitionButton = UIButton()
        transitionButton.frame = CGRectMake(0,0,120,120)
        transitionButton.backgroundColor = AppColors.grayLightn
        transitionButton.layer.masksToBounds = true
        transitionButton.setTitle("open", forState: UIControlState.Normal)
        transitionButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Highlighted)
        transitionButton.layer.cornerRadius = 60.0
        transitionButton.layer.position = CGPoint(x: self.view.frame.width/2, y:self.view.frame.height-100)
        transitionButton.addTarget(self, action: #selector(BubbleViewController.onClickMyButton(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(transitionButton)
    }
 
    internal func onClickMyButton(sender: UIButton){
        let v:BubbleModalViewController = BubbleModalViewController();
        v.modalPresentationStyle = .Custom
        v.transitioningDelegate = self
        self.presentViewController(v, animated: true, completion: nil)
    }
}


