import Foundation
import UIKit

struct Sample {
    
    let title: String
    let detail: String
    let classprefix: String
    
    func controller() -> UIViewController {
        let className = self.classprefix
        let aClass = NSClassFromString(className) as! UIViewController.Type
        let viewController = aClass.init()
        viewController.title = self.title
        return viewController
    }
}

struct SampleDataSource {
    let samples = [
        Sample(
            title: "BubbleTransition",
            detail: "Custom Animated Transition",
            classprefix: NSStringFromClass(BubbleViewController.self)
        ),
        Sample(
            title: "Article Table",
            detail: "Article Table Layout",
            classprefix: NSStringFromClass(ArticleTable.self)
        ),
        Sample(
            title: "FontAwesome List",
            detail: "FontAwesome Icons List",
            classprefix: NSStringFromClass(FontAwesomeTable.self)
        ),
        ]
}
