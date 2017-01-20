Shoes.app do

  background "#FFDBAA".."#805215"
  @image = image "static/tea-icon-14700.png"
  @image.move(380,390)
  @label = banner "Time to work"
  @label.move(10,420)
  @button_title = 'Start Work'
  @length = 1500
  @counter = banner "     "
  @counter.move(380, 300)

  #inversed script because of order of events
  @osascript = `osascript -e 'display notification "Back to the grind" with title "One more sip!" sound name "Glass"'`

  @button = button @button_title do
    @start_time = Time.now
    @alert_time = @start_time + @length
    @timer = animate(1) do |second|
      if second >= @length
        transform_page
        return @osascript
      else
        @counter.replace "#{(second / 60).to_s.rjust(2,'0')}:#{(second % 60).to_s.rjust(2,'0')}"
      end
    end
  end

  @button.move(10, 380)

  @pause = button 'Pause Timer' do
    @timer.toggle
  end

  @pause.move(10,350)

  def transform_page
    if @button_title == 'Start Work'
      @button_title = 'Start Break'
      @length = 300
      @osascript = `osascript -e 'display notification "Drink up old chap" with title "Tea Time!" sound name "Glass"'`
      @label = banner "Time for tea"
    else
      @button_title = 'Start Work'
      @length = 1500
      @osascript = `osascript -e 'display notification "Back to the grind" with title "One more sip!" sound name "Glass"'`
      @label = banner "Time to work"
    end
    @counter.clear
  end

end
