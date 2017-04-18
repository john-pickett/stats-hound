module EventData

  def self.event_name
    event_name = ""
    all_events = ["pageview", "click", "new lead"]
    event_name += all_events.sample
  end

  def self.event_time
    event_time = ""
    all_times = ["2017-04-18 12:12:38", "2017-04-17 12:12:38", "2017-04-16 12:12:38", "2017-04-15 12:12:38", "2017-04-14 12:12:38", "2017-04-13 12:12:38",
    "2017-04-12 12:12:38", "2017-04-11 12:12:38", "2017-04-10 12:12:38", "2017-04-09 12:12:38", "2017-04-08 12:12:38", "2017-04-07 12:12:38", "2017-04-06 12:12:38",
      "2017-04-05 12:12:38", "2017-04-04 12:12:38"]
    event_time += all_times.sample
  end

end
