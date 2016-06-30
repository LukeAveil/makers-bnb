class MakersBnB < Sinatra::Base

  get '/calendar/:id' do
    @space = Space.first(id: params[:id])
    @available_dates = @space.available_dates.map { |d| d.date }

    calendar = Calendar.new(@available_dates)
    @date_list = calendar.list_dates

    erb :'calendar/index', layout: nil
  end

end
