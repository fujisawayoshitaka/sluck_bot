require "slack-notify"
require 'clockwork'
require 'active_support/time'
require 'dotenv/load'

module Clockwork
  sample = SlackNotify::Client.new(
    webhook_url: ENV["HOOK_URL"],
    channel: "#code-reading",
    username:"ベイスボール",
    icon_emoji: ":baseball:",
    link_names: 1
  )
  handler do |job|
    puts "Running #{job}"
    sample.notify("プログラミング楽しい")
  end

  #every(10.seconds, 'frequent.job')
  every(3.minutes, 'less.frequent.job')
  #every(1.hour, 'hourly.job')

end
