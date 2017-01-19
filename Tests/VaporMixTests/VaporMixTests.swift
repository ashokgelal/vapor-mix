import XCTest
import Leaf
@testable import VaporMix

class VaporMixTests: XCTestCase {
    func testEmptyMixArgumentShouldReturnNil() {
        let mix = Mix()
        let output = try! mix.run(arguments: [])
        XCTAssertNil(output)
    }

    func testMixWithNilManifestNodeReturnsNil() {
        let mix = Mix(manifestNode: nil)
        let output = try! mix.run(arguments: [])
        XCTAssertNil(output)
    }

    func testUnVersionedPathShouldReturnCorrectPath() {
        let node = Node(["Public/js/app.js": "Public/js/app.js", "Public/css/app.css": "Public/css/app.css"])
        let mix = Mix(manifestNode: node)
        let jsOutput = try! mix.run(arguments: [.constant(value: "/js/app.js")])
        XCTAssertEqual("/js/app.js", jsOutput)
        let cssOutput = try! mix.run(arguments: [.constant(value: "/css/app.css")])
        XCTAssertEqual("/css/app.css", cssOutput)
    }

    func testVersionedPathShouldReturnCorrectPath() {
        let node = Node(["Public/js/app.js": "Public/js/app.3b93d.js", "Public/css/app.css": "Public/css/app.3b93d.css"])
        let mix = Mix(manifestNode: node)
        let jsOutput = try! mix.run(arguments: [.constant(value: "/js/app.js")])
        XCTAssertEqual("/js/app.3b93d.js", jsOutput)
        let cssOutput = try! mix.run(arguments: [.constant(value: "/css/app.css")])
        XCTAssertEqual("/css/app.3b93d.css", cssOutput)
    }

    func testNonExistentPathShouldReturnOriginalPath() {
        let node = Node(["Public/js/app.js": "Public/js/app.3b93d.js", "Public/css/app.css": "Public/css/app.3b93d.css"])
        let mix = Mix(manifestNode: node)
        let output = try! mix.run(arguments: [.constant(value: "/js/foobar.js")])
        XCTAssertEqual("/js/foobar.js", output)
    }

    func testPathWithNonLeadingSlashShouldReturnCorrectPath() {
        let node = Node(["Public/js/app.js": "Public/js/app.js", "Public/css/app.css": "Public/css/app.css"])
        let mix = Mix(manifestNode: node)
        let jsOutput = try! mix.run(arguments: [.constant(value: "js/app.js")])
        XCTAssertEqual("/js/app.js", jsOutput)
        let cssOutput = try! mix.run(arguments: [.constant(value: "css/app.css")])
        XCTAssertEqual("/css/app.css", cssOutput)
    }
}
