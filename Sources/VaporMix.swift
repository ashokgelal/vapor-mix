//
// Created by Ashok Gelal on 1/17/17.
//

import Leaf
import Core
import JSON

public class Mix: BasicTag {
    public let name = "mix"
    private let publicDirName = "Public"
    private let manifestNode: Node?

    public convenience init() {
        self.init(manifestNode: nil)
    }

    init(manifestNode: Node?) {
        do {
            self.manifestNode = try manifestNode ?? Mix.loadContents(path: "mix-manifest.json")
        } catch {
            self.manifestNode = nil
            print("Couldn't find mix-manifest.json file in the root folder. Make sure the file exists.")
        }
    }

    public func run(arguments: [Argument]) throws -> Node? {
        guard arguments.count == 1,
              let assetPath = arguments.first?.value?.string,
              let manifestNode = manifestNode else {
            return nil
        }
        // if the path doesn't start with a leading '/', we'll append it for consistency
        let leadingSlash = !assetPath.hasPrefix("/") ? "/" : ""
        let assetPublicPath = "\(publicDirName)\(leadingSlash)\(assetPath)"
        guard var realPath = manifestNode[assetPublicPath]?.string else {
            print("Couldn't find a mix path for \(assetPath)")
            return Node(assetPath)
        }
        realPath.removeSubrange(publicDirName.startIndex ..< publicDirName.endIndex)
        return Node(realPath)
    }

    private static func loadContents(path: String) throws -> Node {
        let data = try DataFile().load(path: path)
        do {
            return try JSON(bytes: data).converted()
        } catch {
            throw JSONError.parse(path: path, error: error)
        }
    }
}
