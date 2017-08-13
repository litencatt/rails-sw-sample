class WebpushService
  def initilalize(account_id: nil)
    @account_id = account_id
  end

  def webpush_clients
    devices.each do |device|
      webpush(device)
    end
  end

  def webpush(device)
    Webpush.payload_send(
      message:  JSON.generate(message),
      endpoint: device.endpoint,
      p256dh:   device.p256dh,
      auth:     device.auth,
      ttl: 600,
      vapid: {
        subject: 'mailto:info@example.org',
        public_key:  ENV['VAPID_PUBLIC_KEY'],
        private_key: ENV['VAPID_PRIVATE_KEY']
      }
    )
  end

  def message
    {
      icon: 'http://localhost:3000/assets/icon.png',
      title: 'Push Test',
      body: 'Hello',
      target_url: 'https://www.google.co.jp'
    }
  end

  private

  def devices
    @account_id.present? ? Device.where(account_id: @account_id) : Device.all
  end
end
