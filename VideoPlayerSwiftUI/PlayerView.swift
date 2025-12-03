import SwiftUI
import AVKit

struct PlayerView: View {
    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: 0) {
                Player()
                    .frame(height: proxy.size.height / 3)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    PlayerView()
}

struct Player: UIViewControllerRepresentable {
    /// Creating AVPlayerViewController for playing the video
    func makeUIViewController(context: UIViewControllerRepresentableContext<Player>) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        let urlString = "https://example.com/stream.m3u8"
        let url = URL(string: urlString)!
        let player = AVPlayer(url: url)
        controller.player = player

        return controller
    }

    func updateUIViewController(_ uiViewController: AVPlayerViewController,
                                context: UIViewControllerRepresentableContext<Player>) { }
}
