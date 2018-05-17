import Foundation
import Bugsnag

class VideoDownloadJob: AttachmentDownloadJob {
    
    override lazy var fileName: String = "\(message.messageId).\(FileManager.default.pathExtension(mimeType: message.mediaMineType ?? ""))"
    override lazy var fileUrl = MixinFile.url(ofChatDirectory: .videos, filename: fileName)
    
    init(message: Message) {
        super.init(messageId: message.messageId)
        super.message = message
    }
    
    override class func jobId(messageId: String) -> String {
        return "video-download-\(messageId)"
    }
    
    override func getJobId() -> String {
        return VideoDownloadJob.jobId(messageId: message.messageId)
    }
    
}
