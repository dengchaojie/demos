import UIKit

// error declaration
enum DownloadError: Error {
    case unauthorized
    case notEnoughtSpace(mbNeeded: Int)
}

// throw error
func downloadFile(mbFree: Int) throws {
    let userIsAuthorized = true
    let mbFileSize = 1000
    
    if !userIsAuthorized {
        throw DownloadError.unauthorized
    }else if mbFree < mbFileSize {
        throw DownloadError.notEnoughtSpace(mbNeeded: mbFileSize)
        
    }else {
        
    }
    
}

// catch error
func didPressDownloadButton() {
    do {
        try downloadFile(mbFree: 500)
    } catch DownloadError.unauthorized {
        print("unauthorized")
    } catch DownloadError.notEnoughtSpace(let mbNeeded) {
        print("need \(mbNeeded) space")
    } catch {
        print("unknown error: \(error).")
    }
    
    
}


didPressDownloadButton()

