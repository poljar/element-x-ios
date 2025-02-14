//
// Copyright 2022 New Vector Ltd
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
@testable import ElementX
import Foundation

enum MockMediaProxyError: Error {
    case someError
}

class MockMediaProxy: MediaProxyProtocol {
    var mediaContentData: Data?
    var mediaThumbnailData: Data?
    
    func mediaSourceForURLString(_ urlString: String) -> MediaSourceProxy {
        MediaSourceProxy(urlString: "test")
    }
    
    func loadMediaContentForSource(_ source: ElementX.MediaSourceProxy) async throws -> Data {
        if let mediaContentData {
            return mediaContentData
        } else {
            throw MockMediaProxyError.someError
        }
    }
    
    func loadMediaThumbnailForSource(_ source: ElementX.MediaSourceProxy, width: UInt, height: UInt) async throws -> Data {
        if let mediaThumbnailData {
            return mediaThumbnailData
        } else {
            throw MockMediaProxyError.someError
        }
    }
}
