import SwiftUI
import UIKit

class HostingController<V: View>: UIHostingController<V> {
    override func viewDidLoad() {
        print("HostingController viewDidLoad")
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("HostingController viewWillAppear")
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("HostingController viewDidAppear")
        // commenting below line out will not cause hosted view to re-render
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("HostingController viewWillDisappear")
        // commenting below line out will not cause hosted view to re-render
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("HostingController viewDidDisappear")
        super.viewDidDisappear(animated)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        print("HostingController viewWillTransition")
        super.viewWillTransition(to: size, with: coordinator)
    }
    
    override func viewDidLayoutSubviews() {
        print("HostingController viewDidLayoutSubviews")
        super.viewDidLayoutSubviews()
    }
    
    override func loadView() {
        print("HostingController loadView")
        super.loadView()
    }
    
    override func willMove(toParent parent: UIViewController?) {
        print("HostingController willMove", parent)
        super.willMove(toParent: parent)
    }
    
    override func didMove(toParent parent: UIViewController?) {
        print("HostingController didMove", parent)
        super.didMove(toParent: parent)
    }
}

class UIHostingView<V: View>: UIView {
    lazy var viewController: HostingController<V> = {
        let vc = HostingController(rootView: view)
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
        updateFrames()
    }

    private func updateFrames() {
        let screenHeight = UIScreen.main.bounds.height
        let frame = convert(bounds, to: nil)
        let y: CGFloat = frame.maxY > screenHeight ? 16 : 0

        viewController.view.frame = CGRect(x: 0, y: y, width: 300, height: 300)
        if viewController.view.superview != self {
            addSubview(viewController.view)
        }
    }
}
