class InsectChannel < ApplicationCable::Channel
  def subscribed
    stream_from "insect_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def insect(data)
    ActionCable.server.broadcast 'insect_channel', insect: data['image','name','discription','lat','lng','prfc']
  end

end
