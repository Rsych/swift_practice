//
//  SwitchingViewEnums.swift
//  MapKitAndBiometricAuth
//
//  Created by Ryan J. W. Kim on 2021/10/31.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        Text("Loading...")
    }
} //: LoadingView

struct SuccessView: View {
    var body: some View {
        Text("Success")
    }
} //: SuccessView

struct FailedView: View {
    var body: some View {
        Text("Failed...")
    }
} //: FailedView


struct SwitchingViewEnums: View {
    // MARK: - Properties
    enum LoadingState {
        case loading, success, failed
    } //: View State enum
    
    var loadingState = LoadingState.loading
    
    // MARK: - Body
    var body: some View {
        Group {
            if loadingState == .loading {
                LoadingView()
            } else if loadingState == .success {
                SuccessView()
            } else if loadingState == .failed {
                FailedView()
            }
        } //: Group
    }
}

struct SwitchingViewEnums_Previews: PreviewProvider {
    static var previews: some View {
        SwitchingViewEnums()
    }
}
