module SAVELOAD
  def save(game)
    puts '..saving..'
    save_file = File.open("/saves/#{game.name}.txt", 'w')
    serialized_object = Marshal.dump(game)
    save_file.write = serialized_object
    save_file.close
  end

  def load
    Player.choose_save
  end
end
