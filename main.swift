
import Foundation

func createBot(repoName: String, repoURL: URL, branchName: String, sha: String, scheme: String) {
    print(repoName, repoURL, branchName, sha, scheme)
}

let arguments = CommandLine.arguments


extension Array where Element: ExpressibleByStringLiteral {
    
    func firstMatch(containing testString: String) -> String? {
        return self.filter { return ($0 as? String)?.contains(testString) == true }.first as? String
    }
    
}

guard let repoName = arguments.firstMatch(containing: "repo")?.split(separator: "=").last.flatMap({ String($0) }) else { exit(1) }
guard let branchName = arguments.firstMatch(containing: "branch")?.split(separator: "=").last.flatMap({ String($0) }) else { exit(1) }
guard let repoURL = arguments.firstMatch(containing: "repo_url")?.split(separator: "=").last.flatMap({ URL(string: String($0)) }) else { exit(1) }
guard let sha = arguments.firstMatch(containing: "sha")?.split(separator: "=").last.flatMap({ String($0) }) else { exit(1) }
guard let scheme = arguments.firstMatch(containing: "scheme")?.split(separator: "=").last.flatMap({ String($0) }) else { exit(1) }

createBot(repoName: repoName, repoURL: repoURL, branchName: branchName, sha: sha, scheme: scheme)




