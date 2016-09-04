
import UIKit

class CustomCell: UITableViewCell {
    
    let titleFont = UIFont(name: "HelveticaNeue", size: 16)
    let excerptFont = UIFont(name: "HelveticaNeue", size: 12)
    
    var title = UILabel()
    var excerpt = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
    
        self.title = UILabel()
        self.title.translatesAutoresizingMaskIntoConstraints = false
        self.title.text = "Name"
        self.title.font = self.titleFont
        self.title.numberOfLines = 0
        self.title.lineBreakMode = NSLineBreakMode.ByWordWrapping
        self.title.backgroundColor = AppColors.green
        self.contentView.addSubview(self.title)
        
        self.excerpt = UILabel()
        self.excerpt.translatesAutoresizingMaskIntoConstraints = false
        self.excerpt.text = "Description"
        self.excerpt.font = self.excerptFont
        self.excerpt.numberOfLines = 0
        self.excerpt.lineBreakMode = NSLineBreakMode.ByWordWrapping
        self.excerpt.backgroundColor = AppColors.green
        
        self.contentView.addSubview(self.excerpt)
        
        let viewsDict = [
            "title": self.title,
            "excerpt": self.excerpt
        ]
    
        self.contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[title]-(>=0)-|", options: [], metrics: nil, views: viewsDict))
        
        self.contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[excerpt]-|", options: [], metrics: nil, views: viewsDict))
        
        self.contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-20-[title]-20-[excerpt]-30-|", options: [], metrics: nil, views: viewsDict))
    }

    func height() -> CGFloat {
        
        let font1 = self.titleFont
        let attr1 = NSDictionary(object: font1!, forKey: NSFontAttributeName)
        let aString1 = NSAttributedString(string: self.title.text!, attributes: attr1 as? [String : AnyObject])
        
        let textRect1 = aString1.boundingRectWithSize(CGSizeMake(self.contentView.frame.width - 0, CGFloat.max), options: [NSStringDrawingOptions.UsesLineFragmentOrigin, NSStringDrawingOptions.UsesFontLeading], context: nil)
        
        let font2 = self.excerptFont
        let attr2 = NSDictionary(object: font2!, forKey: NSFontAttributeName)
        let aString2 = NSAttributedString(string: self.excerpt.text!, attributes: attr2 as? [String : AnyObject])
        
        let textRect2 = aString2.boundingRectWithSize(CGSizeMake(self.contentView.frame.width + 20, CGFloat.max), options: NSStringDrawingOptions.UsesLineFragmentOrigin, context: nil)
        
        print(textRect2.size.height)
        
        let inset: CGFloat = 20 + 20 + 30
        return textRect1.size.height + textRect2.size.height + inset
    }
   
}