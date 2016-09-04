import Foundation
import UIKit

class ArticleCommnet: UIViewController,UITextViewDelegate {
    
    internal var article:Article!
    private var textView: UITextView!
    private var toolbar: UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = AppColors.white
        self.prepareView()
        self.prepareToolBar()
        self.prepareTextView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ArticleCommnet {
    
    func prepareTextView(){
        self.textView.delegate = self
        self.textView.becomeFirstResponder()
    }
    
    func  textViewShouldBeginEditing()  {
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        return false
    }
}

extension ArticleCommnet {
    
    func prepareView(){
        textView = UITextView(frame: CGRectMake(0, 0, 0, 0))
        textView.font = .systemFontOfSize(18)
        
        self.view.addSubview(textView);
        self.textView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.view.snp_top).offset(100)
            make.left.equalTo(self.view.snp_left).offset(20)
            make.right.equalTo(self.view.snp_right).offset(-20)
            make.bottom.equalTo(self.view.snp_bottom).offset(-20)
        }
    }
}

extension ArticleCommnet {
    
    func prepareToolBar(){
        
        let saveButton = UIButton()
        saveButton.frame = CGRectMake(0,0,45,30)
        saveButton.setTitle("Save", forState: .Normal)
        saveButton.titleLabel?.font = UIFont.fontAwesomeOfSize(17)
        saveButton.setTitleColor(AppColors.green, forState: UIControlState.Normal)
        saveButton.addTarget(self, action: #selector(ArticleCommnet.save(_:)), forControlEvents: .TouchUpInside)
        let save = UIBarButtonItem(customView: saveButton)
        
        let closeButton = UIButton()
        closeButton.frame = CGRectMake(0,0,45,30)
        closeButton.setTitle("Close", forState: .Normal)
        closeButton.titleLabel?.font = UIFont.fontAwesomeOfSize(17)
        closeButton.setTitleColor(AppColors.black, forState: UIControlState.Normal)
        closeButton.addTarget(self, action: #selector(ArticleCommnet.close(_:)), forControlEvents: .TouchUpInside)
        let close = UIBarButtonItem(customView: closeButton)
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil);
        
        toolbar = UIToolbar(frame: CGRectMake(0, self.view.bounds.size.height , self.view.bounds.size.width, 50))
        toolbar.layer.position = CGPoint(x: self.view.bounds.width/2, y:50)// TODO WHY
        
        toolbar.barStyle = .Default
        toolbar.tintColor = UIColor.whiteColor()
        toolbar.backgroundColor = AppColors.black_alfa
        toolbar.items = [close, flexibleSpace, save]
        
        self.view.addSubview(toolbar)
    }
    
    func save(sender: UIButton) {
    }
    
    func close(sender: UIButton) {
        self.textView.resignFirstResponder()
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
}
