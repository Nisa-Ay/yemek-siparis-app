# Yemek Sipariş Uygulaması

Flutter ile geliştirilmiş, gerçek zamanlı bir REST API'ye bağlanan yemek sipariş uygulaması. Yemekleri listeleme, detaylarını görüntüleme, sepete ekleme ve favorilere alma gibi temel bir e-ticaret akışını uçtan uca uygular.

## Özellikler

- Yemek listesi (arama özellikli)
- Yemek detay sayfası (adet seçimi ile sepete ekleme)
- Sepet yönetimi (listeleme, silme, toplam tutar hesaplama)
- Favoriler (kalp ikonu ile ekleme/çıkarma)
- Hesabım ekranı

## Kullanılan Teknolojiler

- Flutter & Dart
- BLoC / Cubit (state management)
- Dio (HTTP istekleri)
- Google Fonts

## Mimari

Proje, Entity - Repository - Cubit katmanlarından oluşan BLoC mimarisine göre yapılandırılmıştır:

- `lib/entities` — Veri modelleri
- `lib/repositories` — API istekleri
- `lib/cubit` — State yönetimi
- `lib/views` — Ekranlar

## API

Bu proje, [kasimadalan.pe.hu](http://kasimadalan.pe.hu/yemekler/) üzerinde barındırılan halka açık bir test API'sini kullanmaktadır.

