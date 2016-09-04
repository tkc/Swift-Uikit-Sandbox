
import UIKit
import SnapKit

class AutoLayoutTable: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var texts = AutoLayoutModel.all()
    var tableView:UITableView = UITableView()
    var scrollView :UIScrollView = UIScrollView()
    var header: UILabel = UILabel()
    var footer: UILabel = UILabel()
    var contentView: UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupView() {
        
        self.view.backgroundColor = UIColor.redColor()
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.footer.translatesAutoresizingMaskIntoConstraints = false
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.header.translatesAutoresizingMaskIntoConstraints = false
        
        self.scrollView.delegate = self
        self.scrollView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(scrollView)
        
        self.header.translatesAutoresizingMaskIntoConstraints = false
        self.header.text = "Header"
        self.header.numberOfLines = 1
        self.header.lineBreakMode = NSLineBreakMode.ByWordWrapping
        self.header.backgroundColor = AppColors.purple
        self.scrollView.addSubview(header)
        
        self.footer.text = "Footer"
        self.footer.numberOfLines = 1
        self.footer.lineBreakMode = NSLineBreakMode.ByWordWrapping
        self.footer.backgroundColor =  AppColors.purple
        self.scrollView.addSubview(footer)
        
        self.contentView.backgroundColor = UIColor.redColor()
        self.scrollView.addSubview(contentView)
        
        self.tableView = UITableView()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.userInteractionEnabled = false
        self.tableView.registerClass(AutoLayoutCustomCell.self, forCellReuseIdentifier: "Cell")
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.reloadData()
        
        self.tableView.estimatedRowHeight = 500
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.contentView.addSubview(self.tableView)
        
        autolayout()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.texts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? AutoLayoutCustomCell
        cell?.title.text = self.texts[indexPath.row].title
        cell?.excerpt.text = self.texts[indexPath.row].text
        return cell!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let cell = AutoLayoutCustomCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: nil)
        cell.title.text = self.texts[indexPath.row].title
        cell.excerpt.text = self.texts[indexPath.row].text
        return cell.height()
    }
}

extension AutoLayoutTable {
    
    func autolayout(){
        
        let viewsDict: Dictionary = [
            "mainView": self.view,
            "header": self.header,
            "footer": self.footer,
            "scrollView": self.scrollView,
            "contentView": self.contentView,
            "tableView": self.tableView
        ]
        
        let metricsDict: Dictionary = [
            "tableViewHeight": self.tableView.contentSize.height
        ]
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[scrollView(==mainView)]|", options: [], metrics: nil, views: viewsDict))
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[scrollView]-0-|", options: [], metrics: nil, views: viewsDict))
        
        self.scrollView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-20-[header]-20-|", options: [], metrics: nil, views: viewsDict))
        
        self.scrollView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-20-[footer]-20-|", options: [], metrics: nil, views: viewsDict))
        
        self.scrollView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[contentView(==scrollView)]|", options: [], metrics: nil, views: viewsDict))
        
        self.scrollView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-10-[header]-10-[contentView]-10-[footer]-10-|", options: [], metrics: nil, views: viewsDict))
        
        self.contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[tableView]|", options: [], metrics: nil, views: viewsDict))
        
        self.contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[tableView(>=tableViewHeight)]|", options: [], metrics: metricsDict, views: viewsDict))
    }
}



