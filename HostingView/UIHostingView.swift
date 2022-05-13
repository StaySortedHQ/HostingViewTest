import SwiftUI
import UIKit

class UIHostingView<V: View>: UIView {
    lazy var viewController: UIHostingController<V> = {
        let vc = UIHostingController(rootView: view)
        vc.view.backgroundColor = .clear
        return vc
    }()

    var view: V {
        didSet {
            viewController.rootView = view
        }
    }
    
    init(view: V) {
        self.view = view
        super.init(frame: .zero)

        backgroundColor = .clear
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func layoutSubviews() {
        super.layoutSubviews()
        updatePageFrames()
    }

    private func updatePageFrames() {
        let screenHeight = UIScreen.main.bounds.height
        let frame = convert(bounds, to: nil)
        let y: CGFloat = frame.maxY > screenHeight ? 16 : 0

        viewController.view.frame = CGRect(x: 0, y: y, width: 300, height: 300)
        if viewController.view.superview != self {
            addSubview(viewController.view)
        }
    }
}
