class DamageController < ApplicationController
  def index
  end

  def show
    @enemies = Enemy.all
    @results = calc_one(@enemies)
  end
end

private
  def calc_one(enemies)
    damages = []
    enemies.each do |enemy|
       max_def = (enemy.defence * 1.3 -0.6)
       base = enemy.hp + max_def
       doko = base.ceil
       t_u = (base / 1.2).ceil
       t_f = (base / 0.6).ceil
       hanko = (base / 0.8).ceil
       damage = {"doko" => doko, "t_u" => t_u, "t_f" => t_f, "hanko" => hanko}
       damages.push(damage)
    end
    return damages
  end
