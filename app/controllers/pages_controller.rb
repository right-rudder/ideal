class PagesController < ApplicationController
  def home
  end

  def become_a_pilot
    @book_download = BookDownload.new
  end

  def pilot_programs
    @book_download = BookDownload.new
  end

  def aircraft_rental
  end
  
  def fixed_wing
  end

  def rotary_wing
  end

  def airplane_training
    @book_download = BookDownload.new
  end

  def helicopter_training
    @book_download = BookDownload.new
  end

  def private_pilot
  end

  def about_us
  end

  def advanced_training

  end

  #Advanced Training Pages
  def certified_flight_instructor

  end

  def commercial_rating

  end

  def multi_engine_rating

  end

  def instrument_rating
    @advance_training = AdvanceTraining.new
  end

  def our_team
  end

  def pilot_resources
  end

  def careers
  end

  def tos
  end
end
