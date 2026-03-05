import SwiftUI

struct CachedAsyncImage<Content: View, Placeholder: View>: View {
    @State private var image: UIImage? = nil
    
    let url: URL?
    let content: (Image) -> Content
    let placeholder: () -> Placeholder
    
    init(url: URL?, @ViewBuilder content: @escaping (Image) -> Content, @ViewBuilder placeholder: @escaping () -> Placeholder) {
        self.url = url
        self.content = content
        self.placeholder = placeholder
    }
    
    var body: some View {
        Group {
            if let uiImage = image {
                content(Image(uiImage: uiImage))
            } else {
                placeholder()
                    .task {
                        await loadImage()
                    }
            }
        }
    }
    
    private func loadImage() async {
        guard let url = url else { return }
        
        // Verifica no cache local
        if let cachedImage = ImageCache.shared.get(forKey: url.absoluteString) {
            self.image = cachedImage
            return
        }
        
        // Se não existir, baixa da internet
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            // Só salva se for resposta HTTP com sucesso
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode),
                  let uiImage = UIImage(data: data) else {
                return
            }
            
            // Armazena no cache
            ImageCache.shared.set(uiImage, forKey: url.absoluteString)
            
            // Atualiza estado (Main thread já fica garantida pelo @MainActor no View ou interna via SwiftUI no .task)
            await MainActor.run {
                self.image = uiImage
            }
        } catch {
            print("Erro ao carregar imagem: \(error.localizedDescription)")
        }
    }
}
