Shoes.app do

#styling for program
  background "#FFDBAA".."#805215"
  @image = image "static/tea-icon-14700.png"
  @image.move(380,390)
  @work_label = banner "Time to work"
  @break_label = banner "Time for tea"
  @work_label.move(10,420)
  @break_label.move(10,420)
  @break_label.hide
  @work_title = 'Start Work'
  @break_title = 'Start Break'
  @counter = banner "     "
  @counter.move(380, 300)

#business logic
  @work_button = button @work_title do
    @break_button.hide
    @break_label.hide
    @work_start = Time.now
    @timer = animate(1) do |second|
      if second > 10
        @work_label.hide
        @break_button.show
        @break_label.show
        return `osascript -e 'display notification "Drink up old chap" with title "Tea Time!" sound name "Glass"'`
      else
        @counter.replace "#{(second / 60).to_s.rjust(2,'0')}:#{(second % 60).to_s.rjust(2,'0')}"
      end
    end
  end

  @break_button = button @break_title do
    @work_button.hide
    @work_label.hide
    @break_start = Time.now
    @timer = animate(1) do |second|
      if second > 10
        @break_label.hide
        @work_button.show
        @work_label.show
        return `osascript -e 'display notification "Back to the grind" with title "One more sip!" sound name "Glass"'`
      else
        @counter.replace "#{(second / 60).to_s.rjust(2,'0')}:#{(second % 60).to_s.rjust(2,'0')}"
      end
    end
  end

  @stop = button 'Stop Timer' do
    @timer.toggle
  end

  @break_button.move(10, 320)
  @stop.move(10,350)
  @work_button.move(10, 380)

end
