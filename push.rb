require 'bundler/setup'
require 'webpush'
require 'dotenv'

payload = {
  endpoint: "https://fcm.googleapis.com/fcm/send/d_v_nuEiJwI:APA91bGUn-OuIIRQJQxiXP6apZbpc9RsJiLARfLTla8PrhHY_ol2KP1SBDn0XegxBadQoSV2pfmqyeoSZVvoEea_0A38ErKIqXyQnxsTQwxYt8Am0xhsz2fAH6jwcDlWkSv-vAIkWH4Z",
  p256dh: "BC_AScYbyydeCKkBRw2LGdLap4pCKjDPODIluG7AIpFLCBz20Ld7y7_soHGcrqDG42H3Vba80m0I0iuObELB7FM=",
  auth: "3jr1IvPdarnqTwwt1_qoeQ==",
  ttl: 256,
  vapid: {
    subject: 'mailto:info@example.org',
    public_key: ENV['VAPID_PUBLIC_KEY'],
    private_key: ENV['VAPID_PRIVATE_KEY']
  },
  message: {
    icon: 'http://localhost:3000/assets/icon.png',
    title: 'Push Test',
    body: 'Hello',
    target_url: 'https://google.com'
  }.to_json
}
Webpush.payload_send(payload)
