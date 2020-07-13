require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    text_from_user = params[:user_text]

    puts text_from_user
    @analyzed_text = TextAnalyzer.new(text_from_user)
    @key = @analyzed_text.most_used_letter.keys.first.upcase
    @value = @analyzed_text.most_used_letter.values.first
    erb :results
  end
end
