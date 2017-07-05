require 'bundler/setup'
require 'webpush'
require 'dotenv'

message = {
  icon: 'http://localhost:3000/assets/icon.png',
  title: 'Push Test',
  body: 'Hello',
  target_url: 'https://www.google.co.jp'
}

payload = {
  endpoint: "",
  message: JSON.generate(message),
  p256dh: "",
  auth: "",
  ttl: 600,
  vapid: {
    subject: 'mailto:info@example.org',
    public_key: ENV['VAPID_PUBLIC_KEY'],
    private_key: ENV['VAPID_PRIVATE_KEY']
  }
}

Webpush.payload_send(payload)
