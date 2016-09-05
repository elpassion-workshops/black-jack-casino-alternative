class BlackJackController < ApplicationController
  before_action :check_session, except: [:index, :new]

  def index
  end

  def new
    black_jack = BlackJackDealer.new
    session[:black_jack] = black_jack.to_yaml
    redirect_to black_jack_show_path
  end

  def show
    black_jack = YAML.load(session[:black_jack])
    @score = black_jack.player_score
    @player_cards = black_jack.player_cards
    @message = black_jack.message
  end

  def hit
    black_jack = YAML.load(session[:black_jack])
    black_jack.hit
    session[:black_jack] = black_jack.to_yaml
    redirect_to black_jack_show_path
  end

  private

  def check_session
    redirect_to home_index_path unless session[:black_jack]
  end
end
