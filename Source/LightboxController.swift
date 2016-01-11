import UIKit

public class LightboxController: UIViewController {

  public lazy var scrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.frame = UIScreen.mainScreen().bounds
    scrollView.pagingEnabled = true

    return scrollView
  }()

  public lazy var closeButton: UIButton = {
    let button = UIButton()
    return button
  }()

  public lazy var pageControl: UIPageControl = {
    let pageControl = UIPageControl()
    return pageControl
  }()

  // MARK: - Initializers

  public init(images: [UIImage]) {
    super.init(nibName: nil, bundle: nil)

    [scrollView, closeButton, pageControl].forEach { view.addSubview($0) }
    pageControl.numberOfPages = images.count

    setupFrames(images.count)
    setupControllers(images)
  }

  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - View lifecycle

  public override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = UIColor.blackColor()
  }

  // MARK: - Main methods

  public func setupFrames(imageCount: Int) {
    scrollView.contentSize.width = UIScreen.mainScreen().bounds.width * CGFloat(imageCount)
    pageControl.frame.origin = CGPoint(
      x: (UIScreen.mainScreen().bounds.width - pageControl.frame.width) / 2,
      y: UIScreen.mainScreen().bounds.height - pageControl.frame.height - 10)

  }

  public func setupControllers(images: [UIImage]) {

    for (index, image) in images.enumerate() {
      let controller = LightboxImageController(image: image)
      controller.view.frame.origin.x = UIScreen.mainScreen().bounds.width * CGFloat(index)
      controller.imageView.frame.origin.x = 2 + (UIScreen.mainScreen().bounds.width * CGFloat(index))

      scrollView.addSubview(controller.view)
    }
  }
}
