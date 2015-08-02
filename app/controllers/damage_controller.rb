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
       max_def = (enemy.defence * 1.3 -0.6).ceil
       min_def = (enemy.defence * 0.7).ceil
       base = enemy.hp + max_def
       if base > 150
         base = 150 + (base - 150) ** 2
       end
       doko = base.ceil
       t_u = (base / 1.2).ceil
       t_f = (base / 0.6).ceil
       hanko = (base / 0.8).ceil
       f_doko = (base / 0.8).ceil
       f_t_u = (base / 1.2 / 0.8).ceil
       f_t_f = (base / 0.6 / 0.8).ceil
       f_hanko = (base / 0.8 / 0.8).ceil
       r_doko = (base / 0.7).ceil
       r_t_u = (base / 1.2 / 0.7).ceil
       r_t_f = (base / 0.6 / 0.7).ceil
       r_hanko = (base / 0.8 / 0.7).ceil
       damage = {"doko" => doko, "t_u" => t_u, "t_f" => t_f, "hanko" => hanko,
                 "f_doko" => f_doko, "f_t_u" => f_t_u, "f_t_f" => f_t_f, "f_hanko" => f_hanko,
                 "r_doko" => r_doko, "r_t_u" => r_t_u, "r_t_f" => r_t_f, "r_hanko" => r_hanko}
       damages.push(damage)
    end
    return damages
  end
