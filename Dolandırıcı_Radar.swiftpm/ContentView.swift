import SwiftUI

struct Soru: Identifiable {
    let id = UUID()
    let senaryo: String
    let dolandiricilikMi: Bool
    let aciklama: String
}

let sorular: [Soru] = [
    Soru(senaryo: "Bir SMS geldi: 'Banka hesabınız askıya alındı. Doğrulamak için tıklayın: bit.ly/banka-dogrula'", dolandiricilikMi: true, aciklama: "Bankalar asla şüpheli kısa linkler üzerinden doğrulama istemez. Bu klasik bir oltalama (phishing) dolandırıcılığıdır."),
    Soru(senaryo: "Bir açılır pencere: 'Tebrikler! 1.000.000. ziyaretçisiniz! iPhone'unuzu şimdi talep edin!'", dolandiricilikMi: true, aciklama: "Sahte ödül pencereleri kişisel bilgilerinizi çalmak veya zararlı yazılım yüklemek için tasarlanmıştır."),
    Soru(senaryo: "Elektrik şirketiniz, kayıtlı e-posta adresinize doğru hesap numaranızla fatura gönderdi.", dolandiricilikMi: false, aciklama: "Bu, hizmet sağlayıcınızdan gelen meşru bir iletişim gibi görünmektedir."),
    Soru(senaryo: "Biri arayıp Microsoft'tan olduğunu, bilgisayarınızda virüs olduğunu söylüyor ve uzaktan erişim istiyor.", dolandiricilikMi: true, aciklama: "Microsoft kullanıcıları hiçbir zaman kendiliğinden aramaz. Bu yaygın bir teknik destek dolandırıcılığıdır."),
    Soru(senaryo: "Okulunuzdan, doğru alan adıyla gelen bir e-posta form doldurmanızı istiyor.", dolandiricilikMi: false, aciklama: "Doğru alan adından gelen resmi okul e-postaları genellikle meşrudur."),
    Soru(senaryo: "Bilinmeyen bir numaradan: '500 TL hediye kartı gönder, paranı garantili ikiye katlayayım!'", dolandiricilikMi: true, aciklama: "Hiç kimse paranızı anında ikiye katlayamaz. Hediye kartı ile ödeme isteği her zaman dolandırıcılıktır."),
    Soru(senaryo: "Instagram DM: 'Model ajansındanım, ünlü olabilirsin — bize kimlik fotoğrafını gönder.'", dolandiricilikMi: true, aciklama: "Meşru ajanslar DM üzerinden keşif yapmaz veya yabancılardan kimlik fotoğrafı istemez."),
    Soru(senaryo: "Bankanızın resmi uygulaması, az önce yaptığınız bir işlem için bildirim gönderdi.", dolandiricilikMi: false, aciklama: "Bankanızın resmi uygulamasından gelen işlem bildirimleri güvenlik özelliğidir, meşrudur."),
    Soru(senaryo: "E-posta: 'Netflix hesabınız iptal edilecek. Ödemenizi güncelleyin.' — gönderen: netf1ix-destek@gmail.com", dolandiricilikMi: true, aciklama: "Sahte alan adına dikkat edin (netf1ix — '1' harfiyle). Gerçek şirketler Gmail değil, resmi alan adlarını kullanır."),
    Soru(senaryo: "Bir arkadaşın, daha önce planladığınız proje toplantısı için WhatsApp'tan Google Meet linki attı.", dolandiricilikMi: false, aciklama: "Tanıdık birinden, önceden planlanmış bir toplantı için gelen link güvenlidir.")
]

struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 28) {
                Spacer()
                Image(systemName: "shield.fill")
                    .font(.system(size: 80))
                    .foregroundColor(.blue)
                VStack(spacing: 8) {
                    Text("Dolandırıcı Radar")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("Dijital dolandırıcılığı fark edebilir misin?")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                VStack(spacing: 10) {
                    BilgiSatiri(icon: "questionmark.circle.fill", metin: "\(sorular.count) gerçek hayat senaryosu", renk: .blue)
                    BilgiSatiri(icon: "checkmark.seal.fill", metin: "Her cevaba anında geri bildirim", renk: .green)
                    BilgiSatiri(icon: "lock.shield.fill", metin: "Siber güvenlik farkındalığı", renk: .purple)
                }
                .padding(.horizontal, 28)
                Spacer()
                NavigationLink(destination: QuizView()) {
                    Text("Testi Başlat")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(16)
                }
                .padding(.horizontal, 28)
                .padding(.bottom, 36)
            }
            .navigationBarHidden(true)
        }
    }
}

struct BilgiSatiri: View {
    let icon: String
    let metin: String
    let renk: Color
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon).foregroundColor(renk).frame(width: 24)
            Text(metin).font(.subheadline)
            Spacer()
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

// MARK: - QUIZ EKRANI

struct QuizView: View {
    @State private var mevcutIndex = 0
    @State private var puan = 0
    @State private var secilenCevap: Bool? = nil
    @State private var aciklamaGoster = false
    @State private var yanlisIndeksler: [Int] = []
    @State private var sonucaGit = false
    
    var mevcutSoru: Soru { sorular[mevcutIndex] }
    var ilerleme: Double { Double(mevcutIndex) / Double(sorular.count) }
    
    func cevapKontrol(_ cevap: Bool) {
        secilenCevap = cevap
        aciklamaGoster = true
        if cevap == mevcutSoru.dolandiricilikMi { puan += 1 }
        else { yanlisIndeksler.append(mevcutIndex) }
    }
    
    func sonrakiSoru() {
        if mevcutIndex < sorular.count - 1 {
            mevcutIndex += 1
            secilenCevap = nil
            aciklamaGoster = false
        } else {
            sonucaGit = true
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text("Soru \(mevcutIndex + 1) / \(sorular.count)").font(.subheadline).foregroundColor(.secondary)
                    Spacer()
                    Text("Puan: \(puan)").font(.subheadline).fontWeight(.semibold).foregroundColor(.blue)
                }
                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 4).fill(Color(.systemGray5)).frame(height: 8)
                        RoundedRectangle(cornerRadius: 4).fill(Color.blue)
                            .frame(width: geo.size.width * ilerleme, height: 8)
                            .animation(.easeInOut, value: ilerleme)
                    }
                }
                .frame(height: 8)
            }
            .padding()
            
            Spacer()
            
            VStack(spacing: 16) {
                Text("Bu dolandırıcılık mı?").font(.title2).fontWeight(.bold)
                Text(mevcutSoru.senaryo)
                    .font(.body).multilineTextAlignment(.center)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(16)
                    .padding(.horizontal)
            }
            
            Spacer()
            
            if !aciklamaGoster {
                HStack(spacing: 16) {
                    CevapButonu(baslik: "✅  Gerçek", renk: .green) { cevapKontrol(false) }
                    CevapButonu(baslik: "🚨  Dolandırıcılık", renk: .red) { cevapKontrol(true) }
                }
                .padding(.horizontal, 28)
            } else {
                let dogru = secilenCevap == mevcutSoru.dolandiricilikMi
                VStack(spacing: 16) {
                    HStack(spacing: 8) {
                        Image(systemName: dogru ? "checkmark.circle.fill" : "xmark.circle.fill")
                            .font(.title3)
                            .foregroundColor(dogru ? .green : .red)
                        Text(dogru ? "Doğru!" : "Yanlış!")
                            .font(.title3).fontWeight(.bold)
                            .foregroundColor(dogru ? .green : .red)
                    }
                    Text(mevcutSoru.aciklama)
                        .font(.subheadline).multilineTextAlignment(.center)
                        .foregroundColor(.secondary).padding(.horizontal)
                    Button(action: sonrakiSoru) {
                        Text(mevcutIndex < sorular.count - 1 ? "Sonraki Soru →" : "Sonuçları Gör")
                            .font(.headline).foregroundColor(.white)
                            .frame(maxWidth: .infinity).padding()
                            .background(Color.blue).cornerRadius(16)
                    }
                    .padding(.horizontal, 28)
                }
            }
            
            Spacer().frame(height: 30)
        }
        .navigationBarBackButtonHidden(aciklamaGoster)
        .navigationTitle("Test")
        .navigationDestination(isPresented: $sonucaGit) {
            SonucView(puan: puan, toplam: sorular.count, yanlisIndeksler: yanlisIndeksler)
        }
    }
}

struct CevapButonu: View {
    let baslik: String
    let renk: Color
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            Text(baslik).font(.headline).foregroundColor(.white)
                .frame(maxWidth: .infinity).padding()
                .background(renk).cornerRadius(16)
        }
    }
}

struct SonucView: View {
    let puan: Int
    let toplam: Int
    let yanlisIndeksler: [Int]
    @Environment(\.dismiss) var dismiss
    
    func seviyeGetir() -> String {
        let oran = Double(puan) / Double(toplam)
        if oran >= 0.9 { return "🛡️ Dolandırıcılık Uzmanı" }
        else if oran >= 0.6 { return "🔍 Bilinçli Kullanıcı" }
        else { return "⚠️ Daha Fazla Pratik Gerekli" }
    }
    
    func geriBildirimGetir() -> String {
        let oran = Double(puan) / Double(toplam)
        if oran >= 0.9 { return "Mükemmel! Dijital dolandırıcılıkları çok iyi tanıyorsun. Uyanık kal ve bu bilgiyi çevrenle paylaş." }
        else if oran >= 0.6 { return "İyi iş! Çoğunu doğru buldun. Tam koruma için öğrenmeye devam et." }
        else { return "Dolandırıcılıklar zor olabiliyor. Aşağıdaki kaçırdıklarını gözden geçir ve tekrar dene." }
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                ZStack {
                    Circle().stroke(Color(.systemGray5), lineWidth: 12).frame(width: 140, height: 140)
                    Circle()
                        .trim(from: 0, to: Double(puan) / Double(toplam))
                        .stroke(Color.blue, style: StrokeStyle(lineWidth: 12, lineCap: .round))
                        .frame(width: 140, height: 140)
                        .rotationEffect(.degrees(-90))
                        .animation(.easeInOut(duration: 1.0), value: puan)
                    VStack(spacing: 2) {
                        Text("\(puan)/\(toplam)").font(.title).fontWeight(.bold)
                        Text("Puan").font(.caption).foregroundColor(.secondary)
                    }
                }
                .padding(.top, 24)
                
                Text(seviyeGetir()).font(.title2).fontWeight(.bold)
                Text(geriBildirimGetir()).font(.body).multilineTextAlignment(.center)
                    .foregroundColor(.secondary).padding(.horizontal, 30)
                
                if !yanlisIndeksler.isEmpty {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Kaçırılan Soruları Gözden Geçir").font(.headline).padding(.horizontal)
                        ForEach(yanlisIndeksler, id: \.self) { index in
                            let s = sorular[index]
                            VStack(alignment: .leading, spacing: 8) {
                                Text(s.senaryo).font(.subheadline).fontWeight(.medium)
                                HStack(spacing: 6) {
                                    Image(systemName: s.dolandiricilikMi ? "exclamationmark.triangle.fill" : "checkmark.circle.fill")
                                        .foregroundColor(s.dolandiricilikMi ? .red : .green)
                                    Text(s.dolandiricilikMi ? "Bu bir dolandırıcılıktı" : "Bu gerçekti")
                                        .font(.caption).fontWeight(.semibold)
                                        .foregroundColor(s.dolandiricilikMi ? .red : .green)
                                }
                                Text(s.aciklama).font(.caption).foregroundColor(.secondary)
                            }
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(12)
                            .padding(.horizontal)
                        }
                    }
                }
                
                Button { dismiss() } label: {
                    Text("Tekrar Dene")
                        .font(.headline).foregroundColor(.white)
                        .frame(maxWidth: .infinity).padding()
                        .background(Color.blue).cornerRadius(16)
                }
                .padding(.horizontal, 28)
                .padding(.bottom, 40)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("Sonuçlar")
    }
}
