import ComposableArchitecture
import SwiftUI

public struct ___VARIABLE_MODULENAME___View: View {
    public struct State: Equatable {
        public init(state: ___VARIABLE_MODULENAME___.State) {}
    }

    let store: StoreOf<___VARIABLE_MODULENAME___>

    public var body: some View {
        WithViewStore(store, observe: ___VARIABLE_MODULENAME___View.State.init) { viewStore in
            Text("Hello world!")
        }
    }
}

#Preview("___VARIABLE_MODULENAME___View") {
    ___VARIABLE_MODULENAME___View(
        store: .init(
            initialState: ___VARIABLE_MODULENAME___.State()
        ) {
            ___VARIABLE_MODULENAME___()
        }
    ).previewLayout(.sizeThatFits)
}

