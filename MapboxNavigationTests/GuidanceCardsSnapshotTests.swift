import MapboxDirections
@testable import MapboxNavigation
import MapboxCoreNavigation
import SnappyShrimp
@testable import TestHelper
import Foundation

@available(iOS 11.0, *)
/// :nodoc:
class GuidanceCardsSnapshotTests: SnapshotTest {
    
    override func setUp() {
        super.setUp()
        recordMode = false
    }
    
    func testRegularManeuver() {
        let route = Fixture.route(from: "route-with-tertiary")
        
        let host = UIViewController(nibName: nil, bundle: nil)
        let container = UIView.forAutoLayout()
        let subject = InstructionsCardViewController(nibName: nil, bundle: nil)
        
        host.view.addSubview(container)
        constrain(container, to: host.view)
        
        embed(parent: host, child: subject, in: container) { (parent, cards) -> [NSLayoutConstraint] in
            cards.view.translatesAutoresizingMaskIntoConstraints = false
            return cards.view.constraintsForPinning(to: container)
        }
        
        let progress = RouteProgress(route: route, legIndex: 0, spokenInstructionIndex: 0)
        
        subject.routeProgress = progress
        
        verify(host, for: Device.iPhone6Plus.portrait)
    }
    
    func testLanesManeuver() {
        let route = Fixture.route(from: "route-with-tertiary")
        
        let host = UIViewController(nibName: nil, bundle: nil)
        let container = UIView.forAutoLayout()
        let subject = InstructionsCardViewController(nibName: nil, bundle: nil)
        
        host.view.addSubview(container)
        constrain(container, to: host.view)
        
        embed(parent: host, child: subject, in: container) { (parent, cards) -> [NSLayoutConstraint] in
            cards.view.translatesAutoresizingMaskIntoConstraints = false
            return cards.view.constraintsForPinning(to: container)
        }
        
        let progress = RouteProgress(route: route, legIndex: 0, spokenInstructionIndex: 0)
        progress.currentLegProgress.stepIndex = 1
        
        subject.routeProgress = progress
        
        verify(host, for: Device.iPhone6Plus.portrait)
    }
    
    func testTertiaryManeuver() {
        let route = Fixture.route(from: "route-with-tertiary")
        
        let host = UIViewController(nibName: nil, bundle: nil)
        let container = UIView.forAutoLayout()
        let subject = InstructionsCardViewController(nibName: nil, bundle: nil)
        
        host.view.addSubview(container)
        constrain(container, to: host.view)
        
        embed(parent: host, child: subject, in: container) { (parent, cards) -> [NSLayoutConstraint] in
            cards.view.translatesAutoresizingMaskIntoConstraints = false
            return cards.view.constraintsForPinning(to: container)
        }
        
        let progress = RouteProgress(route: route, legIndex: 0, spokenInstructionIndex: 0)
        progress.currentLegProgress.stepIndex = 5
        
        subject.routeProgress = progress
        subject.view.setNeedsDisplay()
        
        verify(host, for: Device.iPhone6Plus.portrait)
    }
}
