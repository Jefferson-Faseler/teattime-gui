Shoes.app do

  @button_title = 'Start Work'
  @length = 1500
  #inversed script because of order of events
  @osascript = `osascript -e 'display notification "Back to the grind" with title "One more sip!"'`

  button @button_title do
    @start_time = Time.now
    @alert_time = @start_time + @length
    @counter = para ""
    animate(1) do |second|
      if second >= @length
        def transform_page
        @counter.clear
        return @osascript
      else
        @counter.replace "#{(second / 60).to_s.rjust(2,'0')}:#{(second % 60).to_s.rjust(2,'0')}"
      end
    end
  end

  def transform_page
    @button_title = 'Start Break'
    @length = 300
    @osascript = `osascript -e 'display notification "Drink up old chap" with title "Tea Time!"'`
  end

  @work_label = para "Press ", strong("start work"), " to work towards your next cup."
  @break_label = para "Or press ", strong("start break"), " to enjoy your tea."
end
