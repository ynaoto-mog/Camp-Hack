def create_hour
    now_time = Time.zone.now
    hour = now_time.hour
    if hour >= 3 && hour > 10
      return "早朝"
    elsif hour >= 10 && hour > 17
      return "午前"
    elsif hour >= 17 && hour > 20
      return "午後"
    else
      return "夜"
    end
end