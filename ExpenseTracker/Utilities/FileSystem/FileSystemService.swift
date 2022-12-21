import Foundation

public protocol FileSystemService {
    var fileManager: FileManager { get }

    var documentsDirectory: URL { get }

    func save(data: Data, to url: URL) throws

    func retrieve(from url: URL) throws -> Data?

    func moveFile(at sourceURL: URL, to destinationURL: URL) throws

    func deleteFile(atURL url: URL) throws

    func fileExist(atURL url: URL) -> Bool

    func deleteFileIfExists(atURL url: URL) throws
}
