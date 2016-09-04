import UIKit
import FontAwesome_swift

class FontAwesomeTable: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    private let dataSource = FontAwesomeDataSource()
    private var fontTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepaeView()
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }
   
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  dataSource.fonts.count
    }
  
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        let font = dataSource.fonts[indexPath.row]
        cell.textLabel!.font = UIFont.fontAwesomeOfSize(50)
        cell.textLabel!.text = String.fontAwesomeIconWithCode(font.title)
        cell.detailTextLabel!.text=font.title
        return cell
    }
}

extension FontAwesomeTable {
    func prepaeView(){
        let barHeight: CGFloat = UIApplication.sharedApplication().statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        fontTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        fontTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        fontTableView.dataSource = self
        fontTableView.delegate = self
        fontTableView.rowHeight = 100.0
        self.view.addSubview(fontTableView)
    }
}
