module CustomData
  def users
    # TODO: why do I use class variable here?
    unless defined? @@users
      @@users = YAML.load(File.open(File.expand_path('../../../custom_data/users.yml', __FILE__)))
    end
    @@users
  end
end