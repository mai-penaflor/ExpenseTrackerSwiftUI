import Foundation

public class AppleFileSystemService: FileSystemService {
    public static let shared = AppleFileSystemService()
    
    public let fileManager: FileManager
    public let documentsDirectory: URL

    public init(fileManager: FileManager = FileManager.default) {
        self.fileManager = fileManager
        self.documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
    }

    public func save(data: Data, to url: URL) throws {
        try data.write(to: url)
    }

    public func retrieve(from url: URL) throws -> Data? {
        return try? Data(contentsOf: url)
    }

    public func moveFile(at sourceURL: URL, to destinationURL: URL) throws {
        try fileManager.moveItem(at: sourceURL, to: destinationURL)
    }

    public func deleteFile(atURL url: URL) throws {
        try fileManager.removeItem(at: url)
    }

    public func fileExist(atURL url: URL) -> Bool {
        guard url.isFileURL else { return false }
        return fileManager.fileExists(atPath: url.path)
    }

    public func deleteFileIfExists(atURL url: URL) throws {
        if fileExist(atURL: url) {
            try deleteFile(atURL: url)
        }
    }
}
