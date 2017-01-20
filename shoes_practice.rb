Shoes.app do
  button "Start Work" do
    @start_time = Time.now
    @alert_time = @start_time + 1500
    @counter = para ""
    animate(1) do |second|
      if second >= 1500
        return `osascript -e 'display notification "Drink up old chap" with title "Tea Time!"'`
      else
        @counter.replace "#{(second / 60).to_s.rjust(2,'0')}:#{(second % 60).to_s.rjust(2,'0')}"
      end
    end
  end

  button "Start Break" do
    @start_time = Time.now
    @alert_time = Time.now + 300

    @work_label.replace "Time to work again at #{@alert_time.strftime("%I:%M%p")}"
    sleep(5)
    return `osascript -e 'display notification "Back to the grind" with title "One more sip!"'`
  end


  @work_label = para "Press ", strong("start work"), " to work towards your next cup."
  @break_label = para "Or press ", strong("start break"), " to enjoy your tea."
end
