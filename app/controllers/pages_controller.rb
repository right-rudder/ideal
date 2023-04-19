class PagesController < ApplicationController
  def home
  end

  def become_a_pilot
  end

  def pilot_programs
  end

  def aircraft_rental
  end
  
  def fixed_wing
    @images = ['tecnam1.webp', 'tecnam2.webp', 'tecnam3.webp']
  end

  def rotary_wing
  end
end
