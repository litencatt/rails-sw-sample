class DevicesController < ApplicationController
  # before_action :authenticate

  def create
    # current_user.create_device(device_params) unless current_user.subscription
    account = Account.first
    device = account.devices.find_or_initialize_by endpoint: params[:subscription][:endpoint]
    device.attributes = device_params
    device.save! if device.changed?
    WebpushService.new.webpush(device)
    head :ok
  end

  private

  def device_params
    params.require(:subscription).permit(%i(endpoint p256dh auth))
  end
end
