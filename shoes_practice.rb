Shoes.app do
  button "Start Work" do
    @start_time = Time.now
    @alert_time = Time.now + 1500

    @work_label.replace "Enjoy your tea, see you at #{@alert_time.strftime("%I:%M%p")}"
    sleep(5)
    return `osascript -e 'display notification "Drink up old chap" with title "Tea Time!"'`
  end

  button "Start Break" do
    @start_time = Time.now
    @alert_time = Time.now + 1500

    @work_label.replace "Enjoy your tea, see you at #{@alert_time.strftime("%I:%M%p")}"
    sleep(5)
    return `osascript -e 'display notification "Drink up old chap" with title "Tea Time!"'`
  end


  @work_label = para "Press ", strong("start work"), " to work towards your next cup."
  @break_label = para "Or press ", strong("start break"), " to enjoy your tea."
end
